using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioUsuario
    {
        public bool cargarUsuario(Usuario user)
        {
            DaoUsuario dao = new DaoUsuario();

            string consulta = $"SELECT * FROM Usuarios WHERE Email_U = '{user.Email}'" +
                      $"AND Estado_U = 1";

            if (!dao.ExisteUsuario(user, consulta)) return false;
 
            dao.GetUsuario(user, consulta);

            return true;
       
        }

        public bool CargarUsuarioPorID(Usuario user)
        {
            DaoUsuario dao = new DaoUsuario();

            //dao.GetUsuarioPorID(user);

            return true;

        }
    }
}
