using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        //Parametros 

        private string id;
        private string nombre;
        private string mail;
        private string password;
        private string telefono;
        private bool admin;
        private bool estado;
        private string fechaNacimiento;

        //Constructores
        public Usuario() {
            Admin = false;
            Estado = true;
            Id = null;
        }


        //Setters y getters

        public string Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Mail { get => mail; set => mail = value; }
        public string Password { get => password; set => password = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public bool Admin { get => admin; set => admin = value; }
        public bool Estado { get => estado; set => estado = value; }
        public string FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }

    }
}
