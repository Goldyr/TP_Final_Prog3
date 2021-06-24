﻿using System;
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
    }
}
