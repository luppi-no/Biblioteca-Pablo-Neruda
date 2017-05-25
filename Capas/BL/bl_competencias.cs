using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_competencias
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
        public DataSet ObtenerCompetencia(string tipoconsulta)
        {
            DA.da_competencias conexion = new DA.da_competencias();
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

                objData = conexion.ObtenerCompetencia();
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
        /// <param name="nombrecompetencia"></param>
        /// <param name="descripcioncompetencia"></param>
        /// <param name="peso"></param>
        /// <param name="notaesperada"></param>
        /// <param name="valuetipocompetencia"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool IngresarCompetencia(string nombrecompetencia, string descripcioncompetencia, decimal peso, int notaesperada, int valuetipocompetencia)
        {
            DA.da_competencias conexion = new DA.da_competencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecompetencia = nombrecompetencia;
                conexion.Descripcioncompetencia = descripcioncompetencia;
                conexion.Peso = peso;
                conexion.Notaesperada = notaesperada;
                conexion.Idtipocompetencia = valuetipocompetencia;

                bReturn = conexion.IngresarCompetencia();
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
        /// <param name="valuecompetencia"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EliminarCompetencia(int valuecompetencia)
        {
            DA.da_competencias conexion = new DA.da_competencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idcompetencia = valuecompetencia;

                bReturn = conexion.EliminarCompetencia();
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
        /// <param name="valuecompetencia"></param>
        /// <param name="nombrecompetencia"></param>
        /// <param name="descripcioncompetencia"></param>
        /// <param name="peso"></param>
        /// <param name="notaesperada"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EditarCompetencia(int valuecompetencia, string nombrecompetencia, string descripcioncompetencia, decimal peso, int notaesperada)
        {
            DA.da_competencias conexion = new DA.da_competencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idcompetencia = valuecompetencia;
                conexion.Nombrecompetencia = nombrecompetencia;
                conexion.Descripcioncompetencia = descripcioncompetencia;
                conexion.Peso = peso;
                conexion.Notaesperada = notaesperada;

                bReturn = conexion.EditarCompetencia();
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
        /// <param name="competencia"></param>
        /// <returns></returns>
        public DataSet BuscarCompetencia(string competencia)
        {
            DA.da_competencias conexion = new DA.da_competencias();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecompetencia = competencia;

                objData = conexion.BuscarCompetencia();
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