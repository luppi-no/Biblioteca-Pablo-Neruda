using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_gerencias
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
        /// <param name="nombregerencia"></param>
        /// <returns></returns>
        public bool IngresarGerencia(string nombregerencia)
        {
            DA.da_gerencias conexion = new DA.da_gerencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombregerencia = nombregerencia;

                bReturn = conexion.IngresarGerencia();
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
        public DataSet ObtenerGerencia(string tipoconsulta)
        {
            DA.da_gerencias conexion = new DA.da_gerencias();
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

                objData = conexion.ObtenerGerencia();
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
        /// <param name="tipoconsulta"></param>
        /// <param name="idgerencia"></param>
        /// <returns></returns>
        public DataSet ObtenerGerencia(string tipoconsulta, int idgerencia)
        {
            DA.da_gerencias conexion = new DA.da_gerencias();
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
                conexion.Idgerencia = idgerencia;

                objData = conexion.ObtenerGerencia();
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
        /// <param name="nombregerencia"></param>
        /// <param name="idgerencia"></param>
        /// <returns></returns>
        public bool EditarGerencia(string nombregerencia, int idgerencia)
        {
            DA.da_gerencias conexion = new DA.da_gerencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombregerencia = nombregerencia;
                conexion.Idgerencia = idgerencia;
                bReturn = conexion.EditarGerencia();
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
        /// <param name="idgerencia"></param>
        /// <returns></returns>
        public bool EliminarGerencia(int idgerencia)
        {
            DA.da_gerencias conexion = new DA.da_gerencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idgerencia = idgerencia;
                bReturn = conexion.EliminarGerencia();
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
        /// <param name="idgerencia"></param>
        /// <param name="idarea"></param>
        /// <returns></returns>
        public bool IngresarAsignacion(int idgerencia, int idarea)
        {
            DA.da_gerencias conexion = new DA.da_gerencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idgerencia = idgerencia;
                conexion.Idarea = idarea;

                bReturn = conexion.IngresarAsignacion();
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
        /// <param name="idgerencia"></param>
        /// <param name="idarea"></param>
        /// <returns></returns>
        public bool EliminarAsignacioAreaGerencia(int idgerencia, int idarea)
        {
            DA.da_gerencias conexion = new DA.da_gerencias();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idgerencia = idgerencia;
                conexion.Idarea = idarea;
                bReturn = conexion.EliminarAsignacionAreaGerencia();
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
        /// <param name="gerencia"></param>
        /// <returns></returns>
        public DataSet BuscarGerencia(string gerencia)
        {
            DA.da_gerencias conexion = new DA.da_gerencias();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombregerencia = gerencia;
                objData = conexion.BuscarGerencia();
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