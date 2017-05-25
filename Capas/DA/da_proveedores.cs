using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_proveedores
    {
        SqlConnection objConn = new SqlConnection();

        private string nombreproveedor;
        public string Nombreproveedor
        {
            get { return nombreproveedor; }
            set { nombreproveedor = value; }
        }

        private int idcapacitacion;
        public int Idcapacitacion
        {
            get { return idcapacitacion; }
            set { idcapacitacion = value; }
        }

        private int idproveedor;
        public int Idproveedor
        {
            get { return idproveedor; }
            set { idproveedor = value; }
        }

        private string tipoconsulta;
        public string Tipoconsulta
        {
            get { return tipoconsulta; }
            set { tipoconsulta = value; }
        }

        private string descripcionproveedor;
        public string Descripcionproveedor
        {
            get { return descripcionproveedor; }
            set { descripcionproveedor = value; }
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
        public bool IngresarProveedor()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spIngresarProveedor";

                SqlParameter p_nombreproveedor = new SqlParameter("@nombreproveedor", SqlDbType.VarChar);
                SqlParameter p_descripcionproveedor = new SqlParameter("@descripcionproveedor", SqlDbType.VarChar);

                p_nombreproveedor.Direction = ParameterDirection.Input;
                p_nombreproveedor.Value = Nombreproveedor;
                p_descripcionproveedor.Direction = ParameterDirection.Input;
                p_descripcionproveedor.Value = Descripcionproveedor;

                objCommand.Parameters.Add(p_nombreproveedor);
                objCommand.Parameters.Add(p_descripcionproveedor);

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
        public bool EditarProveedor()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEditarProveedor";

                SqlParameter p_nombreproveedor = new SqlParameter("@nombreproveedor", SqlDbType.VarChar);
                SqlParameter p_descripcionproveedor = new SqlParameter("@descripcionproveedor", SqlDbType.VarChar);
                SqlParameter p_idproveedor = new SqlParameter("@id", SqlDbType.Int);

                p_nombreproveedor.Direction = ParameterDirection.Input;
                p_nombreproveedor.Value = Nombreproveedor;
                p_descripcionproveedor.Direction = ParameterDirection.Input;
                p_descripcionproveedor.Value = Descripcionproveedor;
                p_idproveedor.Direction = ParameterDirection.Input;
                p_idproveedor.Value = Idproveedor;

                objCommand.Parameters.Add(p_nombreproveedor);
                objCommand.Parameters.Add(p_descripcionproveedor);
                objCommand.Parameters.Add(p_idproveedor);

                
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

        ///
        public bool EliminarProveedor()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarProveedor";

                    SqlParameter p_idproveedor = new SqlParameter("@id", SqlDbType.Int);

                    p_idproveedor.Direction = ParameterDirection.Input;
                    p_idproveedor.Value = Idproveedor;

                    objCommand.Parameters.Add(p_idproveedor);

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
        public DataSet ObtenerProveedor()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerProveedor";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_valueproveedor = new SqlParameter("@valueproveedor", SqlDbType.Int);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_valueproveedor.Direction = ParameterDirection.Input;
                p_valueproveedor.Value = Idproveedor;

                objCommand.Parameters.Add(p_tipoconsulta);
                objCommand.Parameters.Add(p_valueproveedor);

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
                    objCommand.CommandText = "spIngresarAsignacionProveedor";

                    SqlParameter p_valueproveedor = new SqlParameter("@valueproveedor", SqlDbType.Int);
                    SqlParameter p_valuecapacitacion = new SqlParameter("@valuecapacitacion", SqlDbType.Int);

                    p_valueproveedor.Direction = ParameterDirection.Input;
                    p_valueproveedor.Value = Idproveedor;
                    p_valuecapacitacion.Direction = ParameterDirection.Input;
                    p_valuecapacitacion.Value = Idcapacitacion;

                    objCommand.Parameters.Add(p_valueproveedor);
                    objCommand.Parameters.Add(p_valuecapacitacion);

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
                    objCommand.CommandText = "spEliminarAsignacioCapacitacionProveedor";

                    SqlParameter p_idproveedor = new SqlParameter("@idproveedor", SqlDbType.Int);
                    SqlParameter p_valuecapacitacion = new SqlParameter("@idcapacitacion", SqlDbType.Int);

                    p_idproveedor.Direction = ParameterDirection.Input;
                    p_idproveedor.Value = Idproveedor;
                    p_valuecapacitacion.Direction = ParameterDirection.Input;
                    p_valuecapacitacion.Value = Idcapacitacion;

                    objCommand.Parameters.Add(p_idproveedor);
                    objCommand.Parameters.Add(p_valuecapacitacion);

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
        public DataSet BuscarProveedor()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarProveedor";

                SqlParameter p_proveedor = new SqlParameter("@proveedor", SqlDbType.VarChar);

                p_proveedor.Direction = ParameterDirection.Input;
                p_proveedor.Value = Nombreproveedor;

                objCommand.Parameters.Add(p_proveedor);

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