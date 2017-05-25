using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_formularios
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
        /// <param name="nombreformulario"></param>
        /// <param name="descripcionformulario"></param>
        /// <returns></returns>
        public bool IngresarFormulario(string nombreformulario, string descripcionformulario)
        {
            DA.da_formularios conexion = new DA.da_formularios();
            bool bSuccess = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombreformulario = nombreformulario;
                conexion.Descripcionformulario = descripcionformulario;

                bSuccess = conexion.IngresarFormulario();
                respuesta = "Conexion realizada con exito.";
            }
            catch
            {
                bSuccess = false;
                respuesta = "No existe información.";
            }
            finally
            {
                conexion.CerrarConnBD();
            }
            return bSuccess;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tipoconsulta"></param>
        /// <returns></returns>
        public DataSet ObtenerFormulario(string tipoconsulta)
        {
            DA.da_formularios conexion = new DA.da_formularios();
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

                objData = conexion.ObtenerFormulario();
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
        /// <param name="valueformulario"></param>
        /// <returns></returns>
        public DataSet ObtenerFormulario(string tipoconsulta, int valueformulario)
        {
            DA.da_formularios conexion = new DA.da_formularios();
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
                conexion.Idformulario = valueformulario;

                objData = conexion.ObtenerFormulario();
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
        /// <param name="valueformulario"></param>
        /// <param name="valuecompetencia"></param>
        /// <returns></returns>
        public bool IngresarAsignacion(int valueformulario, int valuecompetencia)
        {
            DA.da_formularios conexion = new DA.da_formularios();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idformulario = valueformulario;
                conexion.Idcompetencia = valuecompetencia;

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
        /// <param name="descripcionFormulario"></param>
        /// <param name="nombreFormulario"></param>
        /// <param name="idFormulario"></param>
        /// <returns></returns>
        public bool EditarFormulario(string descripcionFormulario, string nombreFormulario, int idFormulario)
        {
            DA.da_formularios conexion = new DA.da_formularios();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombreformulario = nombreFormulario;
                conexion.Descripcionformulario = descripcionFormulario;
                conexion.Idformulario = idFormulario;
                bReturn = conexion.EditarFormulario();
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
        /// <param name="idFormulario"></param>
        /// <returns></returns>
        public bool EliminarFormulario(int idFormulario)
        {
            DA.da_formularios conexion = new DA.da_formularios();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idformulario = idFormulario;
                bReturn = conexion.EliminarFormulario();
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
        /// <param name="idformulario"></param>
        /// <param name="idcompetencia"></param>
        /// <returns></returns>
        public bool EliminarAsignacion(int idformulario, int idcompetencia)
        {
            DA.da_formularios conexion = new DA.da_formularios();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idformulario = idformulario;
                conexion.Idcompetencia = idcompetencia;
                bReturn = conexion.EliminarAsignacion();
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
        /// <param name="formulario"></param>
        /// <returns></returns>
        public DataSet BuscarFormulario(string formulario)
        {
            DA.da_formularios conexion = new DA.da_formularios();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombreformulario = formulario;

                objData = conexion.BuscarFormulario();
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