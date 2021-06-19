using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Web.UI.WebControls;
using System.Data;

namespace Negocio
{
    public class NegocioCategoria
    {
        DaoCategoria dao = new DaoCategoria();

        public bool AgregarCategoria(Categoria categoria)
        {
            string consultaExiste = $"SELECT Codigo_Cat FROM Categorias WHERE Codigo_Cat = '{categoria.Codigo}'";

            if (dao.ExisteCategoria(consultaExiste)) return dao.AgregarCategoria(categoria);
            return false;
        }

        public CheckBoxList ListarCategorias(CheckBoxList checkBoxList)
        {
            string consulta = $"SELECT Codigo_Cat, Nombre_Cat FROM Categorias";
            DataTable dt = dao.ListarCategorias(consulta);

            checkBoxList.DataSource = dt;
            checkBoxList.DataTextField = "Nombre_Cat";
            checkBoxList.DataValueField = "Codigo_Cat";
            checkBoxList.DataBind();

            return checkBoxList;
        }
    }
}
