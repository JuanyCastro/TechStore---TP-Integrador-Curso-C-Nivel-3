using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPFinalNivel3_Castro
{
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());

                ArticuloNegocio negocio = new ArticuloNegocio();
                List<Articulo> lista = negocio.listar();

                Articulo seleccionado = lista.Find(x => x.Id == id);

                if (seleccionado != null)
                {
                    txtCodigo.Text = seleccionado.Codigo;
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtMarca.Text = seleccionado.MarcaArticulo.Descripcion;
                    txtCategoria.Text = seleccionado.CategoriaArticulo.Descripcion;
                    txtPrecio.Text = seleccionado.Precio.ToString("0.00");
                    imgArticulo.ImageUrl = seleccionado.ImagenUrl;
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}