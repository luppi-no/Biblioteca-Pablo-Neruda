using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Proyecto
{
    public partial class mail : System.Web.UI.Page
    {
        private static Hashtable htDestinatarios = new Hashtable();
        Capas.BL.bl_usuarios U = new Capas.BL.bl_usuarios();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tipousuario"] != null)
            {
                string sTipoUsuario = Session["tipousuario"].ToString();

                if ((sTipoUsuario != "admineva") && (sTipoUsuario != "admin"))
                {
                    Response.Redirect("inicioevaluacion.aspx");
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                LoadGridViewData();
                CleanHashtable();
            }
        }

        protected void cbDestinatario_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow gr = (GridViewRow)chk.Parent.Parent;
            string sCorreo = gr.Cells[2].Text;

            if (chk.Checked)
            {
                htDestinatarios.Add(sCorreo, sCorreo);
            }
            else
            {
                htDestinatarios.Remove(sCorreo);
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            CleanHashtable();

            MailExchange me = new MailExchange(tbAsunto.Text, txtaCuerpo.InnerText, htDestinatarios);
            string sMess = "";
            bool enviar = me.EnviaMail(out sMess);

            if (enviar)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "correook", "alert('El correo se ha enviado con éxito.');", true);
                LoadGridViewData();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "correonok", "alert('Error al enviar el correo: "+sMess+"');", true);
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            CleanModals();
        }

        private void LoadGridViewData()
        {
            gvMailUsuario.DataSource = U.ObtenerUsuario("usuariocorreo", "", "");
            gvMailUsuario.DataBind();
        }

        private void CleanHashtable()
        {
            htDestinatarios.Clear();
        }

        private void CleanModals()
        {
            tbAsunto.Text = String.Empty;
            txtaCuerpo.InnerText = String.Empty;
        }
    }
}