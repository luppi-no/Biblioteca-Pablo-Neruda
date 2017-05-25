using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_cargos
    {
        private string respuesta;
        public string Respuesta
        {
            get { return respuesta; }
            set { respuesta = value; }
        }

        SqlConnection objConn = new SqlConnection();
        SqlCommand objComand = new SqlCommand();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="nombrecargo"></param>
        /// <param name="descripcioncargo"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool IngresarCargo(string nombrecargo, string descripcioncargo)
        {
            DA.da_cargos conexion = new DA.da_cargos();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecargo = nombrecargo;
                conexion.Descripcioncargo = descripcioncargo;

                bReturn = conexion.IngresarCargo();
                respuesta = "Conexion realizada con exito.";
            }
            catch
            {
                bReturn = false;
                respuesta = "No existe información.";
            }
            finally
            {
                conexion.CerrarConnBD();
            }
            return bReturn;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tipoconsulta"></param>
        /// <returns></returns>
        public DataSet ObtenerCargo(string tipoconsulta)
        {
            DA.da_cargos conexion = new DA.da_cargos();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Tipoconsulta = tipoconsulta;

                objData = conexion.ObtenerCargo();
                respuesta = "Conexion realizada con exito.";
            }
            catch
            {
                objData = null;
                respuesta = "No existe información.";
            }
            finally
            {
                conexion.CerrarConnBD();
            }
            return objData;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="descripcioncargo"></param>
        /// <param name="nombrecargo"></param>
        /// <param name="idcargo"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EditarCargo(string descripcioncargo, string nombrecargo, int idcargo)
        {
            DA.da_cargos conexion = new DA.da_cargos();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecargo = nombrecargo;
                conexion.Descripcioncargo = descripcioncargo;
                conexion.Idcargo = idcargo;
                bReturn = conexion.EditarCargo();
                respuesta = "Conexion realizada con exito.";
            }
            catch
            {
                bReturn = false;
                respuesta = "No existe información.";
            }
            finally
            {
                conexion.CerrarConnBD();
            }
            return bReturn;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idcargo"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EliminarCargo(int idcargo)
        {
            DA.da_cargos conexion = new DA.da_cargos();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idcargo = idcargo;
                bReturn = conexion.EliminarCargo();
                respuesta = "Conexion realizada con exito.";
            }
            catch
            {
                bReturn = false;
                respuesta = "No existe información.";
            }
            finally
            {
                conexion.CerrarConnBD();
            }
            return bReturn;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cargo"></param>
        /// <returns></returns>
        public DataSet BuscarCargo(String cargo)
        {
            DA.da_cargos conexion = new DA.da_cargos();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecargo = cargo;
                objData = conexion.BuscarCargo();
                respuesta = "Conexion realizada con exito.";
            }
            catch
            {
                objData = null;
                respuesta = "No existe información.";
            }
            finally
            {
                conexion.CerrarConnBD();
            }
            return objData;
        }
    }
}