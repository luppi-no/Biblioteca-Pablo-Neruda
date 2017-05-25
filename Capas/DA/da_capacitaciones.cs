using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_capacitaciones
    {
        SqlConnection objConn = new SqlConnection();

        private string area;
        public string Area
        {
            get { return area; }
            set { area = value; }
        }

        private string centrocosto;
        public string Centrocosto
        {
            get { return centrocosto; }
            set { centrocosto = value; }
        }

        private int idcapacitacion;
        public int Idcapacitacion
        {
            get { return idcapacitacion; }
            set { idcapacitacion = value; }
        }

        private string nombrecapacitacion;
        public string Nombrecapacitacion
        {
            get { return nombrecapacitacion; }
            set { nombrecapacitacion = value; }
        }

        private string proveedor;
        public string Proveedor
        {
            get { return proveedor; }
            set { proveedor = value; }
        }

        private int idproveedor;
        public int Idproveedor
        {
            get { return idproveedor; }
            set { idproveedor = value; }
        }

        private string anno;
        public string Anno
        {
            get { return anno; }
            set { anno = value; }
        }

        private string rut;
        public string Rut
        {
            get { return rut; }
            set { rut = value; }
        }

        private string tipoconsulta;
        public string Tipoconsulta
        {
            get { return tipoconsulta; }
            set { tipoconsulta = value; }
        }

        private int idperiodo;
        public int Idperiodo
        {
            get { return idperiodo; }
            set { idperiodo = value; }
        }

        private int cupos;
        public int Cupos
        {
            get { return cupos; }
            set { cupos = value; }
        }

        private int numerodehoras;
        public int Numerodehoras
        {
            get { return numerodehoras; }
            set { numerodehoras = value; }
        }

        private string fechadesde;
        public string Fechadesde
        {
            get { return fechadesde; }
            set { fechadesde = value; }
        }

        private string fechahasta;
        public string Fechahasta
        {
            get { return fechahasta; }
            set { fechahasta = value; }
        }

        private int idtipocapacitacion;
        public int Idtipocapacitacion
        {
            get { return idtipocapacitacion; }
            set { idtipocapacitacion = value; }
        }

        private string programada;
        public string Programada
        {
            get { return programada; }
            set { programada = value; }
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
        public DataSet BuscarCapacitaciones()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spListaCapacitaciones";

                SqlParameter p_area = new SqlParameter("@area", SqlDbType.VarChar);
                SqlParameter p_centroCosto = new SqlParameter("@centrocosto", SqlDbType.VarChar);
                SqlParameter p_capacitacion = new SqlParameter("@capacitacion", SqlDbType.VarChar);
                SqlParameter p_proveedor = new SqlParameter("@proveedor", SqlDbType.VarChar);
                SqlParameter p_anno = new SqlParameter("@anno", SqlDbType.VarChar);

                p_area.Direction = ParameterDirection.Input;
                p_area.Value = Area;
                p_centroCosto.Direction = ParameterDirection.Input;
                p_centroCosto.Value = Centrocosto;
                p_capacitacion.Direction = ParameterDirection.Input;
                p_capacitacion.Value = Nombrecapacitacion;
                p_proveedor.Direction = ParameterDirection.Input;
                p_proveedor.Value = Proveedor;
                p_anno.Direction = ParameterDirection.Input;
                p_anno.Value = Anno;

                objCommand.Parameters.Add(p_capacitacion);
                objCommand.Parameters.Add(p_centroCosto);
                objCommand.Parameters.Add(p_area);
                objCommand.Parameters.Add(p_proveedor);
                objCommand.Parameters.Add(p_anno);

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
        public DataSet AnnoCapacitaciones()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spListaCapacitacionesAnno";

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
        public DataSet DetalleCapacitaciones()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spDetalleCapacitacion";

                SqlParameter p_id = new SqlParameter("@idCapacitacion", SqlDbType.Int);

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
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool QuitarUsuario()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spQuitarUsuario";

                    SqlParameter p_id = new SqlParameter("@idCapacitacion", SqlDbType.Int);
                    SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);

                    p_id.Direction = ParameterDirection.Input;
                    p_id.Value = Idcapacitacion;
                    p_rut.Direction = ParameterDirection.Input;
                    p_rut.Value = Rut;

                    objCommand.Parameters.Add(p_rut);
                    objCommand.Parameters.Add(p_id);

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
        public DataSet ObtenerCapacitaciones()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerCapacitaciones";

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
        public DataSet ObtenerCapacitacionPorPeriodo()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spObtenerCapacitacionesPorPeriodo";

                SqlParameter p_tipoconsulta = new SqlParameter("@tipoconsulta", SqlDbType.VarChar);
                SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                SqlParameter p_idperiodo = new SqlParameter("@idperiodo", SqlDbType.Int);

                p_tipoconsulta.Direction = ParameterDirection.Input;
                p_tipoconsulta.Value = Tipoconsulta;
                p_rut.Direction = ParameterDirection.Input;
                p_rut.Value = Rut;
                p_idperiodo.Direction = ParameterDirection.Input;
                p_idperiodo.Value = Idperiodo;

                objCommand.Parameters.Add(p_tipoconsulta);
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
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool IngresarCapacitacion()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spIngresarCapacitacion";

                    SqlParameter p_nombrecapacitacion = new SqlParameter("@nombrecapacitacion", SqlDbType.VarChar);
                    SqlParameter p_cupos = new SqlParameter("@cupos", SqlDbType.Int);
                    SqlParameter p_numerohoras = new SqlParameter("@numerohoras", SqlDbType.Int);
                    SqlParameter p_fechahasta = new SqlParameter("@fechaHasta", SqlDbType.VarChar);
                    SqlParameter p_fechadesde = new SqlParameter("@fechaDesde", SqlDbType.VarChar);
                    SqlParameter p_tipocapacitacion = new SqlParameter("@tipocapacitacion", SqlDbType.Int);

                    p_nombrecapacitacion.Direction = ParameterDirection.Input;
                    p_nombrecapacitacion.Value = Nombrecapacitacion;
                    p_cupos.Direction = ParameterDirection.Input;
                    p_cupos.Value = Cupos;
                    p_numerohoras.Direction = ParameterDirection.Input;
                    p_numerohoras.Value = Numerodehoras;
                    p_fechahasta.Direction = ParameterDirection.Input;
                    p_fechahasta.Value = Fechahasta;
                    p_fechadesde.Direction = ParameterDirection.Input;
                    p_fechadesde.Value = Fechadesde;
                    p_tipocapacitacion.Direction = ParameterDirection.Input;
                    p_tipocapacitacion.Value = Idtipocapacitacion;

                    objCommand.Parameters.Add(p_nombrecapacitacion);
                    objCommand.Parameters.Add(p_cupos);
                    objCommand.Parameters.Add(p_numerohoras);
                    objCommand.Parameters.Add(p_fechahasta);
                    objCommand.Parameters.Add(p_fechadesde);
                    objCommand.Parameters.Add(p_tipocapacitacion);

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
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EliminarCapacitacion()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEliminarCapacitacion";

                    SqlParameter p_valuecapacitacion = new SqlParameter("@valuecapacitacion", SqlDbType.Int);

                    p_valuecapacitacion.Direction = ParameterDirection.Input;
                    p_valuecapacitacion.Value = Idcapacitacion;

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
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool EditarCapacitacion()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spEditarCapacitacion";

                    SqlParameter p_valuecapacitacion = new SqlParameter("@valuecapacitacion", SqlDbType.Int);
                    SqlParameter p_nombrecapacitacion = new SqlParameter("@nombrecapacitacion", SqlDbType.VarChar);
                    SqlParameter p_programada = new SqlParameter("@programada", SqlDbType.VarChar);
                    SqlParameter p_cupos = new SqlParameter("@cupos", SqlDbType.Int);
                    SqlParameter p_numerohoras = new SqlParameter("@numerohoras", SqlDbType.Int);
                    SqlParameter p_fechahasta = new SqlParameter("@fechaHasta", SqlDbType.VarChar);
                    SqlParameter p_fechadesde = new SqlParameter("@fechaDesde", SqlDbType.VarChar);
                    SqlParameter p_return = new SqlParameter("@returnvalue", SqlDbType.Int);

                    p_valuecapacitacion.Direction = ParameterDirection.Input;
                    p_valuecapacitacion.Value = Idcapacitacion;
                    p_nombrecapacitacion.Direction = ParameterDirection.Input;
                    p_nombrecapacitacion.Value = Nombrecapacitacion;
                    p_programada.Direction = ParameterDirection.Input;
                    p_programada.Value = Programada;
                    p_cupos.Direction = ParameterDirection.Input;
                    p_cupos.Value = Cupos;
                    p_numerohoras.Direction = ParameterDirection.Input;
                    p_numerohoras.Value = Numerodehoras;
                    p_fechahasta.Direction = ParameterDirection.Input;
                    p_fechahasta.Value = Fechahasta;
                    p_fechadesde.Direction = ParameterDirection.Input;
                    p_fechadesde.Value = Fechadesde;
                    p_return.Direction = ParameterDirection.ReturnValue;

                    objCommand.Parameters.Add(p_valuecapacitacion);
                    objCommand.Parameters.Add(p_nombrecapacitacion);
                    objCommand.Parameters.Add(p_programada);
                    objCommand.Parameters.Add(p_cupos);
                    objCommand.Parameters.Add(p_numerohoras);
                    objCommand.Parameters.Add(p_fechahasta);
                    objCommand.Parameters.Add(p_fechadesde);
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
        public DataSet BuscarCapacitacion()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spBuscarCapacitacion";

                SqlParameter p_capacitacion = new SqlParameter("@capacitacion", SqlDbType.VarChar);

                p_capacitacion.Direction = ParameterDirection.Input;
                p_capacitacion.Value = Nombrecapacitacion;

                objCommand.Parameters.Add(p_capacitacion);

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
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool AsignarCapacitacionNoProgramada()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spAsignarCapacitacionNoProgramada";

                    SqlParameter p_nombrecapacitacion = new SqlParameter("@nombrecapacitacion", SqlDbType.VarChar);
                    SqlParameter p_cupos = new SqlParameter("@cupos", SqlDbType.Int);
                    SqlParameter p_numerohoras = new SqlParameter("@numerohoras", SqlDbType.Int);
                    SqlParameter p_fechahasta = new SqlParameter("@fechaHasta", SqlDbType.VarChar);
                    SqlParameter p_fechadesde = new SqlParameter("@fechaDesde", SqlDbType.VarChar);
                    SqlParameter p_tipocapacitacion = new SqlParameter("@tipocapacitacion", SqlDbType.Int);
                    SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                    SqlParameter p_proveedor = new SqlParameter("@proveedor", SqlDbType.Int);
                    SqlParameter p_idperiodo = new SqlParameter("@idperiodo", SqlDbType.Int);

                    p_nombrecapacitacion.Direction = ParameterDirection.Input;
                    p_nombrecapacitacion.Value = Nombrecapacitacion;
                    p_cupos.Direction = ParameterDirection.Input;
                    p_cupos.Value = Cupos;
                    p_numerohoras.Direction = ParameterDirection.Input;
                    p_numerohoras.Value = Numerodehoras;
                    p_fechahasta.Direction = ParameterDirection.Input;
                    p_fechahasta.Value = Fechahasta;
                    p_fechadesde.Direction = ParameterDirection.Input;
                    p_fechadesde.Value = Fechadesde;
                    p_tipocapacitacion.Direction = ParameterDirection.Input;
                    p_tipocapacitacion.Value = Idtipocapacitacion;
                    p_rut.Direction = ParameterDirection.Input;
                    p_rut.Value = Rut;
                    p_proveedor.Direction = ParameterDirection.Input;
                    p_proveedor.Value = Idproveedor;
                    p_idperiodo.Direction = ParameterDirection.Input;
                    p_idperiodo.Value = Idperiodo;

                    objCommand.Parameters.Add(p_proveedor);
                    objCommand.Parameters.Add(p_nombrecapacitacion);
                    objCommand.Parameters.Add(p_cupos);
                    objCommand.Parameters.Add(p_numerohoras);
                    objCommand.Parameters.Add(p_fechahasta);
                    objCommand.Parameters.Add(p_fechadesde);
                    objCommand.Parameters.Add(p_tipocapacitacion);
                    objCommand.Parameters.Add(p_rut);
                    objCommand.Parameters.Add(p_idperiodo);

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
        /// <returns>Retorna "TRUE" si la ejecución es correcta, "FALSE" si es incorrecta</returns>
        public bool AsignarCapacitacion()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {
                try
                {
                    objCommand.Connection = objConn;
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "spAsignarCapacitacion";

                    SqlParameter p_idCapacitacion = new SqlParameter("@idCapacitacion", SqlDbType.VarChar);
                    SqlParameter p_rut = new SqlParameter("@rut", SqlDbType.VarChar);
                    SqlParameter p_idProveedor = new SqlParameter("@idProveedor", SqlDbType.Int);
                    SqlParameter p_idperiodo = new SqlParameter("@idperiodo", SqlDbType.Int);

                    p_rut.Direction = ParameterDirection.Input;
                    p_rut.Value = Rut;
                    p_idCapacitacion.Direction = ParameterDirection.Input;
                    p_idCapacitacion.Value = Idcapacitacion;
                    p_idProveedor.Direction = ParameterDirection.Input;
                    p_idProveedor.Value = Idproveedor;
                    p_idperiodo.Direction = ParameterDirection.Input;
                    p_idperiodo.Value = Idperiodo;

                    objCommand.Parameters.Add(p_idCapacitacion);
                    objCommand.Parameters.Add(p_rut);
                    objCommand.Parameters.Add(p_idProveedor);
                    objCommand.Parameters.Add(p_idperiodo);

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
        public DataTable CapacitacionbyId()
        {
            SqlCommand objCommand = new SqlCommand();
            DataTable objData = new DataTable();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spCapacitacionbyId";

                SqlParameter p_idCapacitacion = new SqlParameter("@idCapacitacion", SqlDbType.VarChar);

                p_idCapacitacion.Direction = ParameterDirection.Input;
                p_idCapacitacion.Value = Idcapacitacion;

                objCommand.Parameters.Add(p_idCapacitacion);

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