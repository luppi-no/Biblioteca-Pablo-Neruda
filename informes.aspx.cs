using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace Proyecto
{
    public partial class informes : System.Web.UI.Page
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
        }

        protected void btnCargarInforme_Click(object sender, EventArgs e)
        {
            LoadReports(ddlInforme.SelectedValue);
        }

        private void LoadReports(string idreporte)
        {
            if (idreporte == "0")
            {
                rptvw.ProcessingMode = ProcessingMode.Remote;
                rptvw.ServerReport.ReportServerUrl = new Uri("http://172.16.8.50/reportserver");
                rptvw.ServerReport.ReportPath = "/R2";
                rptvw.ServerReport.Refresh();
                rptvw.SizeToReportContent = true;
            }
            if (idreporte == "1")
            {
                rptvw.ProcessingMode = ProcessingMode.Remote;
                rptvw.ServerReport.ReportServerUrl = new Uri("http://172.16.8.50/reportserver");
                rptvw.ServerReport.ReportPath = "/R3";
                rptvw.ServerReport.Refresh();
                rptvw.SizeToReportContent = true;
            }
            if (idreporte == "2")
            {
                rptvw.ProcessingMode = ProcessingMode.Remote;
                rptvw.ServerReport.ReportServerUrl = new Uri("http://172.16.8.50/reportserver");
                rptvw.ServerReport.ReportPath = "/R1";
                rptvw.ServerReport.Refresh();
                rptvw.SizeToReportContent = true;
            }
        }
    }
}