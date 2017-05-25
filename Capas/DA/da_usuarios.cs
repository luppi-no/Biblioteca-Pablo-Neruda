using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_usuarios
    {
        SqlConnection objConn = new SqlConnection();

        private string rut;
        public string Rut
        {
            get { return rut; }
            set { rut = value; }
        }

        private string nombreusuario;
        public string Nombreusuario
        {
            get { return nombreusuario; }
            set { nombreusuario = value; }
        }

        private string apepatusuario;
        public string Apepatusuario
        {
            get { return apepatusuario; }
            set { apepatusuario = value; }
        }

        private string apematusuario;
        public string Apematusuario
        {
            get { return apematusuario; }
            set { apematusuario = value; }
        }

        private string mailusuario;
        public string Mailusuario
        {
            get { return mailusuario; }
            set { mailusuario = value; }
        }

        private int idarea;
        public int Idarea
        {
            get { return idarea; }
            set { idarea = value; }
        }

        private int idcargo;
        public int Idcargo
        {
            get { return idcargo; }
            set { idcargo = value; }
        }

        private int idcentro;
        public int Idcentro
        {
            get { return idcentro; }
            set { idcentro = value; }
        }

        private int idformulario;
        public int Idformulario
        {
            get { return idformulario; }
            set { idformulario = value; }
        }

        private string rutevaluador;
        public string Rutevaluador
        {
            get { return rutevaluador; }
            set { rutevaluador = value; }
        }

        private string rutevaluado;
        public string Rutevaluado
        {
            get { return rutevaluado; }
            set { rutevaluado = value; }
        }

        private string idperiodo;
        public string Idperiodo
        {
            get { return idperiodo; }
            set { idperiodo = value; }
        }

        private string consulta;
        public string Consulta
        {
            get { return consulta; }
            set { consulta = value; }
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

        public bool IngresarUsuario()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spIngresarUsuario";

                SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                SqlParameter p_nombreusuario = new SqlParameter("@nombreusuario", SqlDbType.VarChar);
                SqlParameter p_apepatusuario = new SqlParameter("@apepatusuario", SqlDbType.VarChar);
                SqlParameter p_apematusuario = new SqlParameter("@apematusuario", SqlDbType.VarChar);
                SqlParameter p_mailusuario = new SqlParameter("@mailusuario", SqlDbType.VarChar);
                SqlParameter p_valuearea = new SqlParameter("@valuearea", SqlDbType.Int);
                SqlParameter p_valuecargo = new SqlParameter("@valuecargo", SqlDbType.Int);
                SqlParameter p_valuecentro = new SqlParameter("@valuecentro", SqlDbType.Int);
                SqlParameter p_valueformulario = new SqlParameter("@valueformulario", SqlDbType.Int);

                p_rut.Direction = ParameterDirection.Input;
                p_rut.Value = Rut;
                p_nombreusuario.Direction = ParameterDirection.Input;
                p_nombreusuario.Value = Nombreusuario;
                p_apepatusuario.Direction = ParameterDirection.Input;
                p_apepatusuario.Value = Apepatusuario;
                p_apematusuario.Direction = ParameterDirection.Input;
                p_apematusuario.Value = Apematusuario;
                p_mailusuario.Direction = ParameterDirection.Input;
                p_mailusuario.Value = Mailusuario;
                p_valuearea.Direction = ParameterDirection.Input;
                p_valuearea.Value = Idarea;
                p_valuecargo.Direction = ParameterDirection.Input;
                p_valuecargo.Value = Idcargo;
                p_valuecentro.Direction = ParameterDirection.Input;
                p_valuecentro.Value = Idcentro;
                p_valueformulario.Direction = ParameterDirection.Input;
                p_valueformulario.Value = Idformulario;

                objCommand.Parameters.Add(p_rut);
                objCommand.Parameters.Add(p_nombreusuario);
                objCommand.Parameters.Add(p_apepatusuario);
                objCommand.Parameters.Add(p_apematusuario);
                objCommand.Parameters.Add(p_mailusuario);
                objCommand.Parameters.Add(p_valuearea);
                objCommand.Parameters.Add(p_valuecargo);
                objCommand.Parameters.Add(p_valuecentro);
                objCommand.Parameters.Add(p_valueformulario);

                
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

        public bool EditarUsuario()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEditarUsuario";

                    SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                    SqlParameter p_nombreusuario = new SqlParameter("@nombreusuario", SqlDbType.VarChar);
                    SqlParameter p_apepatusuario = new SqlParameter("@apepatusuario", SqlDbType.VarChar);
                    SqlParameter p_apematusuario = new SqlParameter("@apematusuario", SqlDbType.VarChar);
                    SqlParameter p_mailusuario = new SqlParameter("@mailusuario", SqlDbType.VarChar);
                    SqlParameter p_valuearea = new SqlParameter("@valuearea", SqlDbType.Int);
                    SqlParameter p_valuecargo = new SqlParameter("@valuecargo", SqlDbType.Int);
                    SqlParameter p_valuecentro = new SqlParameter("@valuecentro", SqlDbType.Int);
                    SqlParameter p_valueformulario = new SqlParameter("@valueformulario", SqlDbType.Int);
                    SqlParameter p_return = new SqlParameter("@returnvalue", SqlDbType.Int);

                    p_rut.Direction = ParameterDirection.Input;
                    p_rut.Value = Rut;
                    p_nombreusuario.Direction = ParameterDirection.Input;
                    p_nombreusuario.Value = Nombreusuario;
                    p_apepatusuario.Direction = ParameterDirection.Input;
                    p_apepatusuario.Value = Apepatusuario;
                    p_apematusuario.Direction = ParameterDirection.Input;
                    p_apematusuario.Value = Apematusuario;
                    p_mailusuario.Direction = ParameterDirection.Input;
                    p_mailusuario.Value = Mailusuario;
                    p_valuearea.Direction = ParameterDirection.Input;
                    p_valuearea.Value = Idarea;
                    p_valuecargo.Direction = ParameterDirection.Input;
                    p_valuecargo.Value = Idcargo;
                    p_valuecentro.Direction = ParameterDirection.Input;
                    p_valuecentro.Value = Idcentro;
                    p_valueformulario.Direction = ParameterDirection.Input;
                    p_valueformulario.Value = Idformulario;
                    p_return.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_rut);
                    objCommand.Parameters.Add(p_nombreusuario);
                    objCommand.Parameters.Add(p_apepatusuario);
                    objCommand.Parameters.Add(p_apematusuario);
                    objCommand.Parameters.Add(p_mailusuario);
                    objCommand.Parameters.Add(p_valuearea);
                    objCommand.Parameters.Add(p_valuecargo);
                    objCommand.Parameters.Add(p_valuecentro);
                    objCommand.Parameters.Add(p_valueformulario);
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


        public bool EliminarUsuario(out string sMess)
        {
            sMess = "";
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarUsuario";

                    SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                   SqlParameter p_return = new SqlParameter("@returnvalue", SqlDbType.Int);

                    p_rut.Direction = ParameterDirection.Input;
                    p_rut.Value = Rut;
                    p_return.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_rut);
                    objCommand.Parameters.Add(p_return);

                    objCommand.ExecuteNonQuery();

                    iReturn = (int)p_return.Value;

                    if (iReturn == 1)
                    {
                        bReturn = true;
                    }
                }
                catch (Exception ex)
                {
                    bReturn = false;
                    sMess = ex.Message;
                }
                return bReturn;
            }
        }

        public DataSet ObtenerUsuario()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerUsuario";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_valueevaluador = new SqlParameter("@valueevaluador", SqlDbType.VarChar);
                SqlParameter p_consulta = new SqlParameter("@consulta", SqlDbType.VarChar);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_valueevaluador.Direction = ParameterDirection.Input;
                p_valueevaluador.Value = Rutevaluador;
                p_consulta.Direction = ParameterDirection.Input;
                p_consulta.Value = Consulta;

                objCommand.Parameters.Add(p_tipoconsulta);
                objCommand.Parameters.Add(p_valueevaluador);
                objCommand.Parameters.Add(p_consulta);

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

        public bool AsignarEvaluado()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spAsignarEvaluado";

                SqlParameter p_valueevaluador = new SqlParameter("@valueevaluador", SqlDbType.VarChar);
                SqlParameter p_valueevaluado = new SqlParameter("@valueevaluado", SqlDbType.VarChar);
                SqlParameter p_valueperiodo = new SqlParameter("@valueperiodo", SqlDbType.VarChar);

                p_valueevaluador.Direction = ParameterDirection.Input;
                p_valueevaluador.Value = Rutevaluador;
                p_valueevaluado.Direction = ParameterDirection.Input;
                p_valueevaluado.Value = Rutevaluado;
                p_valueperiodo.Direction = ParameterDirection.Input;
                p_valueperiodo.Value = Idperiodo;

                objCommand.Parameters.Add(p_valueevaluador);
                objCommand.Parameters.Add(p_valueevaluado);
                objCommand.Parameters.Add(p_valueperiodo);

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
                    objCommand.CommandText = "spEliminarAsignacionEvaluado";

                    SqlParameter p_valueevaluador = new SqlParameter("@valueevaluador", SqlDbType.VarChar);
                    SqlParameter p_valueevaluado = new SqlParameter("@valueevaluado", SqlDbType.VarChar);
                    SqlParameter p_valueperiodo = new SqlParameter("@valueperiodo", SqlDbType.VarChar);
                    SqlParameter p_return = new SqlParameter("@returnvalue", SqlDbType.Int);

                    p_valueevaluador.Direction = ParameterDirection.Input;
                    p_valueevaluador.Value = Rutevaluador;
                    p_valueevaluado.Direction = ParameterDirection.Input;
                    p_valueevaluado.Value = Rutevaluado;
                    p_valueperiodo.Direction = ParameterDirection.Input;
                    p_valueperiodo.Value = Idperiodo;
                    p_return.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_valueevaluador);
                    objCommand.Parameters.Add(p_valueevaluado);
                    objCommand.Parameters.Add(p_valueperiodo);
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

        public DataSet BuscarUsuario()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarUsuario";

                SqlParameter p_usuario = new SqlParameter("@usuario", SqlDbType.VarChar);

                p_usuario.Direction = ParameterDirection.Input;
                p_usuario.Value = Nombreusuario;

                objCommand.Parameters.Add(p_usuario);
               
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