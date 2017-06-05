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

        protected void lnkbCompetencias_Click(object sender, EventArgs e)
        {
            Response.Redirect("ingreso.aspx");
        }

        protected void lnkbCentrosDeCosto_Click(object sender, EventArgs e)
        {
            Response.Redirect("centrosdecosto.aspx");
        }

        protected void lnkbAreasGerencias_Click(object sender, EventArgs e)
        {
            Response.Redirect("areas.aspx");
        }

        protected void lnkbCargos_Click(object sender, EventArgs e)
        {
            Response.Redirect("cargos.aspx");
        }

        protected void lnkbUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("usuarios.aspx");
        }

        protected void lnkbFormularios_Click(object sender, EventArgs e)
        {
            Response.Redirect("formularios.aspx");
        }

        protected void lnkbAdmEvaluaciones_Click(object sender, EventArgs e)
        {
            inicioadmin.bCapa = false;
            Response.Redirect("admevaluaciones.aspx");
        }

        protected void lnkbCorreos_Click(object sender, EventArgs e)
        {
            Response.Redirect("mail.aspx");
        }

        protected void lnkbInformes_Click(object sender, EventArgs e)
        {
            Response.Redirect("informes.aspx");
        }

        protected void lnkbPeriodos_Click(object sender, EventArgs e)
        {
            Response.Redirect("periodoevaluacion.aspx");
        }

        protected void lnkbHistorial_Click(object sender, EventArgs e)
        {
            Response.Redirect("historialevaluaciones.aspx");
        }
    }
}