using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_evaluaciones
    {
        SqlConnection objConn = new SqlConnection();

        private string rut;
        public string Rut
        {
            get { return rut; }
            set { rut = value; }
        }

        private string busqueda;
        public string Busqueda
        {
            get { return busqueda; }
            set { busqueda = value; }
        }

        private string filtroconsulta;
        public string Filtroconsulta
        {
            get { return filtroconsulta; }
            set { filtroconsulta = value; }
        }

        private string tipoconsulta;
        public string Tipoconsulta
        {
            get { return tipoconsulta; }
            set { tipoconsulta = value; }
        }

        private string nombreevaluador;
        public string Nombreevaluador
        {
            get { return nombreevaluador; }
            set { nombreevaluador = value; }
        }

        private string cargo;
        public string Cargo
        {
            get { return cargo; }
            set { cargo = value; }
        }

        private int idperiodo;
        public int Idperiodo
        {
            get { return idperiodo; }
            set { idperiodo = value; }
        }

        private int idasignacion;
        public int Idasignacion
        {
            get { return idasignacion; }
            set { idasignacion = value; }
        }

        private int idnota;
        public int Idnota
        {
            get { return idnota; }
            set { idnota = value; }
        }

        private string observacion;
        public string Observacion
        {
            get { return observacion; }
            set { observacion = value; }
        }

        private int idcompetencia;
        public int Idcompetencia
        {
            get { return idcompetencia; }
            set { idcompetencia = value; }
        }

        private string deacuerdo;
        public string Deacuerdo
        {
            get { return deacuerdo; }
            set { deacuerdo = value; }
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
        public DataSet ObtenerEvaluacion()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerEvaluacion";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_rut.Direction = ParameterDirection.Input;
                p_rut.Value = Rut;

                objCommand.Parameters.Add(p_tipoconsulta);
                objCommand.Parameters.Add(p_rut);

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
        public bool EsEvaluador()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEsEvaluador";

                    SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);

                    p_rut.Direction = ParameterDirection.Input;
                    p_rut.Value = Rut;

                    objCommand.Parameters.Add(p_rut);

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
        public DataSet BuscarEvaluacion()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscar";

                SqlParameter p_busqueda = new SqlParameter("@busqueda", SqlDbType.VarChar);
                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_filtroconsulta = new SqlParameter("@filtroconsulta", SqlDbType.VarChar);

                p_busqueda.Direction = ParameterDirection.Input;
                p_busqueda.Value = Busqueda;
                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_filtroconsulta.Direction = ParameterDirection.Input;
                p_filtroconsulta.Value = Filtroconsulta;

                objCommand.Parameters.Add(p_busqueda);
                objCommand.Parameters.Add(p_tipoconsulta);
                objCommand.Parameters.Add(p_filtroconsulta);

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
        public DataSet BuscarEvaluadosACapacitar()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarEvaluadosACapacitar";

                SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                SqlParameter p_nombreEvaluador = new SqlParameter("@nombre", SqlDbType.VarChar);
                SqlParameter p_cargo = new SqlParameter("@cargo", SqlDbType.VarChar);
                SqlParameter p_idperiodo = new SqlParameter("@idperiodo", SqlDbType.Int);

                p_rut.Direction = ParameterDirection.Input;
                p_rut.Value = Rut;
                p_nombreEvaluador.Direction = ParameterDirection.Input;
                p_nombreEvaluador.Value = Nombreevaluador;
                p_cargo.Direction = ParameterDirection.Input;
                p_cargo.Value = Cargo;
                p_idperiodo.Direction = ParameterDirection.Input;
                p_idperiodo.Value = Idperiodo;

                objCommand.Parameters.Add(p_rut);
                objCommand.Parameters.Add(p_nombreEvaluador);
                objCommand.Parameters.Add(p_cargo);
                objCommand.Parameters.Add(p_idperiodo);

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
        public DataSet BuscarEvaluacionesporEvaluado()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarEvaluacionesTerminadas";

                SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                SqlParameter p_idperiodo = new SqlParameter("@idperiodo", SqlDbType.Int);

                p_rut.Direction = ParameterDirection.Input;
                p_rut.Value = Rut;
                p_idperiodo.Direction = ParameterDirection.Input;
                p_idperiodo.Value = Idperiodo;

                objCommand.Parameters.Add(p_rut);
                objCommand.Parameters.Add(p_idperiodo);

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
        public DataSet NotasPorPersona()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spNotasPorPersona";

                SqlParameter p_idAsignacion = new SqlParameter("@idAsignacion", SqlDbType.Int);

                p_idAsignacion.Direction = ParameterDirection.Input;
                p_idAsignacion.Value = Idasignacion;

                objCommand.Parameters.Add(p_idAsignacion);

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
        public DataSet ObtenerDatosEvaluacion()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerDatosEvaluacion";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                SqlParameter p_valueasignacion = new SqlParameter("@valueasignacion", SqlDbType.Int);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_rut.Direction = ParameterDirection.Input;
                p_rut.Value = Rut;
                p_valueasignacion.Direction = ParameterDirection.Input;
                p_valueasignacion.Value = Idasignacion;

                objCommand.Parameters.Add(p_tipoconsulta);
                objCommand.Parameters.Add(p_rut);
                objCommand.Parameters.Add(p_valueasignacion);

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
        public DataSet ObtenerDatosFormulario()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerEvaluacion";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_rut.Direction = ParameterDirection.Input;
                p_rut.Value = Rut;

                objCommand.Parameters.Add(p_tipoconsulta);
                objCommand.Parameters.Add(p_rut);

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
        public bool ActualizarNota()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spActualizarNota";

                    SqlParameter p_valuecompetencia = new SqlParameter("@valuecompetencia", SqlDbType.Int);
                    SqlParameter p_valuenota = new SqlParameter("@valuenota", SqlDbType.Int);
                    SqlParameter p_valueasignacion = new SqlParameter("@valueasignacion", SqlDbType.Int);
                    SqlParameter p_observacion = new SqlParameter("@observacion", SqlDbType.VarChar);

                    p_valuecompetencia.Direction = ParameterDirection.Input;
                    p_valuecompetencia.Value = Idcompetencia;
                    p_valuenota.Direction = ParameterDirection.Input;
                    p_valuenota.Value = Idnota;
                    p_valueasignacion.Direction = ParameterDirection.Input;
                    p_valueasignacion.Value = Idasignacion;
                    p_observacion.Direction = ParameterDirection.Input;
                    p_observacion.Value = Observacion;

                    objCommand.Parameters.Add(p_valuecompetencia);
                    objCommand.Parameters.Add(p_valuenota);
                    objCommand.Parameters.Add(p_valueasignacion);
                    objCommand.Parameters.Add(p_observacion);

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
        public bool ActualizarFeedback()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spActualizarFeedback";

                    SqlParameter p_valueasignacion = new SqlParameter("@valueasignacion", SqlDbType.Int);
                    SqlParameter p_deacuerdo = new SqlParameter("@deacuerdo", SqlDbType.VarChar);

                    p_valueasignacion.Direction = ParameterDirection.Input;
                    p_valueasignacion.Value = Idasignacion;
                    p_deacuerdo.Direction = ParameterDirection.Input;
                    p_deacuerdo.Value = Deacuerdo;

                    objCommand.Parameters.Add(p_valueasignacion);
                    objCommand.Parameters.Add(p_deacuerdo);

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