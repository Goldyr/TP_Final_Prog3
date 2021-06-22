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
        DaoUsuario dao = new DaoUsuario();

        public bool cargarUsuario(Usuario user)
        {


            string consulta = $"SELECT * FROM Usuarios WHERE Email_U = '{user.GetEmail()}'" +
                      $"AND Estado_U = 1";

            if (!dao.ExisteUsuario(user, consulta)) return false;

            dao.GetUsuario(user, consulta);

            return true;
        }

        public bool CargarUsuarioPorID(Usuario user)
        {
            //dao.GetUsuarioPorID(user);

            return true;
        }

        public bool NU_AgregarUsuario(Usuario user)
        {
            string consulta = $"SELECT * from Usuarios WHERE ID_U = '{user.GetId()}'";

            if (!dao.ExisteUsuario(user, consulta))
            {
                dao.AgregarUsuario(user);
                return true;
            }

            return false;


        }
    }
}
