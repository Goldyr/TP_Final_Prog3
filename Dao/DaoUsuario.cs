using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Dao
{
    public class DaoUsuario
    {

        AccesoDatos ad = new AccesoDatos();

        public DaoUsuario() {; }

        public Usuario GetUsuario(Usuario user, string consulta)
        {

            DataTable dt = ad.ObtenerTabla("Usuarios", consulta);

            user.SetId(dt.Rows[0][0].ToString());
            user.SetUser(dt.Rows[0][1].ToString());
            user.SetNombres(dt.Rows[0][2].ToString());
            user.SetApellidos(dt.Rows[0][3].ToString());
            user.SetEmail(dt.Rows[0][4].ToString());
            user.SetPassword(dt.Rows[0][5].ToString());
            user.SetTelefono(dt.Rows[0][6].ToString());
            user.SetFechaNacimiento(dt.Rows[0][7].ToString());
            user.SetAdmin(Boolean.Parse(dt.Rows[0][8].ToString()));
            user.SetEstado(Boolean.Parse(dt.Rows[0][9].ToString()));
            ///= Boolean.Parse(dt.Rows[0][9].ToString());

            return user;
        }

        public bool ExisteUsuario(Usuario user, string consulta)
        {
            return ad.existe(consulta);
        }

        public bool AgregarUsuario(Usuario user)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarUsuario(ref comando, user);
            int filas = ad.EjecutarProcedimientoAlmacenado(comando, "spAgregar_Usuarios");

            if (filas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void ArmarParametrosAgregarUsuario(ref SqlCommand Comando, Usuario user)
        {
            SqlParameter SqlParametros = new SqlParameter();
            //NOMBRE USER
            SqlParametros = Comando.Parameters.Add("@User", SqlDbType.VarChar, 20);
            SqlParametros.Value = user.GetUser();

            //NOMBRES
            SqlParametros = Comando.Parameters.Add("@Nombres", SqlDbType.VarChar, 40);
            SqlParametros.Value = user.GetNombres();

            //APELLIDOS
            SqlParametros = Comando.Parameters.Add("@Apellidos", SqlDbType.VarChar, 40);
            SqlParametros.Value = user.GetApellidos();

            //MAIL
            SqlParametros = Comando.Parameters.Add("@Mail", SqlDbType.VarChar, 30);
            SqlParametros.Value = user.GetEmail();

            //PASSWORD
            SqlParametros = Comando.Parameters.Add("@Password", SqlDbType.VarChar, 30);
            SqlParametros.Value = user.GetPassword();

            //TELEFONO
            SqlParametros = Comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 30);
            SqlParametros.Value = user.GetTelefono();

            //FECHA
            SqlParametros = Comando.Parameters.Add("@Fecha", SqlDbType.Date);
            SqlParametros.Value = user.GetFechaNacimiento();
        }

    }

}
