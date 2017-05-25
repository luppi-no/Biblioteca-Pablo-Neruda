using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto
{
    public partial class inicio : System.Web.UI.Page
    {
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
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("mail.aspx");
        }
    }
}