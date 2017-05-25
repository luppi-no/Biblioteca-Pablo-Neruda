using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_facturas
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
        /// <param name="idcapacitacion"></param>
        /// <returns></returns>
        public DataSet FacturasPorCapacitacion(int idcapacitacion)
        {
            DA.da_facturas conexion = new DA.da_facturas();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idcapacitacion = idcapacitacion;

                objData = conexion.FacturasPorCapacitacion();
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
        /// <param name="idcapacitacion"></param>
        /// <param name="numerofactura"></param>
        /// <param name="vbcc"></param>
        /// <param name="vbcb"></param>
        /// <param name="mes"></param>
        /// <returns></returns>
        public DataTable IngresarFactura(int idcapacitacion, int numerofactura, string vbcc, string vbcb, string mes)
        {
            DA.da_facturas conexion = new DA.da_facturas();
            DataTable objData = new DataTable();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idcapacitacion = idcapacitacion;
                conexion.Numerofactura = numerofactura;
                conexion.Vbcb = vbcb;
                conexion.Vbcc = vbcc;
                conexion.Mes = mes;

                objData = conexion.IngresarFactura();
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
        /// <param name="numerofactura"></param>
        /// <returns></returns>
        public bool EliminarFactura(int numerofactura)
        {
            DA.da_facturas conexion = new DA.da_facturas();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Numerofactura = numerofactura;

                bReturn = conexion.EliminarFactura();
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
        /// <param name="idcapacitacion"></param>
        /// <param name="numerofactura"></param>
        /// <param name="vbcc"></param>
        /// <param name="vbcb"></param>
        /// <param name="mes"></param>
        /// <returns></returns>
        public bool EditarFactura(int idcapacitacion, int numerofactura, string vbcc, string vbcb, string mes)
        {
            DA.da_facturas conexion = new DA.da_facturas();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idcapacitacion = idcapacitacion;
                conexion.Numerofactura = numerofactura;
                conexion.Vbcb = vbcb;
                conexion.Vbcc = vbcc;
                conexion.Mes = mes;

                bReturn = conexion.EditarFactura();
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