using dominio;
using Microsoft.Ajax.Utilities;
using Microsoft.Win32;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinalNivel3_Castro
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Usuario user = (Usuario)Session["usuario"];
                lblUser.Text = user.Email;

                if (!string.IsNullOrEmpty(user.UrlImagenPerfil))
                {
                    imgAvatar.ImageUrl = "~/Images/Perfiles/" + user.UrlImagenPerfil;
                }
                else
                {
                    imgAvatar.ImageUrl = "https://ui-avatars.com/api/?name=" + user.Email + "&background=0D8ABC&color=fff&rounded=true";
                }
            }
            else
            {
                lblUser.Text = "";
                imgAvatar.ImageUrl = "https://ui-avatars.com/api/?name=Invitado&background=6c757d&color=fff&rounded=true";
            }

            if (!(Page is Login || Page is Registro || Page is _Default || Page is Error || Page is Detalle))
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                {
                    Response.Redirect("Login.aspx", false);
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}