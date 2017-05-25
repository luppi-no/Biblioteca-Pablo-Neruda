using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{

    public class bl_capacitaciones
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
        /// <param name="area"></param>
        /// <param name="centrocosto"></param>
        /// <param name="capacitacion"></param>
        /// <param name="proveedor"></param>
        /// <param name="anno"></param>
        /// <returns></returns>
        public DataSet BuscarCapacitaciones(string area, string centrocosto, string capacitacion, string proveedor, string anno)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Area = area;
                conexion.Centrocosto = centrocosto;
                conexion.Nombrecapacitacion = capacitacion;
                conexion.Proveedor = proveedor;
                conexion.Anno = anno;

                objData = conexion.BuscarCapacitaciones();
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
        /// <returns></returns>
        public DataSet AnnoCapacitaciones()
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                objData = conexion.AnnoCapacitaciones();
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
        /// <returns></returns>
        public DataSet DetalleCapacitaciones(int idcapacitacion)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
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

                objData = conexion.DetalleCapacitaciones();
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
        /// <param name="idcapacitacion"></param>
        /// <returns></returns>
        public bool QuitarUsuario(string rut, int idcapacitacion)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
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
                conexion.Rut = rut;

                bReturn = conexion.QuitarUsuario();
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
        /// <param name="rut"></param>
        /// <returns></returns>
        public DataSet ObtenerCapacitacion(string tipoconsulta, string rut)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
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

                objData = conexion.ObtenerCapacitaciones();
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
        /// <param name="idperiodo"></param>
        /// <returns></returns>
        public DataSet ObtenerCapacitacionPorPeriodo(string tipoconsulta, string rut, int idperiodo)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
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
                conexion.Idperiodo = idperiodo;

                objData = conexion.ObtenerCapacitacionPorPeriodo();
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
        /// <param name="nombrecapacitacion"></param>
        /// <param name="cupos"></param>
        /// <param name="numeroDeHoras"></param>
        /// <param name="fechaDesde"></param>
        /// <param name="fechaHasta"></param>
        /// <param name="idtipocapacitacion"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool IngresarCapacitacion(string nombrecapacitacion, int cupos, int numeroDeHoras, string fechaDesde, string fechaHasta, int idtipocapacitacion)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecapacitacion = nombrecapacitacion;
                conexion.Cupos = cupos;
                conexion.Numerodehoras = numeroDeHoras;
                conexion.Fechadesde = fechaDesde;
                conexion.Fechahasta = fechaHasta;
                conexion.Idtipocapacitacion = idtipocapacitacion;


                bReturn = conexion.IngresarCapacitacion();
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
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EliminarCapacitacion(int idcapacitacion)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
            bool bReturn = false;
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

                bReturn = conexion.EliminarCapacitacion();
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
        /// <param name="nombrecapacitacion"></param>
        /// <param name="programada"></param>
        /// <param name="cupos"></param>
        /// <param name="horas"></param>
        /// <param name="fechadesde"></param>
        /// <param name="fechahasta"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EditarCapacitacion(int idcapacitacion, string nombrecapacitacion, string programada, int cupos, int horas, string fechadesde, string fechahasta)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
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
                conexion.Nombrecapacitacion = nombrecapacitacion;
                conexion.Programada = programada;
                conexion.Cupos = cupos;
                conexion.Numerodehoras = horas;
                conexion.Fechadesde = fechadesde;
                conexion.Fechahasta = fechahasta;

                bReturn = conexion.EditarCapacitacion();
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
        /// <param name="nombrecapacitacion"></param>
        /// <returns></returns>
        public DataSet BuscarCapacitacion(string nombrecapacitacion)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecapacitacion = nombrecapacitacion;

                objData = conexion.BuscarCapacitacion();
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
        /// <param name="nombrecapacitacion"></param>
        /// <param name="cupos"></param>
        /// <param name="numeroDeHoras"></param>
        /// <param name="fechaDesde"></param>
        /// <param name="fechaHasta"></param>
        /// <param name="tipoCapacitacion"></param>
        /// <param name="rut"></param>
        /// <param name="idproveedor"></param>
        /// <param name="idperiodo"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool AsignarCapacitacionNoProgramada(string nombrecapacitacion, int cupos, int numeroDeHoras, string fechaDesde, string fechaHasta, int tipoCapacitacion, string rut, int idproveedor, int idperiodo)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrecapacitacion = nombrecapacitacion;
                conexion.Cupos = cupos;
                conexion.Numerodehoras = numeroDeHoras;
                conexion.Fechadesde = fechaDesde;
                conexion.Fechahasta = fechaHasta;
                conexion.Idtipocapacitacion = tipoCapacitacion;
                conexion.Rut = rut;
                conexion.Idproveedor = idproveedor;
                conexion.Idperiodo = idperiodo;

                bReturn = conexion.AsignarCapacitacionNoProgramada();
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
        /// <param name="idcapacitacion"></param>
        /// <param name="idproveedor"></param>
        /// <param name="idperiodo"></param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool AsignarCapacitacion(string rut, int idcapacitacion, int idproveedor, int idperiodo)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
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
                conexion.Idcapacitacion = idcapacitacion;
                conexion.Idproveedor = idproveedor;
                conexion.Idperiodo = idperiodo;

                bReturn = conexion.AsignarCapacitacion();
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
        /// <returns></returns>
        public DataTable CapacitacionbyId(int idcapacitacion)
        {
            DA.da_capacitaciones conexion = new DA.da_capacitaciones();
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

                objData = conexion.CapacitacionbyId();
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
