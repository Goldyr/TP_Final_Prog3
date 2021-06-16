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

            if (!dao.ExisteUsuario(user)) return false;

            string consulta1 = $"SELECT * FROM Usuarios WHERE ID_U = '{user.Id}'" +
                                $"AND Estado_U = 1";

            string consulta2 = $"SELECT * FROM Usuarios WHERE Mail_U = '{user.Mail}'" +
                                $"AND Estado_U = 1";

            dao.GetUsuario(user, consulta2);

            return true;
       
        }

        public bool CargarUsuarioPorID(Usuario user)
        {
            DaoUsuario dao = new DaoUsuario();

            dao.GetUsuarioPorID(user);

            return true;

        }
    }
}
