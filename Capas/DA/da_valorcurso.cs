using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_valorcurso
    {
        SqlConnection objConn = new SqlConnection();

        private int idcapacitacion;
        public int Idcapacitacion
        {
            get { return idcapacitacion; }
            set { idcapacitacion = value; }
        }

        private int valorempresa;
        public int Valorempresa
        {
            get { return valorempresa; }
            set { valorempresa = value; }
        }

        private int valorfranquicia;
        public int Valorfranquicia
        {
            get { return valorfranquicia; }
            set { valorfranquicia = value; }
        }

        private string mes;
        public string Mes
        {
            get { return mes; }
            set { mes = value; }
        }

        private int idvalorcurso;
        public int Idvalorcurso
        {
            get { return idvalorcurso; }
            set { idvalorcurso = value; }
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
        public DataSet ValorCursoCapacitacion()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerValorCurso";

                SqlParameter p_id = new SqlParameter("@intIDProCap", SqlDbType.Int);

                p_id.Direction = ParameterDirection.Input;
                p_id.Value = Idcapacitacion;

                objCommand.Parameters.Add(p_id);

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
        public bool IngresarValorCurso()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spIngresarValorCurso";

                SqlParameter p_id = new SqlParameter("@intIDProCap", SqlDbType.Int);
                SqlParameter p_valorEmpresa = new SqlParameter("@intValorEmpresa", SqlDbType.Int);
                SqlParameter p_valorFranquicia = new SqlParameter("@intValorFranquicia", SqlDbType.Int);
                SqlParameter p_mes = new SqlParameter("@vchMes", SqlDbType.VarChar);

                p_id.Direction = ParameterDirection.Input;
                p_id.Value = Idcapacitacion;
                p_valorEmpresa.Direction = ParameterDirection.Input;
                p_valorEmpresa.Value = Valorempresa;
                p_valorFranquicia.Direction = ParameterDirection.Input;
                p_valorFranquicia.Value = Valorfranquicia;
                p_mes.Direction = ParameterDirection.Input;
                p_mes.Value = Mes;

                objCommand.Parameters.Add(p_id);
                objCommand.Parameters.Add(p_valorEmpresa);
                objCommand.Parameters.Add(p_valorFranquicia);
                objCommand.Parameters.Add(p_mes);

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
        public bool EliminarValorCurso()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {


            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEliminarValorCurso";

                SqlParameter p_idValor = new SqlParameter("@idValor", SqlDbType.Int);

                p_idValor.Direction = ParameterDirection.Input;
                p_idValor.Value = Idvalorcurso;

                objCommand.Parameters.Add(p_idValor);

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
        public bool EditarValorCurso()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {


            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEditarValorCurso";

                SqlParameter p_idCap = new SqlParameter("@intIDProCap", SqlDbType.Int);
                SqlParameter p_idValor = new SqlParameter("@idValor", SqlDbType.Int);
                SqlParameter p_vEmpresa = new SqlParameter("@valorEmpresa", SqlDbType.VarChar);
                SqlParameter p_vFranquicia = new SqlParameter("@valorFranquicia", SqlDbType.VarChar);
                SqlParameter p_mes = new SqlParameter("@mes", SqlDbType.VarChar);

                p_idCap.Direction = ParameterDirection.Input;
                p_idCap.Value = Idcapacitacion;
                p_idValor.Direction = ParameterDirection.Input;
                p_idValor.Value = Idvalorcurso;
                p_vEmpresa.Direction = ParameterDirection.Input;
                p_vEmpresa.Value = Valorempresa;
                p_vFranquicia.Direction = ParameterDirection.Input;
                p_vFranquicia.Value = Valorfranquicia;
                p_mes.Direction = ParameterDirection.Input;
                p_mes.Value = Mes;

                objCommand.Parameters.Add(p_idCap);
                objCommand.Parameters.Add(p_idValor);
                objCommand.Parameters.Add(p_vEmpresa);
                objCommand.Parameters.Add(p_vFranquicia);
                objCommand.Parameters.Add(p_mes);

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
    }
}