using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Proyecto
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        Capas.BL.bl_trabajo Cargo = new Capas.BL.bl_trabajo();

        public int NewSelectIndex { get; set; }

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

        protected void tb_buscar_TextChanged(object sender, EventArgs e)
        {
            tb_apellido.Text = String.Empty;
            DropDownList1.SelectedValue = "Elija Una Opción";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string rutcargo = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
            Response.Redirect(string.Format("FichaCurricular.aspx?code="+rutcargo));
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rutcargo = GridView2.Rows[GridView2.SelectedIndex].Cells[0].Text;
            Response.Redirect(string.Format("FichaCurricular.aspx?code=" + rutcargo));
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rutcargo = GridView3.Rows[GridView3.SelectedIndex].Cells[0].Text;
            Response.Redirect(string.Format("FichaCurricular.aspx?code=" + rutcargo));
        }

        protected void tb_apellido_TextChanged(object sender, EventArgs e)
        {
            tb_buscar.Text = String.Empty;
            DropDownList1.SelectedValue = "Elija Una Opción";
        }

        protected void bt_apellido_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string rutcargo = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
            Response.Redirect(string.Format("FichaCurricular.aspx?code=" + rutcargo));
            
            Response.Redirect(string.Format(""+rutcargo));
        }

        protected void Especialidad_Click(object sender, EventArgs e)
        {
            Response.Redirect("buscarevaluacion.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            tb_buscar.Text = String.Empty;
            tb_apellido.Text = String.Empty;

        }
    }
}