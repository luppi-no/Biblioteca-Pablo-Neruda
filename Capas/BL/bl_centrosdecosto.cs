using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_centrosdecosto
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
        /// <param name="nombrecentro"></param>
        /// <param name="descripcioncentro"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool IngresarCentroCosto(string nombrecentro, string descripcioncentro)
        {
            DA.da_centrosdecosto conexion = new DA.da_centrosdecosto();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecentro = nombrecentro;
                conexion.Descripcioncentro = descripcioncentro;

                bReturn = conexion.IngresarCentroCosto();
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
        public DataSet ObtenerCentro(string tipoconsulta)
        {
            DA.da_centrosdecosto conexion = new DA.da_centrosdecosto();
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

                objData = conexion.ObtenerCentro();
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
        /// <param name="idcentrocosto"></param>
        /// <param name="nombrecentrocosto"></param>
        /// <param name="descripcioncentrocosto"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EditarCentroCosto(int idcentrocosto, string nombrecentrocosto, string descripcioncentrocosto)
        {
            DA.da_centrosdecosto conexion = new DA.da_centrosdecosto();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecentro = nombrecentrocosto;
                conexion.Descripcioncentro = descripcioncentrocosto;
                conexion.Idcentrocosto = idcentrocosto;

                bReturn = conexion.EditarCentroCosto();
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
        /// <param name="idcentrocosto"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EliminarCentroCosto(int idcentrocosto)
        {
            DA.da_centrosdecosto conexion = new DA.da_centrosdecosto();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idcentrocosto = idcentrocosto;

                bReturn = conexion.EliminarCentroCosto();
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
        /// <param name="centrocosto"></param>
        /// <returns></returns>
        public DataSet BuscarCentroCosto(String centrocosto)
        {
            DA.da_centrosdecosto conexion = new DA.da_centrosdecosto();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecentro = centrocosto;
                objData = conexion.BuscarCentroCosto();
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