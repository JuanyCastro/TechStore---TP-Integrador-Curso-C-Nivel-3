using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace TPFinalNivel3_Castro
{
    public partial class ListaArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requieren permisos de admin.");
                Response.Redirect("Error.aspx", false);
                return;
            }

            if (!IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();

                List<Articulo> listaArticulos = negocio.listar();
                Session.Add("listaArticulosAdmin", listaArticulos);

                dgvArticulos.DataSource = listaArticulos;
                dgvArticulos.DataBind();

                ddlMarcaAdmin.DataSource = negocio.listarMarcas();
                ddlMarcaAdmin.DataTextField = "Descripcion";
                ddlMarcaAdmin.DataValueField = "Id";
                ddlMarcaAdmin.DataBind();
                ddlMarcaAdmin.Items.Insert(0, new ListItem("Todas las marcas", "0"));

                ddlCategoriaAdmin.DataSource = negocio.listarCategorias();
                ddlCategoriaAdmin.DataTextField = "Descripcion";
                ddlCategoriaAdmin.DataValueField = "Id";
                ddlCategoriaAdmin.DataBind();
                ddlCategoriaAdmin.Items.Insert(0, new ListItem("Todas las categorías", "0"));
            }
        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulo.aspx?id=" + id, false);
        }

        protected void btnBuscarAdmin_Click(object sender, EventArgs e)
        {
            List<Articulo> listaOriginal = (List<Articulo>)Session["listaArticulosAdmin"];

            List<Articulo> listaFiltrada = listaOriginal.FindAll(x =>
                (x.Nombre.ToUpper().Contains(txtBuscarAdmin.Text.ToUpper()) ||
                 x.Codigo.ToUpper().Contains(txtBuscarAdmin.Text.ToUpper())) &&

                (ddlMarcaAdmin.SelectedValue == "0" || x.MarcaArticulo.Id.ToString() == ddlMarcaAdmin.SelectedValue) &&
                (ddlCategoriaAdmin.SelectedValue == "0" || x.CategoriaArticulo.Id.ToString() == ddlCategoriaAdmin.SelectedValue)
            );

            dgvArticulos.DataSource = listaFiltrada;
            dgvArticulos.DataBind();
        }

        protected void btnLimpiarAdmin_Click(object sender, EventArgs e)
        {
            txtBuscarAdmin.Text = "";
            ddlMarcaAdmin.SelectedIndex = 0;
            ddlCategoriaAdmin.SelectedIndex = 0;

            dgvArticulos.DataSource = Session["listaArticulosAdmin"];
            dgvArticulos.DataBind();
        }
    }
}