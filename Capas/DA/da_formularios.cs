using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_formularios
    {
        SqlConnection objConn = new SqlConnection();

        private string nombreformulario;
        public string Nombreformulario
        {
            get { return nombreformulario; }
            set { nombreformulario = value; }
        }

        private string descripcionformulario;
        public string Descripcionformulario
        {
            get { return descripcionformulario; }
            set { descripcionformulario = value; }
        }

        private int idformulario;
        public int Idformulario
        {
            get { return idformulario; }
            set { idformulario = value; }
        }

        private int idcompetencia;
        public int Idcompetencia
        {
            get { return idcompetencia; }
            set { idcompetencia = value; }
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
        public bool IngresarFormulario()
        {
            bool bSuccess = false;
            int iSuccess = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarFormulario";

                    SqlParameter p_nombreformulario = new SqlParameter("@nombreformulario", SqlDbType.VarChar);
                    SqlParameter p_descripcionformulario = new SqlParameter("@descripcionformulario", SqlDbType.VarChar);
                    SqlParameter p_success = new SqlParameter("@returnvalue", SqlDbType.Int);

                    p_nombreformulario.Direction = ParameterDirection.Input;
                    p_nombreformulario.Value = Nombreformulario;
                    p_descripcionformulario.Direction = ParameterDirection.Input;
                    p_descripcionformulario.Value = Descripcionformulario;
                    p_success.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_nombreformulario);
                    objCommand.Parameters.Add(p_descripcionformulario);
                    objCommand.Parameters.Add(p_success);

                    objCommand.ExecuteNonQuery();

                    iSuccess = (int)p_success.Value;

                    if (iSuccess == 1)
                    {
                        bSuccess = true;
                    }
                }
                catch
                {
                    bSuccess = false;
                }
                return bSuccess;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DataSet ObtenerFormulario()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerFormulario";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_valueformulario = new SqlParameter("@valueformulario", SqlDbType.Int);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_valueformulario.Direction = ParameterDirection.Input;
                p_valueformulario.Value = Idformulario;

                objCommand.Parameters.Add(p_tipoconsulta);
                objCommand.Parameters.Add(p_valueformulario);

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
                    objCommand.CommandText = "spIngresarAsignacion";

                    SqlParameter p_valueformulario = new SqlParameter("@valueformulario", SqlDbType.Int);
                    SqlParameter p_valuecompetencia = new SqlParameter("@valuecompetencia", SqlDbType.Int);

                    p_valueformulario.Direction = ParameterDirection.Input;
                    p_valueformulario.Value = Idformulario;
                    p_valuecompetencia.Direction = ParameterDirection.Input;
                    p_valuecompetencia.Value = Idcompetencia;

                    objCommand.Parameters.Add(p_valueformulario);
                    objCommand.Parameters.Add(p_valuecompetencia);

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

        public bool EditarFormulario()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEditarFormulario";

                SqlParameter p_nombreformulario = new SqlParameter("@nombreformulario", SqlDbType.VarChar);
                SqlParameter p_descripcionformulario = new SqlParameter("@descripcionformulario", SqlDbType.VarChar);
                SqlParameter p_idformulario = new SqlParameter("@id", SqlDbType.Int);

                p_nombreformulario.Direction = ParameterDirection.Input;
                p_nombreformulario.Value = Nombreformulario;
                p_descripcionformulario.Direction = ParameterDirection.Input;
                p_descripcionformulario.Value = Descripcionformulario;
                p_idformulario.Direction = ParameterDirection.Input;
                p_idformulario.Value = Idformulario;

                objCommand.Parameters.Add(p_nombreformulario);
                objCommand.Parameters.Add(p_descripcionformulario);
                objCommand.Parameters.Add(p_idformulario);

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

        public bool EliminarFormulario()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEliminarFormulario";

                SqlParameter p_idformulario = new SqlParameter("@id", SqlDbType.Int);

                p_idformulario.Direction = ParameterDirection.Input;
                p_idformulario.Value = Idformulario;

                objCommand.Parameters.Add(p_idformulario);

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
        public bool EliminarAsignacion()
        {
            bool bReturn = false;
            int iReturn = 0;
            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarAsignacion";

                    SqlParameter p_idformulario = new SqlParameter("@idformulario", SqlDbType.Int);
                    SqlParameter p_idcompetencia = new SqlParameter("@idcompetencia", SqlDbType.Int);

                    p_idformulario.Direction = ParameterDirection.Input;
                    p_idformulario.Value = Idformulario;
                    p_idcompetencia.Direction = ParameterDirection.Input;
                    p_idcompetencia.Value = Idformulario;

                    objCommand.Parameters.Add(p_idformulario);
                    objCommand.Parameters.Add(p_idcompetencia);

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
        public DataSet BuscarFormulario()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarFormulario";

                SqlParameter p_formulario = new SqlParameter("@formulario", SqlDbType.VarChar);

                p_formulario.Direction = ParameterDirection.Input;
                p_formulario.Value = Nombreformulario;

                objCommand.Parameters.Add(p_formulario);
                
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