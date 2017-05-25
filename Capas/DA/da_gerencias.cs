using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_gerencias
    {
        SqlConnection objConn = new SqlConnection();

        private string nombregerencia;
        public string Nombregerencia
        {
            get { return nombregerencia; }
            set { nombregerencia = value; }
        }

        private int idarea;
        public int Idarea
        {
            get { return idarea; }
            set { idarea = value; }
        }

        private int idgerencia;
        public int Idgerencia
        {
            get { return idgerencia; }
            set { idgerencia = value; }
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

        public bool IngresarGerencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spIngresarGerencia";

                SqlParameter p_nombregerencia = new SqlParameter("@nombregerencia", SqlDbType.VarChar);

                p_nombregerencia.Direction = ParameterDirection.Input;
                p_nombregerencia.Value = Nombregerencia;

                objCommand.Parameters.Add(p_nombregerencia);
                
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

        public bool EditarGerencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEditarGerencia";

                SqlParameter p_nombregerencia = new SqlParameter("@nombregerencia", SqlDbType.VarChar);
                SqlParameter p_idgerencia = new SqlParameter("@id", SqlDbType.Int);

                p_nombregerencia.Direction = ParameterDirection.Input;
                p_nombregerencia.Value = Nombregerencia;
                p_idgerencia.Direction = ParameterDirection.Input;
                p_idgerencia.Value = Idgerencia;

                objCommand.Parameters.Add(p_nombregerencia);
                objCommand.Parameters.Add(p_idgerencia);
                
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

        public bool EliminarGerencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEliminarGerencia";

                SqlParameter p_idgerencia = new SqlParameter("@id", SqlDbType.Int);

                p_idgerencia.Direction = ParameterDirection.Input;
                p_idgerencia.Value = Idgerencia;

                objCommand.Parameters.Add(p_idgerencia);

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
        public DataSet ObtenerGerencia()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerGerencia";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_valuegerencia = new SqlParameter("@valuegerencia", SqlDbType.Int);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_valuegerencia.Direction = ParameterDirection.Input;
                p_valuegerencia.Value = Idgerencia;

                objCommand.Parameters.Add(p_tipoconsulta);
                objCommand.Parameters.Add(p_valuegerencia);

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
        public bool IngresarAsignacion()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarAsignacionGerencia";

                    SqlParameter p_valuegerencia = new SqlParameter("@valuegerencia", SqlDbType.Int);
                    SqlParameter p_valuearea = new SqlParameter("@valuearea", SqlDbType.Int);
                    SqlParameter p_return = new SqlParameter("@return", SqlDbType.Int);

                    p_valuegerencia.Direction = ParameterDirection.Input;
                    p_valuegerencia.Value = Idgerencia;
                    p_valuearea.Direction = ParameterDirection.Input;
                    p_valuearea.Value = Idarea;
                    p_return.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_valuegerencia);
                    objCommand.Parameters.Add(p_valuearea);
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
        public bool EliminarAsignacionAreaGerencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {


                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarAsignacionAreaGerencia";

                    SqlParameter p_idgerencia = new SqlParameter("@idgerencia", SqlDbType.Int);
                    SqlParameter p_valuearea = new SqlParameter("@idarea", SqlDbType.Int);

                    p_idgerencia.Direction = ParameterDirection.Input;
                    p_idgerencia.Value = Idgerencia;
                    p_valuearea.Direction = ParameterDirection.Input;
                    p_valuearea.Value = Idarea;

                    objCommand.Parameters.Add(p_idgerencia);
                    objCommand.Parameters.Add(p_valuearea);

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
        public DataSet BuscarGerencia()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarGerencia";

                SqlParameter p_gerencia = new SqlParameter("@gerencia", SqlDbType.VarChar);

                p_gerencia.Direction = ParameterDirection.Input;
                p_gerencia.Value = Nombregerencia;

                objCommand.Parameters.Add(p_gerencia);

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