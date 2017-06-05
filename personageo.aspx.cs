using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto
{
    public partial class personageo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tipousuario"] != null)
            {
                string sTipoUsuario = Session["tipousuario"].ToString();

                if (sTipoUsuario != "admin")
                {
                    Response.Redirect("default.aspx");
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
    }
}