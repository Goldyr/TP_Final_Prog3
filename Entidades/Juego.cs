using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Juego
    {
       //Parametros
       private string Codigo;
       private string Nombre;
       private string CodigoDes;
       private string CodigoDis;
       private string Descripcion;
       private string Imagen;
       private string Fecha;
       private float Precio;
       private int Descuento;
       private bool Estado;

       //Constructores
       public Juego() { 
        
        }

        //Sets 
       public void SetEstado(bool _Estado) { Estado = _Estado; }
       public void SetCodigo( string _Codigo) { Codigo = _Codigo; }
       public void SetNombre(string _Nombre) { Nombre = _Nombre; }
       public void SetDescuento(int _Descuento) { Descuento = _Descuento; }
       public void SetPrecio(float _Precio) { Precio = _Precio; }
       public void SetImagen(string _Img) { Imagen = _Img; }
       public void SetCodigoDis(string _CodigoDis) { CodigoDis = _CodigoDis; }
       public void SetCodigoDes(string _CodigoDes) { CodigoDes = _CodigoDes; }
       public void SetDescripcion(string _Descrip) { Descripcion = _Descrip; }
       public void SetFecha(string _Fecha) { Fecha = _Fecha; }

        //Get
       public bool GetEstado() { return this.Estado; }
       public string GetCodigo() { return this.Codigo; }
       public string GetNombre() { return this.Nombre; }
       public string GetCodigoDes() { return this.CodigoDes; }
       public string GetCodigoDis() { return this.CodigoDis; }
       public string GetImagen() { return this.Imagen; }
       public string GetFecha() { return this.Fecha; }
       public string GetDescripcion() { return this.Descripcion; }
       public float GetPrecio() { return this.Precio; }
       public float GetDescuento() { return this.Descuento; }

    }
}
