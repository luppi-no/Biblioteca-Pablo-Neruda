using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_valorcurso
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
        public DataSet ValorCursoCapacitacion(int idcapacitacion)
        {
            DA.da_valorcurso conexion = new DA.da_valorcurso();
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

                objData = conexion.ValorCursoCapacitacion();
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
        /// <param name="valorEmpresa"></param>
        /// <param name="valorFranquicia"></param>
        /// <param name="mes"></param>
        /// <returns></returns>
        public bool IngresarValorCurso(int idcapacitacion, int valorEmpresa, int valorFranquicia, string mes)
        {
            DA.da_valorcurso conexion = new DA.da_valorcurso();
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
                conexion.Valorempresa = valorEmpresa;
                conexion.Valorfranquicia = valorFranquicia;
                conexion.Mes = mes;

                bReturn = conexion.IngresarValorCurso();
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
        /// <param name="idvalorcurso"></param>
        /// <returns></returns>
        public bool EliminarValorCurso(int idvalorcurso)
        {
            DA.da_valorcurso conexion = new DA.da_valorcurso();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {

                conexion.Idvalorcurso = idvalorcurso;

                bReturn = conexion.EliminarValorCurso();
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
        /// <param name="idvalorcurso"></param>
        /// <param name="valorEmpresa"></param>
        /// <param name="valorFranquicia"></param>
        /// <param name="mes"></param>
        /// <returns></returns>
        public bool EditarValorCurso(int idcapacitacion, int idvalorcurso, int valorEmpresa, int valorFranquicia, string mes)
        {
            DA.da_valorcurso conexion = new DA.da_valorcurso();
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
                conexion.Idvalorcurso = idvalorcurso;
                conexion.Valorempresa = valorEmpresa;
                conexion.Valorfranquicia = valorFranquicia;
                conexion.Mes = mes;

                bReturn = conexion.EditarValorCurso();
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