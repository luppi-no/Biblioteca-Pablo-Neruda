using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Proyecto
{

    public partial class WebForm1 : System.Web.UI.Page
    {

        
        Capas.BL.bl_trabajo Cargo = new Capas.BL.bl_trabajo();
        

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

        }

        protected void Ingresar_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Ingresar_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void txtLicencia_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Insert_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {
            //validarRut(tb_rut.Text);


        }
        protected void btAgregar_Click(object sender, EventArgs e)
        {
            string rut = tb_rut.Text;
            string nombre = tb_nombre.Text;
            string apellido = tb_apellido.Text;
            string region = dp_region.SelectedItem.ToString();
            string ciudad = dp_ciudad.SelectedItem.ToString();
            string numfijo = tb_numfijo.Text;
            string nummovil = tb_nummovil.Text;
            string mail = tb_mail.Text;
            string nivelestudio = dp_nivelestudio.SelectedItem.ToString();
            string titulo = dp_nivelestudio.SelectedItem.ToString();
            string licencia = dp_licencia.SelectedItem.ToString();
            string area = dp_area.SelectedItem.ToString();
            string cargo = dp_cargo.SelectedItem.ToString();
            string especialidad = dp_especialidad.SelectedItem.ToString();
            string certificacion = dp_certificacion.SelectedItem.ToString();
            string expcargo = dp_expcargo.SelectedItem.ToString();
            string expmineria = dp_expmineria.SelectedItem.ToString();
            string expemin = dp_expemin.SelectedItem.ToString();
            string pretencion = tb_pretencion.Text;
            bool foto = fu_foto.HasFile;
            bool pdf = fu_pdf.HasFile;
            string nacimiento = tb_fnac.Text;


            bool create2 = Cargo.IngresarCargo(area, cargo, especialidad, certificacion, expcargo, expmineria, expemin, pretencion, rut, nombre, apellido, region, ciudad, numfijo, nummovil, mail, nivelestudio, titulo, licencia, foto, pdf, nacimiento);
            if (!create2)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "editincorrecto", "alert('Error al Agregar a la Persona');", true);
            }

            else
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "editcorrecto", "alert('Se agrego a la Persona');", true);
            }
            CleanModals();
        }
        private void CleanModals()
        {
            tb_rut.Text = String.Empty;
            tb_nombre.Text = String.Empty;
            tb_apellido.Text = String.Empty;
            tb_numfijo.Text = String.Empty;
            tb_nummovil.Text = String.Empty;
            tb_mail.Text = String.Empty;
            tb_pretencion.Text = String.Empty;
            tb_fnac.Text = String.Empty;
            tb_fnac.Text = String.Empty;
            tb_ingreso.Text = String.Empty;
            dp_region.SelectedValue = "Elija Una Opción";
            dp_ciudad.SelectedValue = "Elija Una Opción";
            dp_licencia.SelectedValue = "Elija Una Opción";
            dp_nivelestudio.SelectedValue = "Elija Una Opción";
            dp_titulo.SelectedValue = "Elija Una Opción";
            dp_area.SelectedValue = "Elija Una Opción";
            dp_cargo.SelectedValue = "Elija Una Opción";
            dp_certificacion.SelectedValue = "Elija Una Opción";
            dp_expmineria.SelectedValue = "Elija Una Opción";
            dp_expemin.SelectedValue = "Elija Una Opción";
            
        }

        protected void XmlDataSource5_Transforming(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged2(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged3(object sender, EventArgs e)
        {

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


        protected void tb_fnac0_TextChanged(object sender, EventArgs e)
        {

        }

        protected void bt_agregapersona_Click(object sender, EventArgs e)
        {
            camposvacios();
            if (lb_campovacio.Text == "")
            {
                SqlDataSource3.Insert();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "editcorrecto", "alert('Se agrego a la Persona');", true);
                CleanModals();
            }

        }
        protected void camposvacios()
        {
            if (tb_ingreso.Text == string.Empty)
            {
                lb_campovacio.Text = "No Ingresó la Fecha de Ingreso";
            }
            if (dp_ciudad.SelectedValue == "Elija Una Opción")
            {
                lb_campovacio.Text = "No Selecciono una Ciudad";
            }
            if (dp_region.SelectedValue == "Elija Una Opción")
            {
                lb_campovacio.Text = "No Seleccionó una Region";
            }
            if (dp_region.SelectedValue == "Elija Una Opción")
            {
                lb_campovacio.Text = "No Seleccionó una Region";
            }
            if (dp_region.SelectedValue == "Elija Una Opción")
            {
                lb_campovacio.Text = "No Seleccionó una Region";
            }
            if (tb_apellido.Text == string.Empty)
            {
                lb_campovacio.Text = "No ingresó el Apellido";
            }
            if (tb_nombre.Text == string.Empty)
            {
                lb_campovacio.Text = "No ingresó el Nombre";
            }
            if (tb_rut.Text == string.Empty)
            {
                lb_campovacio.Text = "No ingresó Rut";
            }
            if (lberrorrut.Text == "Rut Mal Ingresado")
            {
                lb_campovacio.Text = "Rut Mal Ingresado";
            }
        }
        protected void bt_modificasql_Click(object sender, EventArgs e)
        {

            SqlDataSource2.Update();
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "editcorrecto", "alert('Se modifico a la Persona');", true);
            CleanModals();
        }

        protected void tb_rut_TextChanged(object sender, EventArgs e)
        {

        }

        protected void tb_rut_TextChanged1(object sender, EventArgs e)
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
        protected void bt_agregapersona_Click1(object sender, EventArgs e)
        {
            camposvacios();
            if (lb_campovacio.Text == "")
            {
                SqlDataSource3.Insert();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "editcorrecto", "alert('Se agrego a la Persona');", true);
                //CleanModals();
            }
            
        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {


        }

        protected void tb_fnac_TextChanged(object sender, EventArgs e)
        {
            
        }
        public bool IsDate(object inValue)
        {
            bool bValid;
            try
            {
                DateTime myDT = DateTime.Parse(inValue.ToString());
                bValid = true;
            }
            catch (Exception e)
            {
                bValid = false;
            }

            return bValid;
        }
        public static Boolean EsFecha(String fecha)
        {
            try
            {
                DateTime.Parse(fecha);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public string RetornarMensajeCumpleanio()
        {
            int diaCumple = 4;//Dia del Cumpleanios
            int mesCumple = 4;//Mes de Cumple 4=Abril
            int anioCumple = 1984; //Anio de Cumple
            DateTime fechaNacimiento = new DateTime(anioCumple, mesCumple, diaCumple);

            //Se calcula la Edad Actual A partir de la fecha actual Sustrayendo la fecha de nacimiento
            //esto devuelve un TimeSpan por tanto tomaremos los Dias y lo dividimos en 365 dias
            int edad = (DateTime.Now.Subtract(fechaNacimiento).Days / 365);

            DateTime proximoCumple;
            //Define el proximo Cumple, En caso de que el mes sea menor al Mes Actual se busca el Proxima fecha que seria del año que viene
            //es por ello el AddYear(1)
            //En caso de ser mayor se toma el año actual
            if (DateTime.Now.Month <= mesCumple && DateTime.Now.Day <= diaCumple)
                proximoCumple = new DateTime(DateTime.Now.AddYears(1).Year, mesCumple, diaCumple);
            else
                proximoCumple = new DateTime(DateTime.Now.Year, mesCumple, diaCumple);


            //Definiremos los dias faltantes para el proximo cumple
            TimeSpan faltan = proximoCumple.Subtract(DateTime.Now);

            //Ahora Elaboramos el Mensaje
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("Usted Tiene {0} Años ", edad);
            sb.AppendFormat("y tu Próximo Cumpleaños es: {0} Días", faltan.Days);
            sb.AppendFormat(", {0} Horas ", faltan.Hours);
            sb.AppendFormat("y {0} Minutos ", faltan.Minutes);

            return sb.ToString();
        }

        

        protected void tb_ingreso_TextChanged(object sender, EventArgs e)
        {

        }

        protected void tb_mail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void TextBox1_TextChanged4(object sender, EventArgs e)
        {
            tb_mail.Text = TextBox1.Text + "@" + TextBox2.Text;
        }

    }

}