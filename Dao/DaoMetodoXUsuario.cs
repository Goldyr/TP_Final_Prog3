using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;


namespace Dao
{
    public class DaoMetodoXUsuario
    {
        AccesoDatos ad = new AccesoDatos();

        public MetodoXUsuario GetMetodoXUsuario(MetodoXUsuario _metodo)
        {
            string consulta = $"select ID_MP_MxU, ID_Usuario_MxU, Nro_Tarjeta_MxU, Email_MxU, Clave_Seguridad_MxU, Fecha_Vencimiento_MxU, DNI_MxU, Nombres_MxU, Apellidos_MxU, Estado_MxU, Telefono_MxU, CodigoPostal_MxU, Direccion_MxU  from MetodosxUsuarios where ID_MP_MxU = '{_metodo.GetIdMP()}' and ID_Usuario_MxU= '{_metodo.GetIdUsuario()}'";
            DataTable dt = ad.ObtenerTabla("Metodos", consulta);

            MetodoPago metodoPago = new MetodoPago();
            Usuario usuario = new Usuario();

            metodoPago.Id = dt.Rows[0][0].ToString();
            usuario.SetId(dt.Rows[0][1].ToString());

            _metodo.SetIdMP(metodoPago);
            _metodo.SetIdUsuario(usuario);
            _metodo.SetnroTarjeta(dt.Rows[0][2].ToString());
            _metodo.SetEmail(dt.Rows[0][3].ToString());
            _metodo.SetClave(dt.Rows[0][4].ToString());
            _metodo.SetFecha(dt.Rows[0][5].ToString());
            _metodo.SetDni(dt.Rows[0][6].ToString());
            _metodo.SetNombres(dt.Rows[0][7].ToString());
            _metodo.SetApellidos(dt.Rows[0][8].ToString());
            _metodo.SetEstado(Boolean.Parse(dt.Rows[0][9].ToString()));
            _metodo.SetTelefono(dt.Rows[0][10].ToString());
            _metodo.SetCodigoPostal(dt.Rows[0][11].ToString());
            _metodo.SetDireccion(dt.Rows[0][12].ToString());

            return _metodo;


        }

        public bool existeMetodo(string consulta)
        {
            return ad.existe(consulta);
        }

        public DataTable ListarMetodos(string consulta)
        {
            DataTable dt = new DataTable();
            dt = ad.ObtenerTabla("MetodosxUsuarios", consulta);
            return dt;
        }

        private void ArmarParametrosAgregarMetodo(ref SqlCommand Comando, MetodoXUsuario _metodo)
        {
            SqlParameter SqlParametros = new SqlParameter();
            //id MP
            SqlParametros = Comando.Parameters.Add("@id_mp", SqlDbType.Char, 10);
            SqlParametros.Value = _metodo.GetIdMP();

            //id usuario
            SqlParametros = Comando.Parameters.Add("@id_usuario", SqlDbType.Char, 10);
            SqlParametros.Value = _metodo.GetIdUsuario();

            //Nro tarjeta
            SqlParametros = Comando.Parameters.Add("@nro", SqlDbType.VarChar, 16);
            SqlParametros.Value = _metodo.GetnroTarjeta();

            //mail 
            SqlParametros = Comando.Parameters.Add("@mail", SqlDbType.VarChar, 30);
            SqlParametros.Value = _metodo.GetEmail();

            //clave de seguridad
            SqlParametros = Comando.Parameters.Add("@clave_seg", SqlDbType.VarChar, 4);
            SqlParametros.Value = _metodo.GetClave();

            //fecha de caducidad
            SqlParametros = Comando.Parameters.Add("@fecha", SqlDbType.Date);
            SqlParametros.Value = _metodo.GetFecha();

            //dni
            SqlParametros = Comando.Parameters.Add("@dni", SqlDbType.VarChar, 8);
            SqlParametros.Value = _metodo.GetDni();

            //Nombres
            SqlParametros = Comando.Parameters.Add("@nombres", SqlDbType.VarChar, 40);
            SqlParametros.Value = _metodo.GetNombres();

            //Apellidos
            SqlParametros = Comando.Parameters.Add("@apellidos", SqlDbType.VarChar, 40);
            SqlParametros.Value = _metodo.GetApellidos();

            //Direccion
            SqlParametros = Comando.Parameters.Add("@direccion", SqlDbType.VarChar, 40);
            SqlParametros.Value = _metodo.GetDireccion();

            //Direccion
            SqlParametros = Comando.Parameters.Add("@CodigoPostal", SqlDbType.VarChar, 5);
            SqlParametros.Value = _metodo.GetCodigoPostal();

            //TELEFONO
            SqlParametros = Comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 30);
            SqlParametros.Value = _metodo.GetTelefono();
        }

        public bool Agregar_metodo(MetodoXUsuario _metodo)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarMetodo(ref comando, _metodo);
            int filas = ad.EjecutarProcedimientoAlmacenado(comando, "sp_Agregar_MetodoXUsuario");
            if (filas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
