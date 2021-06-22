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
    public class DaoDes
    {
        AccesoDatos datos = new AccesoDatos();
        public bool ExisteDes(string Consulta)
        {
            return datos.existe(Consulta);
        }
        public bool AgregarDes(Desarrolladora _des)
        {

            SqlCommand ComandoDes = new SqlCommand();
            ArmarParametrosAgregarDes(ref ComandoDes, _des);
            int filasDes = datos.EjecutarProcedimientoAlmacenado(ComandoDes, "spAgregar_Desarrolladores");
            if (filasDes == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void ArmarParametrosAgregarDes(ref SqlCommand Comando, Desarrolladora _des)
        {
            SqlParameter SqlParametros = new SqlParameter();
            // sp_AgregarDesarrolladora
            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 20);
            SqlParametros.Value = _des.GetNombre();
        }
    }
}
