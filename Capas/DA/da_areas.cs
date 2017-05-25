using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_areas
    {
        SqlConnection objConn = new SqlConnection();

        private string nombrearea;
        public string Nombrearea
        {
            get { return nombrearea; }
            set { nombrearea = value; }
        }

        private string descripcionarea;
        public string Descripcionarea
        {
            get { return descripcionarea; }
            set { descripcionarea = value; }
        }

        private int idarea;
        public int Idarea
        {
            get { return idarea; }
            set { idarea = value; }
        }

        private string tipoconsulta;
        public string Tipoconsulta
        {
            get { return tipoconsulta; }
            set { tipoconsulta = value; }
        }

        /// <summary>
        /// Método que abre la conexión a SQL
        /// </summary>
        /// <returns>Retorna un 1 si la ejecución es correcta, 0 si es incorrecta</returns>
        public int AbrirConnBD()
        {
            try
            {
                objConn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StringConexionBD"].ConnectionString;
                objConn.Open();
            }
            catch (System.Exception ex)
            {
                string Mensaje = "Error" + ex.Message;
                return 0;
            }
            finally
            {
            }
            return 1;
        }

        /// <summary>
        /// Método que cierra la conexión a SQL
        /// </summary>
        /// <returns>Retorna un 1 si la ejecución es correcta, 0 si es incorrecta</returns>
        public int CerrarConnBD()
        {
            try
            {
                objConn.Close();
            }
            catch (System.Exception ex)
            {
                string Mensaje = "Error" + ex.Message;
                return 0;
            }
            finally
            {
            }
            return 1;
        }

        /// <summary>
        /// Método que registra una nueva área en SQL
        /// </summary>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool IngresarArea()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarArea";

                    SqlParameter p_nombrearea = new SqlParameter("@nombrearea", SqlDbType.VarChar);
                    SqlParameter p_descripcionarea = new SqlParameter("@descripcionarea", SqlDbType.VarChar);

                    p_nombrearea.Direction = ParameterDirection.Input;
                    p_nombrearea.Value = Nombrearea;
                    p_descripcionarea.Direction = ParameterDirection.Input;
                    p_descripcionarea.Value = Descripcionarea;

                    objCommand.Parameters.Add(p_nombrearea);
                    objCommand.Parameters.Add(p_descripcionarea);

                    SqlParameter p_return = new SqlParameter("@return", SqlDbType.Int);
                    p_return.Direction = ParameterDirection.ReturnValue;
                    objCommand.Parameters.Add(p_return);

                    objCommand.ExecuteNonQuery();

                    iReturn = (int)p_return.Value;

                    if (iReturn == 1)
                    {
                        bReturn = true;
                    }
                }
                catch
                {
                    bReturn = false;
                }
            }
            return bReturn;
        }

        /// <summary>
        /// Método que obtiene las áreas desde SQL
        /// </summary>
        /// <returns>Retorna un DataSet con el resultado de la consulta</returns>
        public DataSet ObtenerArea()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerArea";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;

                objCommand.Parameters.Add(p_tipoconsulta);

                objAdapter.SelectCommand = objCommand;
                objAdapter.Fill(objData);
            }
            catch
            {
                objData = null;
            }
            finally
            {
                objCommand = null;
                objAdapter = null;
            }
            return objData;
        }

        /// <summary>
        /// Método que edita una área en SQL
        /// </summary>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EditarArea()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEditarArea";

                    SqlParameter p_nombrearea = new SqlParameter("@nombrearea", SqlDbType.VarChar);
                    SqlParameter p_descripcionarea = new SqlParameter("@descripcionarea", SqlDbType.VarChar);
                    SqlParameter p_idarea = new SqlParameter("@id", SqlDbType.Int);

                    p_nombrearea.Direction = ParameterDirection.Input;
                    p_nombrearea.Value = Nombrearea;
                    p_descripcionarea.Direction = ParameterDirection.Input;
                    p_descripcionarea.Value = Descripcionarea;
                    p_idarea.Direction = ParameterDirection.Input;
                    p_idarea.Value = Idarea;

                    objCommand.Parameters.Add(p_nombrearea);
                    objCommand.Parameters.Add(p_descripcionarea);
                    objCommand.Parameters.Add(p_idarea);

                    SqlParameter p_return = new SqlParameter("@return", SqlDbType.Int);
                    p_return.Direction = ParameterDirection.ReturnValue;
                    objCommand.Parameters.Add(p_return);

                    objCommand.ExecuteNonQuery();

                    iReturn = (int)p_return.Value;

                    if (iReturn == 1)
                    {
                        bReturn = true;
                    }
                }
                catch
                {
                    bReturn = false;

                }
            }
            return bReturn;
        }

        /// <summary>
        /// Método que elimina un área en SQL
        /// </summary>
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EliminarArea()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarArea";

                    SqlParameter p_idarea = new SqlParameter("@id", SqlDbType.Int);

                    p_idarea.Direction = ParameterDirection.Input;
                    p_idarea.Value = Idarea;

                    objCommand.Parameters.Add(p_idarea);

                    SqlParameter p_return = new SqlParameter("@return", SqlDbType.Int);
                    p_return.Direction = ParameterDirection.ReturnValue;
                    objCommand.Parameters.Add(p_return);

                    objCommand.ExecuteNonQuery();

                    iReturn = (int)p_return.Value;

                    if (iReturn == 1)
                    {
                        bReturn = true;
                    }
                }
                catch
                {
                    bReturn = false;

                }
            }
            return bReturn;
        }

        /// <summary>
        /// Método que obtiene las áreas especificas desde SQL
        /// </summary>
        /// <returns>Retorna un DataSet con el resultado de la consulta</returns>
        public DataSet BuscarArea()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarArea";

                SqlParameter p_area = new SqlParameter("@area", SqlDbType.VarChar);

                p_area.Direction = ParameterDirection.Input;
                p_area.Value = Nombrearea;

                objCommand.Parameters.Add(p_area);

                objAdapter.SelectCommand = objCommand;
                objAdapter.Fill(objData);
            }
            catch
            {
                objData = null;

            }
            finally
            {
                objCommand = null;
                objAdapter = null;
            }
            return objData;
        }
    }
}