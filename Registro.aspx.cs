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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Page.Validate("vgRegistro");
            if (!Page.IsValid)
                return;

            try
            {
                Usuario user = new Usuario();
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

                user.Email = txtEmail.Text;
                user.Pass = txtPassword.Text;
                user.Admin = false;

                if (usuarioNegocio.emailExiste(user.Email))
                {
                    lblErrorDato.Text = "El email ingresado ya se encuentra registrado.";
                    lblErrorDato.Visible = true;
                    return;
                }

                lblErrorDato.Visible = false;

                user.Id = usuarioNegocio.insertarNuevo(user);

                Session.Add("usuario", user);

                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}