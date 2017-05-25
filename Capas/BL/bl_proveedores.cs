using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_proveedores
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
        /// <param name="nombreproveedor"></param>
        /// <param name="descripcionproveedor"></param>
        /// <returns></returns>
        public bool IngresarProveedor(string nombreproveedor, string descripcionproveedor)
        {
            DA.da_proveedores conexion = new DA.da_proveedores();
            bool bReturn = false; 
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombreproveedor = nombreproveedor;
                conexion.Descripcionproveedor = descripcionproveedor;

                bReturn = conexion.IngresarProveedor();
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
        public DataSet ObtenerProveedor(string tipoconsulta)
        {
            DA.da_proveedores conexion = new DA.da_proveedores();
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

                objData = conexion.ObtenerProveedor();
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
        /// <param name="idproveedor"></param>
        /// <returns></returns>
        public DataSet ObtenerProveedor(string tipoconsulta, int idproveedor)
        {
            DA.da_proveedores conexion = new DA.da_proveedores();
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
                conexion.Idproveedor = idproveedor;

                objData = conexion.ObtenerProveedor();
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
        /// <param name="idproveedor"></param>
        /// <param name="nombreproveedor"></param>
        /// <param name="descripcionproveedor"></param>
        /// <returns></returns>
        public bool EditarProveedor(int idproveedor, string nombreproveedor, string descripcionproveedor)
        {
            DA.da_proveedores conexion = new DA.da_proveedores();
            bool bReturn = false; 
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombreproveedor = nombreproveedor;
                conexion.Descripcionproveedor = descripcionproveedor;
                conexion.Idproveedor = idproveedor;
                bReturn = conexion.EditarProveedor();
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
        /// <param name="idproveedor"></param>
        /// <returns></returns>
        public bool EliminarProveedor(int idproveedor)
        {
            DA.da_proveedores conexion = new DA.da_proveedores();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idproveedor = idproveedor;
                bReturn = conexion.EliminarProveedor();
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
        /// <param name="idproveedor"></param>
        /// <param name="idcapacitacion"></param>
        /// <returns></returns>
        public bool IngresarAsignacion(int idproveedor, int idcapacitacion)
        {
            DA.da_proveedores conexion = new DA.da_proveedores();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idproveedor = idproveedor;
                conexion.Idcapacitacion = idcapacitacion;

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
        /// <param name="idproveedor"></param>
        /// <param name="idcapacitacion"></param>
        /// <returns></returns>
        public bool EliminarAsignacion(int idproveedor, int idcapacitacion)
        {
            DA.da_proveedores conexion = new DA.da_proveedores();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idproveedor = idproveedor;
                conexion.Idcapacitacion = idcapacitacion;
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
        /// <param name="proveedor"></param>
        /// <returns></returns>
        public DataSet BuscarProveedor(string proveedor)
        {
            DA.da_proveedores conexion = new DA.da_proveedores();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombreproveedor = proveedor;
                objData = conexion.BuscarProveedor();
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