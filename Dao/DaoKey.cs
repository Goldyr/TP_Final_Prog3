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
    public class DaoKey
    {
        AccesoDatos datos = new AccesoDatos();

        public Key GetKey(Key _key)
        {
            string consulta = $"Select CodigoJuego_K, Serie_K, Estado_K where Serie_K = '{_key.GetSerial()}'";
            DataTable tabla = datos.ObtenerTabla("Key", consulta);
            _key.SetCodJuego(tabla.Rows[0][0].ToString());
            _key.SetSerial(tabla.Rows[0][1].ToString());
            _key.SetEstado(Convert.ToBoolean(tabla.Rows[0][2].ToString()));
             return _key;  
        }
       
        private void ArmarparametrosAgregarKey(ref SqlCommand Comando,  Key _key )
        {
            SqlParameter sqlparametros = new SqlParameter();
            sqlparametros = Comando.Parameters.Add("@CodJuego", SqlDbType.Char);
            sqlparametros.Value = _key.GetCodJuego();
            sqlparametros = Comando.Parameters.Add("@Serie", SqlDbType.Char);
            sqlparametros.Value = _key.GetSerial();
        }

        public bool existekey(string consulta)
        {
            return datos.existe(consulta);
        }

        public bool AgregarKey(Key _key)
        {
            SqlCommand Comando = new SqlCommand();
            ArmarparametrosAgregarKey(ref Comando, _key);
            int filas = datos.EjecutarProcedimientoAlmacenado(Comando, "spAgregar_Keys");
            if (filas == 1) // en la version final estaria bueno que pueda añadir multiples keys de una vez
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int Obtener_CantKey(string codigo)  //esta funcion va a buscar el juego y la cantidad de keys que tiene. Solo se ejecuta si es que ingresa un codigo de juego existente en la tabla keys
        {
            string consulta = $"select count(CodigoJuego_K) as Cantidad from Keys where CodigoJuego_K = '{codigo}' and Estado_K = 1";
            DataTable t1 = datos.ObtenerTabla("Keys", consulta);

            return Convert.ToInt32(t1.Rows[0][0].ToString());

        }




    }
}
