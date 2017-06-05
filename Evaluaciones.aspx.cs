using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Proyecto
{
    public partial class formularios : System.Web.UI.Page
    {
        private static bool bBusqueda = false;


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
        private void CleanModals()
        {
            tb_rut.Text = String.Empty;
            tb_fecha.Text = String.Empty;
            dpalerta.SelectedValue = "Elija Una Opción";
            dpotis.SelectedValue = "Elija Una Opción";
            dppbll.SelectedValue = "Elija Una Opción";
            dptestlucho.SelectedValue = "Elija Una Opción";
            dprespsicolaboral.SelectedValue = "Elija Una Opción";
            dpresglobal.SelectedValue = "Elija Una Opción";
        }
        public bool validarRut(string rut)
        {
            bool validacion = false;
            try
            {
                rut = rut.ToUpper();
                rut = rut.Replace(".", "");
                rut = rut.Replace("-", "");
                int rutAux = int.Parse(rut.Substring(0, rut.Length - 1));

                char dv = char.Parse(rut.Substring(rut.Length - 1, 1));

                int m = 0, s = 1;
                for (; rutAux != 0; rutAux /= 10)
                {
                    s = (s + rutAux % 10 * (9 - m++ % 6)) % 11;
                }
                if (dv == (char)(s != 0 ? s + 47 : 75))
                {
                    validacion = true;
                }
            }
            catch (Exception)
            {
            }
            return validacion;
        }

        protected void tb_rut_TextChanged(object sender, EventArgs e)
        {
            if (!validarRut(tb_rut.Text))
            {
                lberrorrut.Text = "Rut Mal Ingresado";
            }
            else
            {
                lberrorrut.Text = "";
            }
            tb_rut.Text = formatearRut(tb_rut.Text);
        }
        public string formatearRut(string rut)
        {
            int cont = 0;
            string format;
            if (rut.Length == 0)
            {
                return "";
            }
            else
            {
                rut = rut.Replace(".", "");
                rut = rut.Replace("-", "");
                format = "-" + rut.Substring(rut.Length - 1);
                for (int i = rut.Length - 2; i >= 0; i--)
                {
                    format = rut.Substring(i, 1) + format;
                    cont++;
                    if (cont == 3 && i != 0)
                    {
                        format = "." + format;
                        cont = 0;
                    }
                }
                return format;
            }
        }
        protected void campos_vacios()
        {

            if (dpresglobal.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado Global";
            }
            if (dprespsicolaboral.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado de la Entrevista Psicologica";
            }
            if (dptestlucho.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado del Test de Luscher";
            }
            if (dppbll.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado de Persona Bajo la Lluvia";
            }
            if (dpalerta.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado de test de Alerta";
            }
            if (dpotis.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado de test OTIS";
            }
            if (tb_fecha.Text == String.Empty)
            {
                lbcampos.Text = "No Ingreso la Fecha";
            }
            if (tb_rut.Text == String.Empty)
            {
                lbcampos.Text = "No Ingreso el RUT";
            }
            if (lbcampos.Text == "Rut Mal Ingresado")
            {
                lbcampos.Text = "Rut Mal Ingresado";
            }
        }

        protected void bt_agregasql_Click(object sender, EventArgs e)
        {
            campos_vacios();
            if (lbcampos.Text == "")
            {
                SqlDataSource1.Insert();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "editcorrecto", "alert('Se agrego a la Persona');", true);
                CleanModals();
            }
        }

        protected void dpotis_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dpalerta.SelectedValue == "No Aplica")
            {
                lbbajoo.Visible = false;
                lbmediobajoo.Visible = false;
                lbmedioo.Visible = false;
                lbaltoo.Visible = false;
            }
        }

        protected void dpalerta_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((dpalerta.SelectedValue == "1") || (dpalerta.SelectedValue == "3") || (dpalerta.SelectedValue == "4") ||
                (dpalerta.SelectedValue == "5") || (dpalerta.SelectedValue == "7") || (dpalerta.SelectedValue == "10") ||
                (dpalerta.SelectedValue == "13"))
            {
                lbabajo.Visible = true;
                lbamediobajo.Visible = false;
                lbamedio.Visible = false;
                lbaalto.Visible = false;
                alerta.Text = "Bajo";
            }
            if ((dpalerta.SelectedValue == "16") || (dpalerta.SelectedValue == "19") || (dpalerta.SelectedValue == "23") ||
                (dpalerta.SelectedValue == "27") || (dpalerta.SelectedValue == "32") || (dpalerta.SelectedValue == "37") ||
                (dpalerta.SelectedValue == "43"))
            {
                lbabajo.Visible = false;
                lbamediobajo.Visible = true;
                lbamedio.Visible = false;
                lbaalto.Visible = false;
                alerta.Text = "Medio-Bajo";
            }
            if ((dpalerta.SelectedValue == "50") || (dpalerta.SelectedValue == "57") || (dpalerta.SelectedValue == "65") ||
                (dpalerta.SelectedValue == "71") || (dpalerta.SelectedValue == "77"))
            {
                lbabajo.Visible = false;
                lbamediobajo.Visible = false;
                lbamedio.Visible = true;
                lbaalto.Visible = false;
                alerta.Text = "Medio";
            }
            if ((dpalerta.SelectedValue == "82") || (dpalerta.SelectedValue == "88") || (dpalerta.SelectedValue == "92") ||
                (dpalerta.SelectedValue == "95") || (dpalerta.SelectedValue == "98") || (dpalerta.SelectedValue == "99") ||
                (dpalerta.SelectedValue == "100"))
            {
                lbabajo.Visible = false;
                lbamediobajo.Visible = false;
                lbamedio.Visible = false;
                lbaalto.Visible = true;
                alerta.Text = "Alto";
            }
        }
    }
}