using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ventas
    {

        private string ID_Ventas;
        private Usuario ID_Usuario = new Usuario();
        private MetodoXUsuario NroTarjeta = new MetodoXUsuario();
        private string metodoPago;
        private string Fecha_Venta;
        private float Precio_Total;

        public Ventas() {; }
        

        public void SetIDVentas(string _ID_Ventas) { ID_Ventas=_ID_Ventas; }
        public void SetIDUsuario(Usuario Usuario) { ID_Usuario.SetId(Usuario.GetId()); }
        public void SetIDMetodoPago(string _MetodoPago) { metodoPago = _MetodoPago; }
        public void SetFechaVenta(string _Fecha_Venta) { Fecha_Venta = _Fecha_Venta; }
        public void SetPrecioTotal(float _Precio_Total) { Precio_Total=_Precio_Total; }
        public void SetNroTarjeta(MetodoXUsuario _metodoXUsuario) { NroTarjeta.SetnroTarjeta(_metodoXUsuario.GetnroTarjeta()); }

        public string GetIDVentas() { return ID_Ventas; }
        public string GetIDUsuario() { return ID_Usuario.GetId(); }
        public string GetIDMetodoPago() { return metodoPago; }
        public string GetFechaVenta() { return Fecha_Venta; }
        public float GetPrecioTotal() { return Precio_Total; }
        public string GetNroTarjeta() { return NroTarjeta.GetnroTarjeta(); }

    }
}
