using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace TPFinalNivel3_Castro
{
    public partial class _Default : System.Web.UI.Page
    {
        public List<int> listaFavoritosActuales { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Usuario user = (Usuario)Session["usuario"];
                FavoritoNegocio favNegocio = new FavoritoNegocio();
                List<Articulo> misArticulosFav = favNegocio.listarFavoritos(user.Id);
                listaFavoritosActuales = misArticulosFav.Select(a => a.Id).ToList();
            }
            else
            {
                listaFavoritosActuales = new List<int>();
            }

            if (!IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();

                List<Articulo> listaArticulos = negocio.listar();
                Session.Add("listaArticulos", listaArticulos);

                repArticulos.DataSource = listaArticulos;
                repArticulos.DataBind();

                ddlMarca.DataSource = negocio.listarMarcas();
                ddlMarca.DataTextField = "Descripcion";
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataBind();
                ddlMarca.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todas las marcas", "0"));

                ddlCategoria.DataSource = negocio.listarCategorias();
                ddlCategoria.DataTextField = "Descripcion";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Todas las categorías", "0"));
            }
        }

        public bool EsFavorito(int idArticulo)
        {
            return listaFavoritosActuales != null && listaFavoritosActuales.Contains(idArticulo);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Articulo> listaOriginal = (List<Articulo>)Session["listaArticulos"];

            List<Articulo> listaFiltrada = listaOriginal.FindAll(x =>

                (x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()) ||
                 x.Descripcion.ToUpper().Contains(txtBuscar.Text.ToUpper())) &&

                (ddlMarca.SelectedValue == "0" || x.MarcaArticulo.Id.ToString() == ddlMarca.SelectedValue) &&

                (ddlCategoria.SelectedValue == "0" || x.CategoriaArticulo.Id.ToString() == ddlCategoria.SelectedValue)
            );

            repArticulos.DataSource = listaFiltrada;
            repArticulos.DataBind();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = "";
            ddlMarca.SelectedIndex = 0;
            ddlCategoria.SelectedIndex = 0;
            repArticulos.DataSource = Session["listaArticulos"];
            repArticulos.DataBind();
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["usuario"]))
            {
                Response.Redirect("Login.aspx", false);
                return;
            }

            try
            {
                Button btn = (Button)sender;
                int idArticulo = int.Parse(btn.CommandArgument);
                Usuario user = (Usuario)Session["usuario"];
                FavoritoNegocio negocio = new FavoritoNegocio();

                if (EsFavorito(idArticulo))
                {
                    negocio.eliminarFavorito(user.Id, idArticulo);
                }
                else
                {
                    negocio.insertarFavorito(user.Id, idArticulo);
                }

                List<dominio.Articulo> misArticulosFav = negocio.listarFavoritos(user.Id);
                listaFavoritosActuales = misArticulosFav.Select(a => a.Id).ToList();

                repArticulos.DataSource = Session["listaArticulos"];
                repArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}