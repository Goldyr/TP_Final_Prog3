﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using Dao;
using System.Web.UI.WebControls;

namespace Negocio
{
    public class NegocioVentas
    {
        DaoVentas Dao = new DaoVentas();

        public DataTable NV_CargarGridVentas(string _Codigo)
        {
            DataTable Dt;
            Dt=Dao.ListarVentas(_Codigo);
            return Dt;

            //GridView grd = new GridView();
            //grd.DataSource = Dt;
            //grd.DataBind();
            //return grd;
        }
        public bool NV_GuardarVentas(Ventas _ventas)
        { 
            if (Dao.AgregarVenta(_ventas))
            {
                return true;            
            }
            
            return false;
        
        }

        public DataTable NV_TotalVentas()
        {
            string consulta = $"SELECT sum(PrecioTotal_V) FROM Ventas";
            return Dao.TotalVenta(consulta);
        }
    }
}
