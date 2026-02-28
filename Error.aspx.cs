using System;

namespace TPFinalNivel3_Castro
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["error"] != null)
                {
                    lblMensajeError.Text = Session["error"].ToString();
                    Session.Remove("error");
                }
                else
                    lblMensajeError.Text = "Has llegado a esta página por error, o el problema ya ha sido resuelto.";
            }
        }
    }
}