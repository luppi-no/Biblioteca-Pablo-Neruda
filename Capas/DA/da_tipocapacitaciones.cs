using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_tipocapacitaciones
    {
        SqlConnection objConn = new SqlConnection();

        private string nombretipocapacitacion;
        public string Nombretipocapacitacion
        {
            get { return nombretipocapacitacion; }
            set { nombretipocapacitacion = value; }
        }

        private string descripciontipocapacitacion;
        public string Descripciontipocapacitacion
        {
            get { return descripciontipocapacitacion; }
            set { descripciontipocapacitacion = value; }
        }

        private int idtipocapacitacion;
        public int Idtipocapacitacion
        {
            get { return idtipocapacitacion; }
            set { idtipocapacitacion = value; }
        }

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

        public bool IngresarTipoCapacitacion()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spIngresarTipoCapacitacion";

                SqlParameter p_nombretipocapacitacion = new SqlParameter("@nombretipocapacitacion", SqlDbType.VarChar);
                SqlParameter p_descripciontipocapacitacion = new SqlParameter("@descripciontipocapacitacion", SqlDbType.VarChar);

                p_nombretipocapacitacion.Direction = ParameterDirection.Input;
                p_nombretipocapacitacion.Value = Nombretipocapacitacion;
                p_descripciontipocapacitacion.Direction = ParameterDirection.Input;
                p_descripciontipocapacitacion.Value = Descripciontipocapacitacion;

                objCommand.Parameters.Add(p_nombretipocapacitacion);
                objCommand.Parameters.Add(p_descripciontipocapacitacion);
                
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

        public DataSet ObtenerTipoCapacitaciones()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerTipoCapacitaciones";

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


        public bool EliminarTipoCapacitacion()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEliminarTipoCaoacitacion";

                SqlParameter p_valuetipocapacitacion = new SqlParameter("@valuetipocapacitacion", SqlDbType.Int);

                p_valuetipocapacitacion.Direction = ParameterDirection.Input;
                p_valuetipocapacitacion.Value = Idtipocapacitacion;

                objCommand.Parameters.Add(p_valuetipocapacitacion);

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


        public bool EditarTipoCapacitacion()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEditarTipoCapacitacion";

                SqlParameter p_valuetipocapacitacion = new SqlParameter("@valuetipocapacitacion", SqlDbType.Int);
                SqlParameter p_nombretipocapacitacion = new SqlParameter("@nombretipocapacitacion", SqlDbType.VarChar);
                SqlParameter p_descripciontipocapacitacion = new SqlParameter("@descripciontipocapacitacion", SqlDbType.VarChar);

                p_valuetipocapacitacion.Direction = ParameterDirection.Input;
                p_valuetipocapacitacion.Value = Idtipocapacitacion;
                p_nombretipocapacitacion.Direction = ParameterDirection.Input;
                p_nombretipocapacitacion.Value = Nombretipocapacitacion;
                p_descripciontipocapacitacion.Direction = ParameterDirection.Input;
                p_descripciontipocapacitacion.Value = Descripciontipocapacitacion;

                objCommand.Parameters.Add(p_valuetipocapacitacion);
                objCommand.Parameters.Add(p_nombretipocapacitacion);
                objCommand.Parameters.Add(p_descripciontipocapacitacion);

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


        public DataSet BuscarTipoCapacitacion()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarTipoCapacitacion";

                SqlParameter p_tipocapacitacion = new SqlParameter("@tipocapacitacion", SqlDbType.VarChar);

                p_tipocapacitacion.Direction = ParameterDirection.Input;
                p_tipocapacitacion.Value = Nombretipocapacitacion;

                objCommand.Parameters.Add(p_tipocapacitacion);

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