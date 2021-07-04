using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleVenta
    {
        string id;
        Ventas idVenta = new Ventas();
        Key serieKey = new Key();
        Juego codJuego = new Juego();
        float precio;

        public float Precio { get => precio; set => precio = value; }

        public string Id { get => id; set => id = value; }

        public void setIdVenta(Ventas venta) { idVenta.SetIDVentas(venta.GetIDVentas()); }

        public void setSerieKey(Key key) { serieKey.SetSerial(key.GetSerial()); }

        public void setCodJuego(Juego juego) { codJuego.SetCodigo(juego.GetCodigo()); }

        public string getIdVenta() { return idVenta.GetIDVentas(); }
     
        public string getSerieKey() { return serieKey.GetSerial(); }
      
        public string getCodJuego() { return codJuego.GetCodigo(); }


    }
}
