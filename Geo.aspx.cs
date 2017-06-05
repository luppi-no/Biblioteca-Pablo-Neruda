using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Proyecto
{
    public partial class Geo : System.Web.UI.Page
    {
        //Capas.BL.bl_geo Geo = new Capas.BL.bl_geo();

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

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            btnNuevoRegistro.Visible = true;
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
        private void CleanModals()
        {
            tb_rut.Text = String.Empty;
            tb_fecha.Text = String.Empty;
            dp_eqeva.SelectedValue = "Elija Una Opción";
            dp_maeq.SelectedValue = "Elija Una Opción";
            dp_moeq.SelectedValue = "Elija Una Opción";
            dp_suev.SelectedValue = "Elija Una Opción";
            dp_reevteo.SelectedValue = "Elija Una Opción";
            dp_reevpra.SelectedValue = "Elija Una Opción";
            dp_global.SelectedValue = "Elija Una Opción";
            nota.Text = "";
            btnNuevoRegistro.Visible = false;
        }
        protected void campos_vacios()
        {
            if (dp_global.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado Global";
            }
            if (dp_reevpra.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado de la Evaluacion Practica";
            }
            if (dp_reevteo.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Resultado de la Evaluacion Teorica";
            }
            if (dp_suev.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso la Superficie Evaluada";
            }
            if (dp_moeq.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Modelo del Equipo";
            }
            if (dp_maeq.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso la Marca del Equipo";
            }
            if (dp_eqeva.SelectedValue == "Elija Una Opción")
            {
                lbcampos.Text = "No Ingreso el Equipo Evaluado";
            }
            if (tb_fecha.Text == String.Empty)
            {
                lbcampos.Text = "No Ingreso la Fecha de la Evaluacion";
            }
            if (tb_rut.Text == String.Empty)
            {
                lbcampos.Text = "No Ingreso el RUT";
            }
            if (lberrorrut.Text == "Rut Mal Ingresado")
            {
                lbcampos.Text = "Rut Mal Ingresado";
            }
        }
        protected void calculo()
        {
            if ((dp_reevteo.SelectedValue != "No Aplica") && (dp_reevteo.SelectedValue != "Elija Una Opción"))
            {
                float valor1;
                float valor2;
                double resultado;
                double mul1;
                double mul2;
                valor1 = Convert.ToInt32(dp_reevteo.SelectedValue);
                valor2 = Convert.ToInt32(dp_reevpra.SelectedValue);
                mul1 = valor1 * 0.4;
                mul2 = valor2 * 0.6;
                resultado = mul1 + mul2;
                nota.Text = "La nota es: " + Convert.ToString(resultado);
                tb_nota.Text = Convert.ToString(resultado);

                if (resultado < 85)
                {
                    dp_global.SelectedValue = "Reprobado";
                }
                if (resultado > 85)
                {
                    dp_global.SelectedValue = "Aprobado";
                }
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

        protected void dp_reevpra_SelectedIndexChanged(object sender, EventArgs e)
        {
            calculo();
        }



    }
}