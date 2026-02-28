using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace TPFinalNivel3_Castro
{
    public partial class MisFavoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["usuario"]))
            {
                Session.Add("error", "Debes iniciar sesión para ver tus favoritos.");
                Response.Redirect("Login.aspx", false);
                return;
            }

            if (!IsPostBack)
            {
                cargarFavoritos();
            }
        }

        private void cargarFavoritos()
        {
            Usuario user = (Usuario)Session["usuario"];
            FavoritoNegocio negocio = new FavoritoNegocio();
            List<Articulo> lista = negocio.listarFavoritos(user.Id);

            if (lista.Count > 0)
            {
                repFavoritos.DataSource = lista;
                repFavoritos.DataBind();
                lblSinFavoritos.Visible = false;
            }
            else
            {
                repFavoritos.DataSource = null;
                repFavoritos.DataBind();
                lblSinFavoritos.Visible = true;
            }
        }

        protected void btnEliminarFav_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                int idArticulo = int.Parse(btn.CommandArgument);
                Usuario user = (Usuario)Session["usuario"];

                FavoritoNegocio negocio = new FavoritoNegocio();
                negocio.eliminarFavorito(user.Id, idArticulo);

                cargarFavoritos();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}