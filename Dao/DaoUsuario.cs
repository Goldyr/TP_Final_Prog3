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
            user.User = dt.Rows[0][1].ToString();
            user.Nombres = dt.Rows[0][2].ToString();
            user.Apellidos = dt.Rows[0][3].ToString();
            user.Email = dt.Rows[0][4].ToString();
            user.Password = dt.Rows[0][5].ToString();
            user.Telefono = dt.Rows[0][6].ToString();
            user.FechaNacimiento = dt.Rows[0][7].ToString();
            user.Admin = Boolean.Parse(dt.Rows[0][8].ToString());
            user.Estado  = Boolean.Parse(dt.Rows[0][9].ToString()); 

            return user;
        }

        public bool ExisteUsuario(Usuario user, string consulta)
        {
            return ad.existe(consulta);
        }

    }
}
