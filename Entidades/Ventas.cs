using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Ventas
    {

        private string ID_Ventas;
        private Usuario ID_Usuario = new Usuario();
        private string ID_Metodo_Pago;
        private string Fecha_Venta;
        private float Precio_Total;

        public void ventas()
        {

        }

        public void SetIDVentas(string _ID_Ventas) { ID_Ventas=_ID_Ventas; }
        public void SetIDUsuario(string _ID_Usuario) { ID_Usuario.SetId(_ID_Usuario); }
        public void SetIDMetodoPago(string _ID_Metodo_Pago) { ID_Metodo_Pago = _ID_Metodo_Pago; }
        public void SetFechaVenta(string _Fecha_Venta) { Fecha_Venta = _Fecha_Venta; }
        public void SetPrecioTotal(float _Precio_Total) { Precio_Total=_Precio_Total; }

        public string GetIDVentas() { return ID_Ventas; }
        public string GetIDUsuario() { return ID_Usuario.GetId(); }
        public string GetIDMetodoPago() { return ID_Metodo_Pago; }
        public string GetFechaVenta() { return Fecha_Venta; }
        public float GetPrecioTotal() { return Precio_Total; }

    }
}
