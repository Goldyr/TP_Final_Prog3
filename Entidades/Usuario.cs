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

        private string Id;
        private string User;
        private string Nombres;
        private string Apellidos;
        private string Email;
        private string Password;
        private string Telefono;
        private string FechaNacimiento;
        private bool Admin;
        private bool Estado;

        //Constructores
        public Usuario() {; }

        public void SetId(string _Id) { Id = _Id; }
        public void SetUser(string _User) { User = _User; }
        public void SetNombres(string _Nombres) { Nombres = _Nombres; }
        public void SetApellidos(string _Apellidos) { Apellidos = _Apellidos; }
        public void SetEmail(string _Email) { Email = _Email; }
        public void SetPassword(string _Password) { Password = _Password; }
        public void SetTelefono(string _Telefono) { Telefono = _Telefono; }
        public void SetFechaNacimiento(string _FechaNacimiento) { FechaNacimiento = _FechaNacimiento; }
        public void SetAdmin(bool _Admin) { Admin = _Admin; }
        public void SetEstado(bool _Estado) { Estado = _Estado; }

        public string GetId() { return Id; }
        public string GetUser() { return User; }
        public string GetNombres() { return Nombres; }
        public string GetApellidos() { return Apellidos; }
        public string GetEmail() { return Email; }
        public string GetPassword() { return Password; }
        public string GetTelefono() { return Telefono; }
        public string GetFechaNacimiento() { return FechaNacimiento; }
        public bool GetAdmin() { return Admin; }
        public bool GetEstado() { return Estado; }
    }
}
