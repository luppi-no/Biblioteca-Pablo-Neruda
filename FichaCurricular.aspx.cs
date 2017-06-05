using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        private string RutCargo
        {
            get { return (string)Session["rutcargo"]; }            
        }
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

        protected void imgPopup_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void tb_rut_TextChanged(object sender, EventArgs e)
        {
            

        }
        
        
    }
}