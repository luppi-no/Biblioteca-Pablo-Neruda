using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.BL
{
    public class bl_areas
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
        /// Método para registrar una nueva área en SQL
        /// </summary>
        /// <param name="nombrearea">El nombre de la área a registrar</param>
        /// <param name="descripcionarea">La descripción de la área a registrar</param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool IngresarArea(string nombrearea, string descripcionarea)
        {
            DA.da_areas conexion = new DA.da_areas();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrearea =nombrearea;
                conexion.Descripcionarea = descripcionarea;

                bReturn = conexion.IngresarArea();
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
        /// Método que obtiene las áreas desde SQL
        /// </summary>
        /// <param name="tipoconsulta">El tipo de consulta que se hace sobre el procedimiento almacenado</param>
        /// <returns>Retorna un DataSet con el resultado de la consulta</returns>
        public DataSet ObtenerArea(string tipoconsulta)
        {
            DA.da_areas conexion = new DA.da_areas();
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

                objData = conexion.ObtenerArea();
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
        /// Método que edita una área en SQL
        /// </summary>
        /// <param name="descripcionarea">La nueva descripción del área a editar</param>
        /// <param name="nombrearea">El nuevo nombre del área a editar</param>
        /// <param name="idarea">El ID del área que va a ser editada</param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EditarArea(string descripcionarea, string nombrearea, int idarea)
        {
            DA.da_areas conexion = new DA.da_areas();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrearea = nombrearea;
                conexion.Descripcionarea = descripcionarea;
                conexion.Idarea = idarea;
                bReturn = conexion.EditarArea();
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
        /// Método que elimina un área en SQL
        /// </summary>
        /// <param name="idarea">El ID del área a eliminar</param>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EliminarArea(int idarea)
        {
            DA.da_areas conexion = new DA.da_areas();
            bool bReturn = false;
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Idarea = idarea;
                bReturn = conexion.EliminarArea();
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
        /// Método que obtiene las áreas especificas desde SQL
        /// </summary>
        /// <param name="area">El nombre del área a buscar</param>
        /// <returns>Retorna un DataSet con el resultado de la consulta</returns>
        public DataSet BuscarArea(String area)
        {
            DA.da_areas conexion = new DA.da_areas();
            DataSet objData = new DataSet();
            int resultado = 0;
            resultado = conexion.AbrirConnBD();

            if (resultado == 0)
            {
                respuesta = "Error al abrir la conexion.";
            }
            try
            {
                conexion.Nombrearea = area;
                objData = conexion.BuscarArea();
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