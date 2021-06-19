using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Dao
{
    public class DaoCategoria
    {
        AccesoDatos ad = new AccesoDatos();

        public bool ExisteCategoria(string Consulta)
        {
            return ad.existe(Consulta);
        }

        public bool AgregarCategoria(Categoria categoria)
        {
            SqlCommand Comando = new SqlCommand();
            ArmarParametrosAgregarCategoria(ref Comando, categoria);

            int filasAfectadas = ad.EjecutarProcedimientoAlmacenado(Comando, "spAgregar_Categoria");
            if (filasAfectadas == 1) return true;
            return false;
        }

        public DataTable ListarCategorias(string consulta)
        {
            DataTable dt = new DataTable();
            dt = ad.ObtenerTabla("Categorias", consulta);

            return dt;
        }

        public Categoria GetCategoria(Categoria categoria, string consulta)
        {
            DataTable dt = ad.ObtenerTabla("Categorias", consulta);

            categoria.Codigo = dt.Rows[0][0].ToString();
            categoria.Nombre = dt.Rows[0][1].ToString();

            return categoria;
        }

        private void ArmarParametrosAgregarCategoria(ref SqlCommand Comando, Categoria categoria)
        {
            SqlParameter SqlParametros = new SqlParameter();
            //NOMBRE
            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 20);
            SqlParametros.Value = categoria.Nombre;
            //CODIGO
            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.Char, 10);
            SqlParametros.Value = categoria.Codigo;
        }

    }
}
