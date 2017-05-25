using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto.Capas.DA
{
    public class da_facturas
    {
        SqlConnection objConn = new SqlConnection();

        private int idcapacitacion;
        public int Idcapacitacion
        {
            get { return idcapacitacion; }
            set { idcapacitacion = value; }
        }

        private int numerofactura;
        public int Numerofactura
        {
            get { return numerofactura; }
            set { numerofactura = value; }
        }

        private string vbcb;
        public string Vbcb
        {
            get { return vbcb; }
            set { vbcb = value; }
        }

        private string vbcc;
        public string Vbcc
        {
            get { return vbcc; }
            set { vbcc = value; }
        }

        private string mes;
        public string Mes
        {
            get { return mes; }
            set { mes = value; }
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
        public DataSet FacturasPorCapacitacion()
        {
            SqlCommand objCommand = new SqlCommand();
            DataSet objData = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spFacturaPorCapacitacion";

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

        public DataTable IngresarFactura()
        {
            SqlCommand objCommand = new SqlCommand();
            DataTable objData = new DataTable();
            SqlDataAdapter objAdapter = new SqlDataAdapter();

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spIngresaFactura";

                SqlParameter p_id = new SqlParameter("@intIDProCap", SqlDbType.Int);
                SqlParameter p_numeroFactura = new SqlParameter("@intNumeroFactura", SqlDbType.Int);
                SqlParameter p_vbcb = new SqlParameter("@vchVBCB", SqlDbType.VarChar);
                SqlParameter p_vbcc = new SqlParameter("@vchVBCC", SqlDbType.VarChar);
                SqlParameter p_mes = new SqlParameter("@vchMes", SqlDbType.VarChar);

                p_id.Value = Idcapacitacion;
                p_numeroFactura.Direction = ParameterDirection.Input;
                p_numeroFactura.Value = Numerofactura;
                p_vbcb.Direction = ParameterDirection.Input;
                p_vbcb.Value = Vbcb;
                p_vbcc.Direction = ParameterDirection.Input;
                p_vbcc.Value = Vbcc;
                p_mes.Direction = ParameterDirection.Input;
                p_mes.Value = Mes;

                objCommand.Parameters.Add(p_id);
                objCommand.Parameters.Add(p_numeroFactura);
                objCommand.Parameters.Add(p_vbcb);
                objCommand.Parameters.Add(p_vbcc);
                objCommand.Parameters.Add(p_mes);

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

        public bool EliminarFactura()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEliminarFactura";

                SqlParameter p_numeroFactura = new SqlParameter("@intNumeroFactura", SqlDbType.Int);


                p_numeroFactura.Direction = ParameterDirection.Input;
                p_numeroFactura.Value = Numerofactura;

                objCommand.Parameters.Add(p_numeroFactura);

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

        public bool EditarFactura()
        {
            bool bReturn = false;
            int iReturn = 0;

            using (SqlCommand objCommand = new SqlCommand())
            {

            try
            {
                objCommand.Connection = objConn;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "spEditarFactura";

                SqlParameter p_id = new SqlParameter("@intIDCapacitacion", SqlDbType.Int);
                SqlParameter p_numeroFactura = new SqlParameter("@intNumeroFactura", SqlDbType.Int);
                SqlParameter p_vbcb = new SqlParameter("@vchVBCB", SqlDbType.VarChar);
                SqlParameter p_vbcc = new SqlParameter("@vchVBCC", SqlDbType.VarChar);
                SqlParameter p_mes = new SqlParameter("@vchMes", SqlDbType.VarChar);

                p_id.Value = Idcapacitacion;
                p_numeroFactura.Direction = ParameterDirection.Input;
                p_numeroFactura.Value = Numerofactura;
                p_vbcb.Direction = ParameterDirection.Input;
                p_vbcb.Value = Vbcb;
                p_vbcc.Direction = ParameterDirection.Input;
                p_vbcc.Value = Vbcc;
                p_mes.Direction = ParameterDirection.Input;
                p_mes.Value = Mes;

                objCommand.Parameters.Add(p_id);
                objCommand.Parameters.Add(p_numeroFactura);
                objCommand.Parameters.Add(p_vbcb);
                objCommand.Parameters.Add(p_vbcc);
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