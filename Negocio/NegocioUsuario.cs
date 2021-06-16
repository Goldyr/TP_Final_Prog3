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

            dao.GetUsuario(user);

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
