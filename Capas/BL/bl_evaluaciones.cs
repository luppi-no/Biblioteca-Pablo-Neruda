using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_evaluaciones
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
        /// <param name="rut"></param>
        /// <returns></returns>
        public DataSet ObtenerEvaluacion(string tipoconsulta, string rut)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
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
                conexion.Rut = rut;

                objData = conexion.ObtenerEvaluacion();
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
        /// <param name="rut"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EsEvaluador(string rut)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Rut = rut;

                bReturn = conexion.EsEvaluador();
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
        /// <param name="busqueda"></param>
        /// <param name="tipoconsulta"></param>
        /// <param name="filtroconsulta"></param>
        /// <returns></returns>
        public DataSet BuscarEvaluacion(string busqueda, string tipoconsulta, string filtroconsulta)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Busqueda = busqueda;
                conexion.Tipoconsulta = tipoconsulta;
                conexion.Filtroconsulta = filtroconsulta;

                objData = conexion.BuscarEvaluacion();
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
        /// <param name="rut"></param>
        /// <param name="nombreevaluador"></param>
        /// <param name="cargo"></param>
        /// <param name="idperiodo"></param>
        /// <returns></returns>
        public DataSet BuscarEvaluadosACapacitar(string rut, string nombreevaluador, string cargo, int idperiodo)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Rut = rut;
                conexion.Nombreevaluador = nombreevaluador;
                conexion.Cargo = cargo;
                conexion.Idperiodo = idperiodo;

                objData = conexion.BuscarEvaluadosACapacitar();
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
        /// <param name="rut"></param>
        /// <param name="idperiodo"></param>
        /// <returns></returns>
        public DataSet BuscarEvaluacionesporEvaluado(string rut, int idperiodo)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Rut = rut;
                conexion.Idperiodo = idperiodo;

                objData = conexion.BuscarEvaluacionesporEvaluado();
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
        /// <param name="idasignacion"></param>
        /// <returns></returns>
        public DataSet NotasPorPersona(int idasignacion)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idasignacion = idasignacion;

                objData = conexion.NotasPorPersona();
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
        /// <param name="rut"></param>
        /// <param name="idasignacion"></param>
        /// <returns></returns>
        public DataSet ObtenerDatosEvaluacion(string tipoconsulta, string rut, int idasignacion)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
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
                conexion.Rut = rut;
                conexion.Idasignacion = idasignacion;

                objData = conexion.ObtenerDatosEvaluacion();
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
        /// <param name="rut"></param>
        /// <returns></returns>
        public DataSet ObtenerDatosFormulario(string tipoconsulta, string rut)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
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
                conexion.Rut = rut;

                objData = conexion.ObtenerDatosFormulario();
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
        /// <param name="idcompetencia"></param>
        /// <param name="idnota"></param>
        /// <param name="idasignacion"></param>
        /// <param name="observacion"></param>
        /// <returns></returns>
        public bool ActualizarNota(int idcompetencia, int idnota, int idasignacion, string observacion)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idcompetencia = idcompetencia;
                conexion.Idnota = idnota;
                conexion.Idasignacion = idasignacion;
                conexion.Observacion = observacion;

                bReturn = conexion.ActualizarNota();
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
        /// <param name="valueasignacion"></param>
        /// <param name="deacuerdo"></param>
        /// <returns></returns>
        public bool ActualizarFeedback(int valueasignacion, string deacuerdo)
        {
            DA.da_evaluaciones conexion = new DA.da_evaluaciones();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idasignacion = valueasignacion;
                conexion.Deacuerdo = deacuerdo;

                bReturn = conexion.ActualizarFeedback();
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
    }
}