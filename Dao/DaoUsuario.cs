using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Dao
{
    public class DaoUsuario
    {

        AccesoDatos ad = new AccesoDatos();

        public DaoUsuario() {;}

        public Usuario GetUsuario(Usuario user, string consulta)
        {
         
            DataTable dt = ad.ObtenerTabla("Usuarios", consulta);

            user.Id = dt.Rows[0][0].ToString();
            user.Nombre = dt.Rows[0][1].ToString();
            user.Mail = dt.Rows[0][2].ToString();
            user.Password = dt.Rows[0][3].ToString();
            user.Telefono = dt.Rows[0][4].ToString();
            user.Admin = Boolean.Parse(dt.Rows[0][5].ToString());
            user.Estado  = Boolean.Parse(dt.Rows[0][6].ToString()); 
            user.FechaNacimiento = dt.Rows[0][7].ToString();

            return user;
        }

        //Ver como mejorar esto, siento que puedo hacer un getusuario en general

        public Usuario GetUsuarioPorID(Usuario user)
        {
            string consulta = $"SELECT Nombre_U, Administrador_U, Mail_U,  FROM Usuarios WHERE ID_U = '{user.Id}'" +
                           $"AND Estado_U = 1";

            DataTable dt = ad.ObtenerTabla("Usuarios", consulta);
            user.Nombre = dt.Rows[0][0].ToString();
            user.Admin = Boolean.Parse(dt.Rows[0][1].ToString());
            user.Mail = dt.Rows[0][2].ToString();
            return user;
        }

        // Ver como puedo mejorar la pregunta si existe un usuario

        public bool ExisteUsuario(Usuario user)
        {
            string consulta = $"SELECT * FROM Usuarios WHERE Mail_U = '{user.Mail}' "+
                              $"AND Password_U = '{user.Password}' AND Estado_U = 1";

            return ad.existe(consulta);
        }

    }
}
