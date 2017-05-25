using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_tipocompetencias
    {
        SqlConnection objConn = new SqlConnection();

        private string nombretipocompetencia;
        public string Nombretipocompetencia
        {
            get { return nombretipocompetencia; }
            set { nombretipocompetencia = value; }
        }

        private string descripciontipocompetencia;
        public string Descripciontipocompetencia
        {
            get { return descripciontipocompetencia; }
            set { descripciontipocompetencia = value; }
        }

        private int idtipocompatencia;
        public int Idtipocompetencia
        {
            get { return idtipocompatencia; }
            set { idtipocompatencia = value; }
        }

        private int idcategoria;
        public int Idcategoria
        {
            get { return idcategoria; }
            set { idcategoria = value; }
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
        public DataSet ObtenerTipoCompetencia()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerCompetencia";

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
        public bool IngresarTipoCompetencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarTipoCompetencia";

                    SqlParameter p_nombretipocompetencia = new SqlParameter("@nombretipocompetencia", SqlDbType.VarChar);
                    SqlParameter p_descripciontipocompetencia = new SqlParameter("@descripciontipocompetencia", SqlDbType.VarChar);
                    SqlParameter p_valuecategoria = new SqlParameter("@valuecategoria", SqlDbType.Int);

                    p_nombretipocompetencia.Direction = ParameterDirection.Input;
                    p_nombretipocompetencia.Value = Nombretipocompetencia;
                    p_descripciontipocompetencia.Direction = ParameterDirection.Input;
                    p_descripciontipocompetencia.Value = Descripciontipocompetencia;
                    p_valuecategoria.Direction = ParameterDirection.Input;
                    p_valuecategoria.Value = Idcategoria;

                    objCommand.Parameters.Add(p_nombretipocompetencia);
                    objCommand.Parameters.Add(p_descripciontipocompetencia);
                    objCommand.Parameters.Add(p_valuecategoria);

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
        public bool EliminarTipoCompetencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarTipoCompetencia";

                    SqlParameter p_valuetipocompetencia = new SqlParameter("@valuetipocompetencia", SqlDbType.Int);

                    p_valuetipocompetencia.Direction = ParameterDirection.Input;
                    p_valuetipocompetencia.Value = Idtipocompetencia;

                    objCommand.Parameters.Add(p_valuetipocompetencia);

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
        public bool EditarTipoCompetencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEditarTipoCompetencia";

                    SqlParameter p_valuetipocompetencia = new SqlParameter("@valuetipocompetencia", SqlDbType.Int);
                    SqlParameter p_nombretipocompetencia = new SqlParameter("@nombretipocompetencia", SqlDbType.VarChar);
                    SqlParameter p_descripciontipocompetencia = new SqlParameter("@descripciontipocompetencia", SqlDbType.VarChar);

                    p_valuetipocompetencia.Direction = ParameterDirection.Input;
                    p_valuetipocompetencia.Value = Idtipocompetencia;
                    p_nombretipocompetencia.Direction = ParameterDirection.Input;
                    p_nombretipocompetencia.Value = Nombretipocompetencia;
                    p_descripciontipocompetencia.Direction = ParameterDirection.Input;
                    p_descripciontipocompetencia.Value = Descripciontipocompetencia;

                    objCommand.Parameters.Add(p_valuetipocompetencia);
                    objCommand.Parameters.Add(p_nombretipocompetencia);
                    objCommand.Parameters.Add(p_descripciontipocompetencia);

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
        public DataSet BuscarTipoCompetencia()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarTipoCompetencia";

                SqlParameter p_tipocompetencia = new SqlParameter("@tipocompetencia", SqlDbType.VarChar);

                p_tipocompetencia.Direction = ParameterDirection.Input;
                p_tipocompetencia.Value = Nombretipocompetencia;

                objCommand.Parameters.Add(p_tipocompetencia);

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