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
        public bool ExisteJuego(Juego _Juego, string Consulta)
        {

            return datos.existe(Consulta);
        }


        //AGREGAR RECIBE UN OBJETO 
        public bool AgregarJuego(Juego _Juego)
        {

            SqlCommand Comando = new SqlCommand();
            ArmarParametrosAgregarJuego(ref Comando, _Juego);
            int filas = datos.EjecutarProcedimientoAlmacenado(Comando, "spAgregar_Juegos");
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
            SqlParametros = Comando.Parameters.Add("@Imagen", SqlDbType.VarChar,80);
            SqlParametros.Value = _Juego.GetImagen();

        }
        //Devuelve una DataTable con todos los juegos
        public DataTable ListarJuegos()
        {
            DataTable dt = new DataTable();
            string consulta = $"SELECT Nombre_J, Codigo_J, PU_J, CodigoDes_J, CodigoDist_J, Descuento_J, Fecha_Lanzamiento, Estado, Descripcion FROM Juegos";
            dt = datos.ObtenerTabla("prueba", consulta);
            return dt;
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
