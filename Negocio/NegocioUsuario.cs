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
                      $"AND Estado_U = 1 AND Password_U = '{user.Password}'";

            if (!dao.ExisteUsuario(user, consulta)) return false;

            dao.GetUsuario(user, consulta);
          
            return true;
       
        }

        public bool CargarUsuarioPorID(Usuario user)
        {
            DaoUsuario dao = new DaoUsuario();
        
            string consulta = $"SELECT * FROM Usuarios WHERE ID_U = '{user.Id}'" +
                       $"AND Estado_U = 1";

            

            dao.GetUsuario(user, consulta);

            return true;
        
        }
    }
}
