using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_competencias
    {
        SqlConnection objConn = new SqlConnection();

        private string nombrecompetencia;
        public string Nombrecompetencia
        {
            get { return nombrecompetencia; }
            set { nombrecompetencia = value; }
        }

        private string descripcioncompetencia;
        public string Descripcioncompetencia
        {
            get { return descripcioncompetencia; }
            set { descripcioncompetencia = value; }
        }

        private int idtipocompetencia;
        public int Idtipocompetencia
        {
            get { return idtipocompetencia; }
            set { idtipocompetencia = value; }
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

        private decimal peso;
        public decimal Peso
        {
            get { return peso; }
            set { peso = value; }
        }

        private int notaesperada;
        public int Notaesperada
        {
            get { return notaesperada; }
            set { notaesperada = value; }
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
        public DataSet ObtenerCompetencia()
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
        public bool IngresarCompetencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarCompetencia";

                    SqlParameter p_nombrecompetencia = new SqlParameter("@nombrecompetencia", SqlDbType.VarChar);
                    SqlParameter p_descripcioncompetencia = new SqlParameter("@descripcioncompetencia", SqlDbType.VarChar);
                    SqlParameter p_peso = new SqlParameter("@peso", SqlDbType.Decimal);
                    SqlParameter p_notaesperada = new SqlParameter("@notaesperada", SqlDbType.Int);
                    SqlParameter p_valuetipocompetencia = new SqlParameter("@valuetipocompetencia", SqlDbType.Int);

                    p_nombrecompetencia.Direction = ParameterDirection.Input;
                    p_nombrecompetencia.Value = Nombrecompetencia;
                    p_descripcioncompetencia.Direction = ParameterDirection.Input;
                    p_descripcioncompetencia.Value = Descripcioncompetencia;
                    p_peso.Direction = ParameterDirection.Input;
                    p_peso.Value = Peso;
                    p_notaesperada.Direction = ParameterDirection.Input;
                    p_notaesperada.Value = Notaesperada;
                    p_valuetipocompetencia.Direction = ParameterDirection.Input;
                    p_valuetipocompetencia.Value = Idtipocompetencia;

                    objCommand.Parameters.Add(p_nombrecompetencia);
                    objCommand.Parameters.Add(p_descripcioncompetencia);
                    objCommand.Parameters.Add(p_peso);
                    objCommand.Parameters.Add(p_notaesperada);
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
        public bool EliminarCompetencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarCompetencia";

                    SqlParameter p_valuecompetencia = new SqlParameter("@valuecompetencia", SqlDbType.Int);

                    p_valuecompetencia.Direction = ParameterDirection.Input;
                    p_valuecompetencia.Value = Idcompetencia;

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

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool EditarCompetencia()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEditarCompetencia";

                    SqlParameter p_valuecompetencia = new SqlParameter("@valuecompetencia", SqlDbType.Int);
                    SqlParameter p_nombrecompetencia = new SqlParameter("@nombrecompetencia", SqlDbType.VarChar);
                    SqlParameter p_descripcioncompetencia = new SqlParameter("@descripcioncompetencia", SqlDbType.VarChar);
                    SqlParameter p_peso = new SqlParameter("@peso", SqlDbType.Decimal);
                    SqlParameter p_notaesperada = new SqlParameter("@notaesperada", SqlDbType.Int);

                    p_valuecompetencia.Direction = ParameterDirection.Input;
                    p_valuecompetencia.Value = Idcompetencia;
                    p_nombrecompetencia.Direction = ParameterDirection.Input;
                    p_nombrecompetencia.Value = Nombrecompetencia;
                    p_descripcioncompetencia.Direction = ParameterDirection.Input;
                    p_descripcioncompetencia.Value = Descripcioncompetencia;
                    p_peso.Direction = ParameterDirection.Input;
                    p_peso.Value = Peso;
                    p_notaesperada.Direction = ParameterDirection.Input;
                    p_notaesperada.Value = Notaesperada;

                    objCommand.Parameters.Add(p_valuecompetencia);
                    objCommand.Parameters.Add(p_nombrecompetencia);
                    objCommand.Parameters.Add(p_descripcioncompetencia);
                    objCommand.Parameters.Add(p_peso);
                    objCommand.Parameters.Add(p_notaesperada);

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
        public DataSet BuscarCompetencia()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarCompetencia";

                SqlParameter p_competencia = new SqlParameter("@competencia", SqlDbType.VarChar);

                p_competencia.Direction = ParameterDirection.Input;
                p_competencia.Value = Nombrecompetencia;

                objCommand.Parameters.Add(p_competencia);

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