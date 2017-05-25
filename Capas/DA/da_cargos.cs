using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_cargos
    {
        SqlConnection objConn = new SqlConnection();

        private string nombrecargo;
        public string Nombrecargo
        {
            get { return nombrecargo; }
            set { nombrecargo = value; }
        }

        private string descripcioncargo;
        public string Descripcioncargo
        {
            get { return descripcioncargo; }
            set { descripcioncargo = value; }
        }

        private int idcargo;
        public int Idcargo
        {
            get { return idcargo; }
            set { idcargo = value; }
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
        /// 
        /// </summary>
        /// <returns></returns>
        public bool IngresarCargo()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarCargo";

                    SqlParameter p_nombrecargo = new SqlParameter("@nombrecargo", SqlDbType.VarChar);
                    SqlParameter p_descripcioncargo = new SqlParameter("@descripcioncargo", SqlDbType.VarChar);

                    p_nombrecargo.Direction = ParameterDirection.Input;
                    p_nombrecargo.Value = Nombrecargo;
                    p_descripcioncargo.Direction = ParameterDirection.Input;
                    p_descripcioncargo.Value = Descripcioncargo;

                    objCommand.Parameters.Add(p_nombrecargo);
                    objCommand.Parameters.Add(p_descripcioncargo);

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
        /// 
        /// </summary>
        /// <returns></returns>
        public DataSet ObtenerCargo()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerCargo";

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
        /// 
        /// </summary>
        /// <returns></returns>
        public bool EditarCargo()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEditarCargo";

                    SqlParameter p_nombrecargo = new SqlParameter("@nombrecargo", SqlDbType.VarChar);
                    SqlParameter p_descripcioncargo = new SqlParameter("@descripcioncargo", SqlDbType.VarChar);
                    SqlParameter p_idcargo = new SqlParameter("@id", SqlDbType.Int);

                    p_nombrecargo.Direction = ParameterDirection.Input;
                    p_nombrecargo.Value = Nombrecargo;
                    p_descripcioncargo.Direction = ParameterDirection.Input;
                    p_descripcioncargo.Value = Descripcioncargo;
                    p_idcargo.Direction = ParameterDirection.Input;
                    p_idcargo.Value = Idcargo;

                    objCommand.Parameters.Add(p_nombrecargo);
                    objCommand.Parameters.Add(p_descripcioncargo);
                    objCommand.Parameters.Add(p_idcargo);

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
        /// 
        /// </summary>
        /// <returns></returns>
        public bool EliminarCargo()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarCargo";

                    SqlParameter p_idcargo = new SqlParameter("@id", SqlDbType.Int);

                    p_idcargo.Direction = ParameterDirection.Input;
                    p_idcargo.Value = Idcargo;

                    objCommand.Parameters.Add(p_idcargo);

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
        /// 
        /// </summary>
        /// <returns></returns>
        public DataSet BuscarCargo()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarCargo";

                SqlParameter p_cargo = new SqlParameter("@cargo", SqlDbType.VarChar);

                p_cargo.Direction = ParameterDirection.Input;
                p_cargo.Value = Nombrecargo;

                objCommand.Parameters.Add(p_cargo);

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