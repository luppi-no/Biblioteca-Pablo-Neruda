using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_usuarios
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
        /// <param name="rut"></param>
        /// <param name="nombreusuario"></param>
        /// <param name="apepatusuario"></param>
        /// <param name="apematusuario"></param>
        /// <param name="mailusuario"></param>
        /// <param name="idarea"></param>
        /// <param name="idcargo"></param>
        /// <param name="idcentro"></param>
        /// <param name="idformulario"></param>
        /// <returns></returns>
        public bool IngresarUsuario(string rut, string nombreusuario, string apepatusuario, string apematusuario, string mailusuario, int idarea, int idcargo, int idcentro, int idformulario)
        {
            DA.da_usuarios conexion = new DA.da_usuarios();
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
                conexion.Nombreusuario = nombreusuario;
                conexion.Apepatusuario = apepatusuario;
                conexion.Apematusuario = apematusuario;
                conexion.Mailusuario = mailusuario;
                conexion.Idarea = idarea;
                conexion.Idcargo = idcargo;
                conexion.Idcentro = idcentro;
                conexion.Idformulario = idformulario;

                bReturn = conexion.IngresarUsuario();
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
        /// <param name="rut"></param>
        /// <param name="nombreusuario"></param>
        /// <param name="apepatusuario"></param>
        /// <param name="apematusuario"></param>
        /// <param name="mailusuario"></param>
        /// <param name="idarea"></param>
        /// <param name="idcargo"></param>
        /// <param name="idcentro"></param>
        /// <param name="idformulario"></param>
        /// <returns></returns>
        public bool EditarUsuario(string rut, string nombreusuario, string apepatusuario, string apematusuario, string mailusuario, int idarea, int idcargo, int idcentro, int idformulario)
        {
            bool bReturn = false;

            DA.da_usuarios conexion = new DA.da_usuarios();            
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Rut = rut;
                conexion.Nombreusuario = nombreusuario;
                conexion.Apepatusuario = apepatusuario;
                conexion.Apematusuario = apematusuario;
                conexion.Mailusuario = mailusuario;
                conexion.Idarea = idarea;
                conexion.Idcargo = idcargo;
                conexion.Idcentro = idcentro;
                conexion.Idformulario = idformulario;

                bReturn = conexion.EditarUsuario();
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
        /// <param name="rut"></param>
        /// <param name="sMess"></param>
        /// <returns></returns>
        public bool EliminarUsuario(string rut, out string sMess)
        {
            sMess = "";
            bool bReturn = false;

            DA.da_usuarios conexion = new DA.da_usuarios();            
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Rut = rut;

                bReturn = conexion.EliminarUsuario(out sMess);
                respuesta = "Conexion realizada con exito.";
            }
            catch (Exception ex)
            {
                bReturn = false;
                respuesta = "No existe información.";
                sMess = ex.Message;
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
        /// <param name="rutevaluador"></param>
        /// <param name="consulta"></param>
        /// <returns></returns>
        public DataSet ObtenerUsuario(string tipoconsulta, string rutevaluador, string consulta)
        {
            DA.da_usuarios conexion = new DA.da_usuarios();
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
                conexion.Rutevaluador = rutevaluador;
                conexion.Consulta = consulta;

                objData = conexion.ObtenerUsuario();
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
        /// <param name="rutevaluador"></param>
        /// <param name="rutevaluado"></param>
        /// <param name="idperiodo"></param>
        /// <returns></returns>
        public bool AsignarEvaluado(string rutevaluador, string rutevaluado, string idperiodo)
        {
            DA.da_usuarios conexion = new DA.da_usuarios();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Rutevaluador = rutevaluador;
                conexion.Rutevaluado = rutevaluado;
                conexion.Idperiodo = idperiodo;

                bReturn = conexion.AsignarEvaluado();
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
        /// <param name="rutevaluador"></param>
        /// <param name="rutevaluado"></param>
        /// <param name="idperiodo"></param>
        /// <returns></returns>
        public bool EliminarAsignacion(string rutevaluador, string rutevaluado, string idperiodo)
        {
            bool bReturn = false;
            DA.da_usuarios conexion = new DA.da_usuarios();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Rutevaluador = rutevaluador;
                conexion.Rutevaluado = rutevaluado;
                conexion.Idperiodo = idperiodo;

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
        /// <param name="usuario"></param>
        /// <returns></returns>
        public DataSet BuscarUsuario(string usuario)
        {
            DA.da_usuarios conexion = new DA.da_usuarios();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombreusuario = usuario;

                objData = conexion.BuscarUsuario();
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