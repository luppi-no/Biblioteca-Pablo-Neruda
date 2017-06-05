using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;
using System.Text;
using System.IO;
using System.Web.UI.HtmlControls;
namespace Proyecto
{
    public partial class buscarevaluacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["tipousuario"] != null)
            {
                string sTipoUsuario = Session["tipousuario"].ToString();

                if (sTipoUsuario != "admin")
                {
                    Response.Redirect("Buscar.aspx");
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Elija una Opcion")
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
            }
            if (DropDownList1.SelectedValue == "Evaluacion Psicolaboral")
            {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
            }
            if (DropDownList1.SelectedValue == "Evaluacion Geosinteticos")
            {
                GridView1.Visible = false;
                GridView2.Visible = true;
                GridView3.Visible = false;
            }
            if (DropDownList1.SelectedValue == "Evaluacion Maquinarias")
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = true;
            }
            if (DropDownList1.SelectedValue == "Todas las Evaluaciones")
            {
                GridView1.Visible = true;
                GridView2.Visible = true;
                GridView3.Visible = true;
            }

        }

        protected void Especialidad_Click(object sender, EventArgs e)
        {
            Response.Redirect("buscar.aspx");
        }


    }
}