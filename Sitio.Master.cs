using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto
{
    public partial class Sitio : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tipousuario"].ToString() == "admin")
            {
                lnkbAdministracion.Visible = true;
                lblSeparator.Visible = true;
            }

            if (!IsPostBack)
            {
                lblNombreUsuario.Text = Session["nombre"].ToString();
            }
        }

        protected void lnkbSalir_Click(object sender, EventArgs e)
        {
            try
            {
                System.Web.Security.FormsAuthentication.SignOut();
                Session.Abandon();
                Response.Redirect("login.aspx");
            }
            catch
            {
                Session.Abandon();
                Response.Redirect("login.aspx");
            }
        }

        protected void lnkbAdministracion_Click(object sender, EventArgs e)
        {
            Response.Redirect("inicioadmin.aspx");
        }
    }
}