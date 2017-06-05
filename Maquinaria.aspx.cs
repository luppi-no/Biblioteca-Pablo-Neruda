using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto
{
    public partial class cargos : System.Web.UI.Page
    {
        private static bool bBusqueda = false;
        //Capas.BL.bl_cargos C = new Capas.BL.bl_cargos();

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

        protected void dp_reglobal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((dp_reglobal.SelectedIndex == 10) || (dp_reglobal.SelectedIndex == 11) ||
                (dp_reglobal.SelectedIndex == 12) || (dp_reglobal.SelectedIndex == 13) ||
                (dp_reglobal.SelectedIndex == 14) || (dp_reglobal.SelectedIndex == 15) ||
                (dp_reglobal.SelectedIndex == 16) || (dp_reglobal.SelectedIndex == 17) ||
                (dp_reglobal.SelectedIndex == 18) || (dp_reglobal.SelectedIndex == 19) ||
                (dp_reglobal.SelectedIndex == 20) || (dp_reglobal.SelectedIndex == 21) ||
                (dp_reglobal.SelectedIndex == 22) || (dp_reglobal.SelectedIndex == 23) ||
                (dp_reglobal.SelectedIndex == 24) || (dp_reglobal.SelectedIndex == 25) ||
                (dp_reglobal.SelectedIndex == 26) || (dp_reglobal.SelectedIndex == 27) ||
                (dp_reglobal.SelectedIndex == 28) || (dp_reglobal.SelectedIndex == 29) ||
                (dp_reglobal.SelectedIndex == 30) || (dp_reglobal.SelectedIndex == 31) ||
                (dp_reglobal.SelectedIndex == 32) || (dp_reglobal.SelectedIndex == 33) ||
                (dp_reglobal.SelectedIndex == 34) || (dp_reglobal.SelectedIndex == 35) ||
                (dp_reglobal.SelectedIndex == 36) || (dp_reglobal.SelectedIndex == 37) ||
                (dp_reglobal.SelectedIndex == 38) || (dp_reglobal.SelectedIndex == 39))
            {
                tb_aprobado.Text = "Reprobado";
            }
            if ((dp_reglobal.SelectedIndex == 40) || (dp_reglobal.SelectedIndex == 41) ||
                (dp_reglobal.SelectedIndex == 42) || (dp_reglobal.SelectedIndex == 43) ||
                (dp_reglobal.SelectedIndex == 44) || (dp_reglobal.SelectedIndex == 45) ||
                (dp_reglobal.SelectedIndex == 46) || (dp_reglobal.SelectedIndex == 47) ||
                (dp_reglobal.SelectedIndex == 48) || (dp_reglobal.SelectedIndex == 49) ||
                (dp_reglobal.SelectedIndex == 50) || (dp_reglobal.SelectedIndex == 51) ||
                (dp_reglobal.SelectedIndex == 52) || (dp_reglobal.SelectedIndex == 53) ||
                (dp_reglobal.SelectedIndex == 54) || (dp_reglobal.SelectedIndex == 55) ||
                (dp_reglobal.SelectedIndex == 56) || (dp_reglobal.SelectedIndex == 57) ||
                (dp_reglobal.SelectedIndex == 58) || (dp_reglobal.SelectedIndex == 59) ||
                (dp_reglobal.SelectedIndex == 60) || (dp_reglobal.SelectedIndex == 61) ||
                (dp_reglobal.SelectedIndex == 62) || (dp_reglobal.SelectedIndex == 63) ||
                (dp_reglobal.SelectedIndex == 64) || (dp_reglobal.SelectedIndex == 65) ||
                (dp_reglobal.SelectedIndex == 66) || (dp_reglobal.SelectedIndex == 67) ||
                (dp_reglobal.SelectedIndex == 68) || (dp_reglobal.SelectedIndex == 69) ||
                (dp_reglobal.SelectedIndex == 70))
            {
                tb_aprobado.Text = "Aprobado";
            }
        }
        private void CleanModals()
        {
            tb_rut.Text = String.Empty;
            txtDate.Text = String.Empty;
            dp_reglobal.SelectedValue = "Elija Una Opción";
            dp_reevpr.SelectedValue = "Elija Una Opción";
            dp_reevte.SelectedValue = "Elija Una Opción";
            dp_categoria.SelectedValue = "Elija Una Opción";
            dp_modeloequipo.SelectedValue = "Elija Una Opción";
            dp_marcaequipo.SelectedValue = "Elija Una Opción";
            dp_evaluado.SelectedValue = "Elija Una Opción";
            dp_especialidad.SelectedValue = "Elija Una Opción";

        }

        protected void campos_vacios()
        {
            if (lberrorrut.Text == "Rut Mal Ingresado")
            {
                lbcampos.Text = "Rut Mal Ingresado";
            }
            if (dp_reglobal.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Selecciono el Resultado Global";
            }
            if (dp_reevpr.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Selecciono el Resultado de la Evaluacion Practica";
            }
            if (dp_reevte.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Selecciono el Resultado de la Evaluacion Teorica";
            }
            if (dp_categoria.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Selecciono la Categoria";
            }
            if (dp_modeloequipo.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Selecciono el Modelo del Equipo";
            }
            if (dp_marcaequipo.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Selecciono la Marca del Equipo";
            }
            if (dp_evaluado.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Selecciono Equipo";
            }
            if (dp_especialidad.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Selecciono Especialidad";
            }
            if (txtDate.Text == string.Empty)
            {
                lbcampos.Text = "No Ingreso La Fecha de la Evaluación";
            }
            if (tb_rut.Text == string.Empty)
            {
                lbcampos.Text = "No Ingreso RUT";
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

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (!validarRut(tb_rut.Text))
            {
                lberrorrut.Text = "Rut Mal Ingresado";
            }
            else
            {
                lberrorrut.Text = "";
            }
            btnNuevoRegistro.Visible = true;
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
        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }




}