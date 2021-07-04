using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class MetodoXUsuario
    {
        private MetodoPago metodoPago = new MetodoPago();
        private Usuario usuario = new Usuario();
        private string Nro_Tarjeta;
        private string Email;
        private string Clave_Seguridad;
        private string Fecha_Vencimiento;
        private string DNI;
        private string Nombres;
        private string Apellidos;
        private string Telefono;
        private string Direccion;
        private string CodigoPostal;
        private bool Estado;

        //sets
        public void SetIdMP(MetodoPago MetodoPago) { metodoPago.Id = MetodoPago.Id; }
        public void SetIdUsuario(Usuario Usuario) { usuario.SetId(Usuario.GetId()); }
        public void SetnroTarjeta(string _nro) { Nro_Tarjeta = _nro; }
        public void SetEmail(string _Email) { Email = _Email; }
        public void SetClave(string _Clave) { Clave_Seguridad = _Clave; }
        public void SetFecha(string _fecha) {
            _fecha = _fecha.Replace("00:00:00", "");
            _fecha = _fecha.Replace("0:00:00", "");
            Fecha_Vencimiento = _fecha;
        }
        public void SetDni(string _dni) { DNI = _dni; }
        public void SetNombres(string _Nombres) { Nombres = _Nombres; }
        public void SetApellidos(string _Apellidos) { Apellidos = _Apellidos; }
        public void SetTelefono(string _Telefono) { Telefono = _Telefono; }
        public void SetDireccion(string _direccion) { Direccion = _direccion; }
        public void SetCodigoPostal(string _cod) { CodigoPostal = _cod; }
        public void SetEstado(bool _estado) { Estado = _estado; }

        //gets
        public string GetIdMP() { return metodoPago.Id; }
        public string GetIdUsuario() { return usuario.GetId(); }
        public string GetnroTarjeta() { return Nro_Tarjeta; }
        public string GetEmail() { return Email; }
        public string GetClave() { return Clave_Seguridad; }
        public string GetFecha(){ return Fecha_Vencimiento ;}
        public string GetDni() { return DNI; }
        public string GetNombres() { return Nombres; }
        public string GetApellidos() { return Apellidos; }
        public string GetTelefono() { return Telefono; }
        public string GetDireccion() { return Direccion; }
        public string GetCodigoPostal() { return CodigoPostal; }
        public bool GetEstado() { return Estado; }



    }
}
