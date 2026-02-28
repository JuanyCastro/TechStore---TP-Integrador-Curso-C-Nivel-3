using dominio;
using negocio;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinalNivel3_Castro
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Usuario user = (Usuario)Session["usuario"];
                        txtEmail.Text = user.Email;
                        txtNombre.Text = user.Nombre;
                        txtApellido.Text = user.Apellido;

                        if (!string.IsNullOrEmpty(user.UrlImagenPerfil))
                            imgNuevoPerfil.ImageUrl = "~/Images/Perfiles/" + user.UrlImagenPerfil;
                    }
                    else
                    {
                        Session.Add("error", "Debes iniciar sesión para ver tu perfil.");
                        Response.Redirect("Login.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = (Usuario)Session["usuario"];
                UsuarioNegocio negocio = new UsuarioNegocio();

                if (txtImagen.PostedFile != null && txtImagen.PostedFile.ContentLength > 0)
                {
                    string ruta = Server.MapPath("~/Images/Perfiles/");

                    if (!System.IO.Directory.Exists(ruta))
                        System.IO.Directory.CreateDirectory(ruta);

                    string nombreArchivo = "perfil_" + user.Id + ".jpg";

                    txtImagen.PostedFile.SaveAs(ruta + nombreArchivo);

                    user.UrlImagenPerfil = nombreArchivo;
                }

                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;

                negocio.actualizar(user);

                Image img = (Image)Master.FindControl("imgAvatar");
                if (img != null)
                    img.ImageUrl = "~/Images/Perfiles/" + user.UrlImagenPerfil;

                if (!string.IsNullOrEmpty(user.UrlImagenPerfil))
                    imgNuevoPerfil.ImageUrl = "~/Images/Perfiles/" + user.UrlImagenPerfil + "?t=" + DateTime.Now.Ticks;

                lblMensaje.Text = "¡Perfil actualizado con éxito!";
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}