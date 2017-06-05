using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.DirectoryServices.AccountManagement;

namespace Proyecto
{
    public partial class login : System.Web.UI.Page
    {
        //Capas.BL.bl_evaluaciones E = new Capas.BL.bl_evaluaciones();

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["tipousuario"] != null)
            {
                string sTipoUsuario = Session["tipousuario"].ToString();

                if (sTipoUsuario == "admin")
                {
                    Response.Redirect("inicioadmin.aspx");
                }
                else if (sTipoUsuario == "admineva")
                {
                    Response.Redirect("inicio.aspx");
                }
                else if (sTipoUsuario == "admincapa")
                {
                    Response.Redirect("iniciocapacitacion.aspx");
                }
                else
                {
                    Response.Redirect("inicioevaluacion.aspx");
                }
            }*/
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (tbUsuario.Text == "admin")
            {
                Session["usuario"] = "18242714-4";
                Session["tipousuario"] = "admin";
                Session["nombre"] = "FUENZALIDA, FRANCISCO";

                Response.Redirect("inicio.aspx");
            }

            //if (tbUsuario.Text == "admineva")
            //{
            //    Session["usuario"] = "15511677-3";
            //    Session["tipousuario"] = "admineva";
            //    Session["nombre"] = "AdminEva";

            //    Response.Redirect("inicio.aspx");
            //}

            //if (tbUsuario.Text == "admincapa")
            //{
            //    Session["usuario"] = "10903639-0";
            //    Session["tipousuario"] = "admincapa";
            //    Session["nombre"] = "AdminCapa";

            //    Response.Redirect("iniciocapacitacion.aspx");
            //}

            //if (tbUsuario.Text == "evaluador")
            //{
            //    Session["usuario"] = "10798081-4";
            //    Session["tipousuario"] = "evaluador";
            //    Session["nombre"] = "Evaluador";

            //    Response.Redirect("inicioevaluacion.aspx");
            //}

            //if (tbUsuario.Text == "evaluado")
            //{
            //    Session["usuario"] = "13791377-1";
            //    Session["tipousuario"] = "evaluado";
            //    Session["nombre"] = "Evaluado";

            //    Response.Redirect("inicioevaluacion.aspx");
            //}

            string sUserName = tbUsuario.Text;
            string sPassword = tbPassword.Text;

            //Login(sUserName, sPassword);
        }

        /*private void Login(string sUserName, string sPassword)
        {            
            ActiveDirectory ad = new ActiveDirectory();

            bool userexists = ad.IsUserExisting(sUserName);

            if (userexists)
            {
                bool login = ad.ValidateCredentials(sUserName, sPassword);

                if (login)
                {
                    UserPrincipal upUserName = ad.GetUser(sUserName);

                    string sRut = ad.GetUserPropertyByObjectGuid(upUserName.Guid.ToString(), "postalCode");

                    bool bAdminEva = ad.IsUserGroupMember(sUserName, "grp-admineva");
                    bool bAdminCapa = ad.IsUserGroupMember(sUserName, "grp-admincapa");

                    if (bAdminEva && bAdminCapa)
                    {
                        Session["usuario"] = sRut;
                        Session["tipousuario"] = "admin";
                        Session["nombre"] = upUserName.DisplayName;

                        Response.Redirect("inicioadmin.aspx");
                    }
                    else if(bAdminEva)
                    {
                        Session["usuario"] = sRut;
                        Session["tipousuario"] = "admineva";
                        Session["nombre"] = upUserName.DisplayName;

                        Response.Redirect("inicio.aspx");
                    }
                    else if (bAdminCapa)
                    {
                        Session["usuario"] = sRut;
                        Session["tipousuario"] = "admincapa";
                        Session["nombre"] = upUserName.DisplayName;

                        Response.Redirect("iniciocapacitacion.aspx");
                    }
                    else
                    {
                        bool esevaluador = E.EsEvaluador(sUserName);

                        if (esevaluador)
                        {
                            Session["usuario"] = sRut;
                            Session["tipousuario"] = "evaluador";
                            Session["nombre"] = upUserName.DisplayName;

                            Response.Redirect("inicioevaluacion.aspx");
                        }
                        else
                        {
                            Session["usuario"] = sRut;
                            Session["tipousuario"] = "evaluado";
                            Session["nombre"] = upUserName.DisplayName;

                            Response.Redirect("inicioevaluacion.aspx");
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "usuariocontraseña", "alert('Nombre de usuario o contraseña incorrectos.');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "usuarionoexiste", "alert('El nombre de usuario ingresado no existe. Vuelva a intentarlo.');", true);
            }
        }
    }*/
    }
}