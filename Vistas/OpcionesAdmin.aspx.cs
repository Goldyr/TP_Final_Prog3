using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace WebApplication1
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
           // Key _Key = new Key();
            NegocioJuego _NJ = new NegocioJuego();

           // _Key.SetCodJuego(txt_ID.Text.Trim());
            DataTable tabla = new DataTable();
            
            tabla = _NJ.NJ_BuscarJuego_Key(txt_ID.Text.Trim());  //busca el codigo ingresado en el textbox, si existe, devuelve una tabla con el nombre del juego y cantidad de keys. Sino devuelve una tabla con valores nulos

            lblJuego.Text = tabla.Rows[0][0].ToString();
            lblKeys.Text = tabla.Rows[0][1].ToString();
            
        }

        protected void btn_agregarkey_Click(object sender, EventArgs e)
        {
            Key _key = new Key();
            NegocioKey _NK = new NegocioKey();

            _key.SetCodJuego(txt_ID.Text.Trim());
            _key.SetSerial(txt_serialkey.Text.Trim());

            if (_NK.NK_AgregarKey(_key))
            {
                lbl_key.Text = "Key agregada correctamente";
            } else lbl_key.Text = "No se pudo agregar la Key";
        }
    }
}