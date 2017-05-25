using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_centrosdecosto
    {
        SqlConnection objConn = new SqlConnection();

        private string nombrecentro;
        public string Nombrecentro
        {
            get { return nombrecentro; }
            set { nombrecentro = value; }
        }

        private string descripcioncentro;
        public string Descripcioncentro
        {
            get { return descripcioncentro; }
            set { descripcioncentro = value; }
        }

        private int idcentrocosto;
        public int Idcentrocosto
        {
            get { return idcentrocosto; }
            set { idcentrocosto = value; }
        }

        private string tipoconsulta;
        public string Tipoconsulta
        {
            get { return tipoconsulta; }
            set { tipoconsulta = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
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
        /// 
        /// </summary>
        /// <returns></returns>
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
        public bool IngresarCentroCosto()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarCentroCosto";

                    SqlParameter p_nombrecentro = new SqlParameter("@nombrecentro", SqlDbType.VarChar);
                    SqlParameter p_descripcioncentro = new SqlParameter("@descripcioncentro", SqlDbType.VarChar);

                    p_nombrecentro.Direction = ParameterDirection.Input;
                    p_nombrecentro.Value = Nombrecentro;
                    p_descripcioncentro.Direction = ParameterDirection.Input;
                    p_descripcioncentro.Value = Descripcioncentro;

                    objCommand.Parameters.Add(p_nombrecentro);
                    objCommand.Parameters.Add(p_descripcioncentro);

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
        public DataSet ObtenerCentro()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerCentro";

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
        public bool EditarCentroCosto()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEditarCentroCosto";

                    SqlParameter p_nombrecentro = new SqlParameter("@nombrecentro", SqlDbType.VarChar);
                    SqlParameter p_descripcioncentro = new SqlParameter("@descripcioncentro", SqlDbType.VarChar);
                    SqlParameter p_idcentro = new SqlParameter("@id", SqlDbType.Int);

                    p_nombrecentro.Direction = ParameterDirection.Input;
                    p_nombrecentro.Value = Nombrecentro;
                    p_descripcioncentro.Direction = ParameterDirection.Input;
                    p_descripcioncentro.Value = Descripcioncentro;
                    p_idcentro.Direction = ParameterDirection.Input;
                    p_idcentro.Value = Idcentrocosto;

                    objCommand.Parameters.Add(p_nombrecentro);
                    objCommand.Parameters.Add(p_descripcioncentro);
                    objCommand.Parameters.Add(p_idcentro);

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
        public bool EliminarCentroCosto()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarCentroCosto";

                    SqlParameter p_idcentrocosto = new SqlParameter("@id", SqlDbType.Int);

                    p_idcentrocosto.Direction = ParameterDirection.Input;
                    p_idcentrocosto.Value = Idcentrocosto;

                    objCommand.Parameters.Add(p_idcentrocosto);

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
        public DataSet BuscarCentroCosto()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarCentroCosto";

                SqlParameter p_centrocosto = new SqlParameter("@centrocosto", SqlDbType.VarChar);

                p_centrocosto.Direction = ParameterDirection.Input;
                p_centrocosto.Value = Nombrecentro;

                objCommand.Parameters.Add(p_centrocosto);

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