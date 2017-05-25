using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.DirectoryServices.AccountManagement;
using System.Threading;

public class MailExchange
{
    private string sUsername = Common.GetAppSetting("CorreoUser");
    private string sPassword = Common.GetAppSetting("PasswordAdmin");
    private string sCorreo = Common.GetAppSetting("CorreoAdmin");

    private string asunto;
    public string Asunto
    {
        get { return asunto; }
        set { asunto = value; }
    }

    private string cuerpo;
    public string Cuerpo
    {
        get { return cuerpo; }
        set { cuerpo = value; }
    }

    private Hashtable destinatarios;
    public Hashtable Destinatarios
    {
        get { return destinatarios; }
        set { destinatarios = value; }
    }

    public MailExchange(string sAsunto, string sCuerpo, Hashtable htDestinatarios)
    {
        Asunto = sAsunto;
        Cuerpo = sCuerpo;
        Destinatarios = htDestinatarios;
    }

    public bool EnviaMail(out string sMess)
    {
        ActiveDirectory ad = new ActiveDirectory();
        UserPrincipal up = ad.GetUser("evaluacion");
        string sDisplayName = up.DisplayName.ToString();

        sMess = "";

        System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
        correo.From = new System.Net.Mail.MailAddress(sCorreo, sDisplayName);
        correo.To.Add("evaluacion@emin.cl");

        foreach (string mail in Destinatarios.Keys)
        {
            string address = Destinatarios[mail].ToString();
            correo.Bcc.Add(address);
        }

        correo.Bcc.Add("cshalper@emin.cl");
        correo.Bcc.Add("hjofre@emin.cl");
        correo.Subject = Asunto;
        correo.Body = Cuerpo;
        correo.IsBodyHtml = false;
        correo.Priority = System.Net.Mail.MailPriority.High;

        System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
        smtp.Host = "172.16.8.7";
        smtp.Port = 25;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new System.Net.NetworkCredential(sUsername, sPassword);
        smtp.EnableSsl = false;
        try
        {
            smtp.Send(correo);
            return true;
        }
        catch(Exception ex)
        {
            sMess = ex.Message;
            return false;
        }
    }
}