using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_tipocapacitaciones
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
        /// <returns></returns>
        public DataSet ObtenerTipoCapacitaciones()
        {
            DA.da_tipocapacitaciones conexion = new DA.da_tipocapacitaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                objData = conexion.ObtenerTipoCapacitaciones();
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
        /// <param name="nombretipocapacitacion"></param>
        /// <param name="descripciontipocapacitacion"></param>
        /// <returns></returns>
        public bool IngresarTipoCapacitacion(string nombretipocapacitacion, string descripciontipocapacitacion)
        {
            DA.da_tipocapacitaciones conexion = new DA.da_tipocapacitaciones();
            bool bReturn = false; 
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombretipocapacitacion = nombretipocapacitacion;
                conexion.Descripciontipocapacitacion = descripciontipocapacitacion;

                bReturn = conexion.IngresarTipoCapacitacion();
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
        /// <param name="idtipocapacitacion"></param>
        /// <returns></returns>
        public bool EliminarTipoCapacitacion(int idtipocapacitacion)
        {
            DA.da_tipocapacitaciones conexion = new DA.da_tipocapacitaciones();
            bool bReturn = false; 
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idtipocapacitacion = idtipocapacitacion;

                bReturn = conexion.EliminarTipoCapacitacion();
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
        /// <param name="idtipocapacitacion"></param>
        /// <param name="nombretipocapacitacion"></param>
        /// <param name="descripciontipocapacitacion"></param>
        /// <returns></returns>
        public bool EditarTipoCapacitacion(int idtipocapacitacion, string nombretipocapacitacion, string descripciontipocapacitacion)
        {
            DA.da_tipocapacitaciones conexion = new DA.da_tipocapacitaciones();
            bool bReturn = false; 
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idtipocapacitacion = idtipocapacitacion;
                conexion.Nombretipocapacitacion = nombretipocapacitacion;
                conexion.Descripciontipocapacitacion = descripciontipocapacitacion;

                bReturn = conexion.EditarTipoCapacitacion();
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
        /// <param name="tipocapacitacion"></param>
        /// <returns></returns>
        public DataSet BuscarTipoCapacitacion(string tipocapacitacion)
        {
            DA.da_tipocapacitaciones conexion = new DA.da_tipocapacitaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombretipocapacitacion = tipocapacitacion;

                objData = conexion.BuscarTipoCapacitacion();
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