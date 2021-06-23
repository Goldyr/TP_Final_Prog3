using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Dao
{
    public class DaoJuego
    {
        AccesoDatos datos = new AccesoDatos();
       
        //HACER VERIFICAR CODIGO del juego
        public bool ExisteJuego(string Consulta)
        {

            return datos.existe(Consulta);
        }


        //AGREGAR RECIBE UN OBJETO 
        public bool AgregarJuego(Juego _Juego)
        { 

            SqlCommand Comando = new SqlCommand();
            ArmarParametrosAgregarJuego(ref Comando, _Juego);
            int filas = datos.EjecutarProcedimientoAlmacenado(Comando, "spAgregar_Juego");
            if (filas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //SE ARMA PARA AGREGAR EL JUEGO 
        private void ArmarParametrosAgregarJuego(ref SqlCommand Comando, Juego _Juego)
        {
            SqlParameter SqlParametros = new SqlParameter();
            //NOMBRE
            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            SqlParametros.Value = _Juego.GetNombre();
            //CODIGO
            //SqlParametros = Comando.Parameters.Add("@Codigo", SqlDbType.Char, 10);
            //SqlParametros.Value = _Juego.GetCodigo();
            //PRECIO
            SqlParametros = Comando.Parameters.Add("@Precio", SqlDbType.Decimal);
            SqlParametros.Value = _Juego.GetPrecio();
            //DES
            SqlParametros = Comando.Parameters.Add("@Codigo_Des", SqlDbType.Char, 10);
            SqlParametros.Value = _Juego.GetCodigoDes();
            //DIS
            SqlParametros = Comando.Parameters.Add("@Codigo_Dis", SqlDbType.Char, 10);
            SqlParametros.Value = _Juego.GetCodigoDis();
            //DESCUENTO
            SqlParametros = Comando.Parameters.Add("@Descuento", SqlDbType.Int);
            SqlParametros.Value = _Juego.GetDescuento();
            //DESC
            SqlParametros = Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar, 300);
            SqlParametros.Value = _Juego.GetDescripcion();
            //FECHA
            SqlParametros = Comando.Parameters.Add("@Fecha", SqlDbType.Date);
            SqlParametros.Value = _Juego.GetFecha();
            //IMAGEN
            //TODO: Ver como hacemos esto
            // ==================================================
            //SqlParametros = Comando.Parameters.Add("@Imagen", SqlDbType.VarChar,70);
            //SqlParametros.Value = _Juego.GetImagen();

        }

        //Devuelve una DataTable con todos los juegos
        public DataTable ListarJuegos()
        {
            DataTable dt = new DataTable();
            string consulta = $"SELECT Nombre_J, Codigo_J, PU_J, CodigoDes_J, CodigoDis_J, Descuento_J, Fecha_Lanzamiento_J, Estado_J, Descripcion_J FROM Juegos";
            dt = datos.ObtenerTabla("prueba", consulta);
            return dt;
        }

        public Juego getJuego(Juego _juego, string consulta)
        {
          
            DataTable tabla = datos.ObtenerTabla("Juego", consulta) ;
            _juego.SetNombre(tabla.Rows[0][0].ToString());
            _juego.SetCodigo(tabla.Rows[0][1].ToString());
            _juego.SetPrecio(Convert.ToSingle(tabla.Rows[0][2].ToString())); 
            _juego.SetCodigoDes(tabla.Rows[0][3].ToString());
            _juego.SetCodigoDis(tabla.Rows[0][4].ToString());
            _juego.SetDescuento(Convert.ToInt32(tabla.Rows[0][5].ToString()));   
            _juego.SetDescripcion(tabla.Rows[0][6].ToString());
            _juego.SetFecha(tabla.Rows[0][7].ToString());
            _juego.SetImagen(tabla.Rows[0][8].ToString());
            _juego.SetEstado(Convert.ToBoolean(tabla.Rows[0][9].ToString()));

            return _juego;
        }



        //Elimina un juego depende el id //Ejecuta procedimiento
        public bool EliminarJuego(Juego _juego)
        {
            SqlCommand Comando = new SqlCommand();
            SqlParameter Parametros = new SqlParameter();
            Parametros = Comando.Parameters.Add("@CodJuego", SqlDbType.Char);
            Parametros.Value = _juego.GetCodigo();

            int filas = datos.EjecutarProcedimientoAlmacenado(Comando, "spEliminarJuego");
            if(filas == 1)
            {
                return true; //Devuelve true si borro algo
            }
            else
            {
                return false; //Devuelve false si no borro algo
            }
        }

        
        //Modifica un juego en la base de datos devuelve true en caso de haberlo modificado correctamente
        public bool ModificarJuego(Juego _juego)
        {
            SqlCommand Comando = new SqlCommand();
            
            //Agrego parametros
            ArmarParametrosModificarJuego(ref Comando, _juego);
     
            //Ejecuto comando y retorna dependiendo que pase
            int filas = datos.EjecutarProcedimientoAlmacenado(Comando, "spModificar_Juego");
            if (filas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void ArmarParametrosModificarJuego(ref SqlCommand Comando, Juego _Juego)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            SqlParametros.Value = _Juego.GetNombre();
            SqlParametros = Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar, 100);
            SqlParametros.Value = _Juego.GetDescripcion();
            SqlParametros = Comando.Parameters.Add("@Codigo", SqlDbType.VarChar, 10);
            SqlParametros.Value = _Juego.GetCodigo();
            SqlParametros = Comando.Parameters.Add("@Codigo_Des", SqlDbType.VarChar, 10);
            SqlParametros.Value = _Juego.GetCodigoDes();
            SqlParametros = Comando.Parameters.Add("@Codigo_Dis", SqlDbType.VarChar, 10);
            SqlParametros.Value = _Juego.GetCodigoDis();
            SqlParametros = Comando.Parameters.Add("@Descuento", SqlDbType.Decimal);
            SqlParametros.Value = _Juego.GetDescuento();
            SqlParametros = Comando.Parameters.Add("@Fecha", SqlDbType.Date);
            SqlParametros.Value = _Juego.GetFecha();
            SqlParametros = Comando.Parameters.Add("@Precio", SqlDbType.Decimal);
            SqlParametros.Value = _Juego.GetPrecio();
            SqlParametros = Comando.Parameters.Add("@Estado", SqlDbType.Bit);
            SqlParametros.Value = _Juego.GetEstado();


        }

    }
}
/*create PROCEDURE spAgregar_Juegos
@Nombre varchar(50), 
@Codigo char(10), 
@Precio decimal(8,2), 
@Codigo_Des char(10), 
@Codigo_Dis char(10), 
@Descuento decimal(8,2), 
@Fecha date,
@Descripcion varchar(300),
@Imagen nchar(80) 
AS
INSERT INTO Juegos (Nombre_J, Codigo_J, PU_J, CodigoDes_J, CodigoDist_J, Descuento_J, Fecha_Lanzamiento, Descripcion, Imagen)
VALUES (@Nombre, @Codigo, @Precio, @Codigo_Des, @Codigo_Dis, @Descuento, @Fecha, @Descripcion, @Imagen)
GO*/
