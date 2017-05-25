using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_tipocompetencias
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
        /// <param name="tipoconsulta"></param>
        /// <returns></returns>
        public DataSet ObtenerTipoCompetencia(string tipoconsulta)
        {
            DA.da_tipocompetencias conexion = new DA.da_tipocompetencias();
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

                objData = conexion.ObtenerTipoCompetencia();
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
        /// <param name="nombretipocompetencia"></param>
        /// <param name="descripciontipocompetencia"></param>
        /// <param name="idcategoria"></param>
        /// <returns></returns>
        public bool IngresarTipoCompetencia(string nombretipocompetencia, string descripciontipocompetencia, int idcategoria)
        {
            DA.da_tipocompetencias conexion = new DA.da_tipocompetencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombretipocompetencia = nombretipocompetencia;
                conexion.Descripciontipocompetencia = descripciontipocompetencia;
                conexion.Idcategoria = idcategoria;

                bReturn = conexion.IngresarTipoCompetencia();
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
        /// <param name="idtipocompetencia"></param>
        /// <returns></returns>
        public bool EliminarTipoCompetencia(int idtipocompetencia)
        {
            DA.da_tipocompetencias conexion = new DA.da_tipocompetencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idtipocompetencia = idtipocompetencia;

                bReturn = conexion.EliminarTipoCompetencia();
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
        /// <param name="idtipocompetencia"></param>
        /// <param name="nombretipocompetencia"></param>
        /// <param name="descripciontipocompetencia"></param>
        /// <returns></returns>
        public bool EditarTipoCompetencia(int idtipocompetencia, string nombretipocompetencia, string descripciontipocompetencia)
        {
            DA.da_tipocompetencias conexion = new DA.da_tipocompetencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idtipocompetencia = idtipocompetencia;
                conexion.Nombretipocompetencia = nombretipocompetencia;
                conexion.Descripciontipocompetencia = descripciontipocompetencia;

                bReturn = conexion.EditarTipoCompetencia();
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
        /// <param name="tipocompetencia"></param>
        /// <returns></returns>
        public DataSet BuscarTipoCompetencia(string tipocompetencia)
        {
            DA.da_tipocompetencias conexion = new DA.da_tipocompetencias();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombretipocompetencia = tipocompetencia;

                objData = conexion.BuscarTipoCompetencia();
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