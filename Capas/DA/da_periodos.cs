using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    /// <summary>
    /// Capa de Datos - Periodos
    /// </summary>
    public class da_periodos
    {
        SqlConnection objConn = new SqlConnection();

        private int idperiodo;
        public int Idperiodo
        {
            get { return idperiodo; }
            set { idperiodo = value; }
        }

        private string nombreperiodo;
        public string Nombreperiodo
        {
            get { return nombreperiodo; }
            set { nombreperiodo = value; }
        }

        private string descripcionperiodo;
        public string Descripcionperiodo
        {
            get { return descripcionperiodo; }
            set { descripcionperiodo = value; }
        }

        private string anno;
        public string Anno
        {
            get { return anno; }
            set { anno = value; }
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
        public bool IngresarPeriodo()
        {
            using (SqlCommand objCommand = new SqlCommand())
            {
                bool bReturn = false;
                int iReturn = 0;

                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarPeriodo";

                    SqlParameter p_nombreperiodo = new SqlParameter("@nombreperiodo", SqlDbType.VarChar);
                    SqlParameter p_descripcionperiodo = new SqlParameter("@descripcionperiodo", SqlDbType.VarChar);
                    SqlParameter p_return = new SqlParameter("@returnvalue", SqlDbType.Int);

                    p_nombreperiodo.Direction = ParameterDirection.Input;
                    p_nombreperiodo.Value = Nombreperiodo;
                    p_descripcionperiodo.Direction = ParameterDirection.Input;
                    p_descripcionperiodo.Value = Descripcionperiodo;
                    p_return.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_nombreperiodo);
                    objCommand.Parameters.Add(p_descripcionperiodo);
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
                return bReturn;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool PeriodoExiste()
        {
            using (SqlCommand objCommand = new SqlCommand())
            {
                bool bReturn = false;
                int iReturn = 0;

                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spObtenerPeriodo";

                    SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                    SqlParameter p_return = new SqlParameter("@returnvalue", SqlDbType.Int);

                    p_tipoconsulta.Direction = ParameterDirection.Input;
                    p_tipoconsulta.Value = Tipoconsulta;
                    p_return.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_tipoconsulta);
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
                return bReturn;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DataSet ObtenerPeriodo()
        {
            DataSet objData = new DataSet();

            using (SqlCommand objCommand = new SqlCommand())
            {
                using (SqlDataAdapter objAdapter = new SqlDataAdapter())
                {
                    

                    try
                    {
                        objCommand.Connection = objConn;
                        objCommand.CommandType = CommandType.StoredProcedure;
                        objCommand.CommandText = "spObtenerPeriodo";

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
                }
            }
            return objData;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DataSet ObtenerPeriodoPorAnno()
        {
            DataSet objData = new DataSet();

            using (SqlCommand objCommand = new SqlCommand())
            {
                using (SqlDataAdapter objAdapter = new SqlDataAdapter())
                {


                    try
                    {
                        objCommand.Connection = objConn;
                        objCommand.CommandType = CommandType.StoredProcedure;
                        objCommand.CommandText = "spObtenerPeriodoPorAnno";

                        SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                        SqlParameter p_anno = new SqlParameter("@anno", SqlDbType.VarChar);

                        p_tipoconsulta.Direction = ParameterDirection.Input;
                        p_tipoconsulta.Value = Tipoconsulta;
                        p_anno.Direction = ParameterDirection.Input;
                        p_anno.Value = Anno;

                        objCommand.Parameters.Add(p_tipoconsulta);
                        objCommand.Parameters.Add(p_anno);

                        objAdapter.SelectCommand = objCommand;
                        objAdapter.Fill(objData);
                    }
                    catch
                    {
                        objData = null;
                    }
                }
            }
            return objData;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool CerrarPeriodoEvaluacion()
        {
            using (SqlCommand objCommand = new SqlCommand())
            {
                bool bReturn = false;
                int iReturn = 0;

                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEditarPeriodo";

                    SqlParameter p_valueperiodo = new SqlParameter("@valueperiodo", SqlDbType.Int);
                    SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                    SqlParameter p_return = new SqlParameter("@returnvalue", SqlDbType.Int);

                    p_valueperiodo.Direction = ParameterDirection.Input;
                    p_valueperiodo.Value = Idperiodo;
                    p_tipoconsulta.Direction = ParameterDirection.Input;
                    p_tipoconsulta.Value = Tipoconsulta;
                    p_return.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_valueperiodo);
                    objCommand.Parameters.Add(p_tipoconsulta);
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
                return bReturn;
            }
        }
    }
}