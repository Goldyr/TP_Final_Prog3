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
            Boolean.Parse(dt.Rows[0][9].ToString());

            return user;
        }

        public bool ExisteUsuario(Usuario user, string consulta)
        {
            return ad.existe(consulta);
        }

        public bool ExisteContraseña(Usuario user)
        {
            string consulta = $"SELECT * FROM Usuarios WHERE Email_U = '{user.GetEmail()}' AND Password_U = '{user.GetPassword()}'" +
                      $"AND Estado_U = 1";

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

        public bool ModificarUsuario(Usuario user)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosModificarUsuario(ref comando, user);
            int filas = ad.EjecutarProcedimientoAlmacenado(comando, "spModificar_Usuario");

            if (filas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        private void ArmarParametrosModificarUsuario(ref SqlCommand Comando, Usuario user)
        {
            SqlParameter SqlParametros = new SqlParameter();

            //ID
            SqlParametros = Comando.Parameters.Add("@ID", SqlDbType.Char, 10);
            SqlParametros.Value = user.GetId();

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

        /*
          create procedure spModificar_Usuario
                @ID char(10),
                @User VARCHAR(20) ,
                @Nombres VARCHAR(40),
                @Apellidos VARCHAR(40),
                @Mail VARCHAR(30),
                @Password VARCHAR(30),
                @Telefono VARCHAR(30), 
                @Fecha DATE
                as
                update Usuarios set User_U=@User, Nombres_U=@Nombres, Apellidos_U=@Apellidos, Email_U=@Mail, Password_U=@Password, Telefono_U=@Telefono, Fecha_Nac_U=@Fecha
                where ID_U=@ID
                go
          */

        public bool ModificarContraseña(Usuario user)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosModificarContraseña(ref comando, user);
            int filas = ad.EjecutarProcedimientoAlmacenado(comando, "spModificar_Contraseña");
            if (filas == 1)
            {
                return true;
            }
            return false;
        }

        private void ArmarParametrosModificarContraseña(ref SqlCommand Comando, Usuario user)
        {
            SqlParameter SqlParametros = new SqlParameter();

            //ID
            SqlParametros = Comando.Parameters.Add("@ID", SqlDbType.Char, 10);
            SqlParametros.Value = user.GetId();

            //CONTRASEÑA
            SqlParametros = Comando.Parameters.Add("@Contraseña", SqlDbType.VarChar, 30);
            SqlParametros.Value = user.GetPassword();

        }
    }

}
