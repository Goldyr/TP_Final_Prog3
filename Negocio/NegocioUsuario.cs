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

            if (!dao.ExisteUsuario(user, consulta)) {
                    return false;
            } 
            else if(!dao.ExisteContraseña(user))
            {
                return false;
            }

            dao.GetUsuario(user, consulta);

            return true;
        }

        public bool CargarUsuarioPorID(Usuario user)
        {

            string consulta = $"SELECT * FROM Usuarios WHERE ID_U = '{user.GetId()}'" +
              $"AND Estado_U = 1";

            dao.GetUsuario(user, consulta);

            return true;
        }

        public bool NU_AgregarUsuario(Usuario user)
        {
            string consulta = $"SELECT * from Usuarios WHERE User_U = '{user.GetUser()}'";

            if (!dao.ExisteUsuario(user, consulta))
            {
                dao.AgregarUsuario(user);
                return true;
            }

            return false;


        }

        public bool NU_ModificarUsuario(Usuario user, string user_Viejo)
        {
            Usuario user2 = new Usuario();
            user2.SetEmail(user.GetEmail());
            string consulta1 = $"SELECT * from Usuarios WHERE Email_U = '{user2.GetEmail()}'";

            user2=dao.GetUsuario(user2, consulta1);

            user2.SetNombres(user.GetNombres());
            user2.SetApellidos(user.GetApellidos());
            user2.SetUser(user.GetUser());
            user2.SetTelefono(user.GetTelefono());

            if(user.GetUser()== user_Viejo)
            {
                dao.ModificarUsuario(user2);
                return true;
            }
            else {
                string consulta = $"SELECT * from Usuarios WHERE User_U = '{user.GetUser()}'";

                if (!dao.ExisteUsuario(user2, consulta))
                {
                    dao.ModificarUsuario(user2);
                    return true;
                }

                return false;
            }
            }
    }
}
