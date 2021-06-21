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
        private string user;
        private string nombres;
        private string apellidos;
        private string email;
        private string password;
        private string telefono;
        private string fechaNacimiento;
        private bool admin;
        private bool estado;

        //Constructores
        public Usuario(){; }

        public string Id { get => id; set => id = value; }
        public string User { get => user; set => user = value; }
        public string Nombres { get => nombres; set => nombres = value; }
        public string Apellidos { get => apellidos; set => apellidos = value; }
        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        public bool Admin { get => admin; set => admin = value; }
        public bool Estado { get => estado; set => estado = value; }




    }
}
