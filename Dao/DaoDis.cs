using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Dao
{
    public class DaoDis
    {
        AccesoDatos datos = new AccesoDatos();
        public bool ExisteDis(string Consulta)
        {
            return datos.existe(Consulta);
        }
        public bool AgregarDis(Distribuidora _dis)
        {
            SqlCommand ComandoDis = new SqlCommand();
            ArmarParametrosAgregarDis(ref ComandoDis, _dis);
            int filasDis = datos.EjecutarProcedimientoAlmacenado(ComandoDis, "spAgregar_Distribuidoras");
            if (filasDis == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //SE ARMA PARA AGREGAR DIS
        private void ArmarParametrosAgregarDis(ref SqlCommand Comando, Distribuidora _dis)
        {
            SqlParameter SqlParametros = new SqlParameter();
            // sp_AgregarDistribuidora
            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 20);
            SqlParametros.Value = _dis.GetNombre();
        }
    }
}
