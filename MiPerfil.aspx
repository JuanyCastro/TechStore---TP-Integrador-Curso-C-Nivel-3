<%@ Page Title="Mi Perfil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="TPFinalNivel3_Castro.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function previsualizarImagen(input) {
            const lblNombre = document.getElementById('lblNombreArchivo');

            if (input.files && input.files[0]) {
                lblNombre.textContent = input.files[0].name;

                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('<%= imgNuevoPerfil.ClientID %>').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                lblNombre.textContent = "";
            }
        }
    </script>

    <div class="container mt-4 mb-5">
        <h2 class="fw-bold text-secondary">Mi Perfil</h2>
        <hr />

        <div class="row bg-light p-4 rounded shadow-sm">

            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label fw-bold">Email</label>
                    <asp:TextBox runat="server" CssClass="form-control text-muted" ID="txtEmail" ReadOnly="true" />
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Nombre</label>
                    <asp:TextBox runat="server" CssClass="form-control" ClientIDMode="Static" ID="txtNombre" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es obligatorio." ControlToValidate="txtNombre" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgPerfil" />
                    <asp:RegularExpressionValidator
                        ErrorMessage="El nombre solo puede contener letras, números y espacios."
                        ControlToValidate="txtNombre"
                        runat="server"
                        ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s]{2,50}$"
                        CssClass="text-danger small"
                        Display="Dynamic"
                        ValidationGroup="vgPerfil" />
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Apellido</label>
                    <asp:TextBox ID="txtApellido" ClientIDMode="Static" runat="server" CssClass="form-control" MaxLength="50" />
                    <asp:RequiredFieldValidator ErrorMessage="El apellido es obligatorio." ControlToValidate="txtApellido" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgPerfil" />
                    <asp:RegularExpressionValidator
                        ErrorMessage="El apellido solo puede contener letras, números y espacios."
                        ControlToValidate="txtApellido"
                        runat="server"
                        ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s]{2,50}$"
                        CssClass="text-danger small"
                        Display="Dynamic"
                        ValidationGroup="vgPerfil" />
                </div>
            </div>

            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label fw-bold">Foto de Perfil</label>

                    <div class="d-flex align-items-center mt-1">
                        <input type="file" id="txtImagen" runat="server" style="display: none;" onchange="previsualizarImagen(this);" />
                        <button type="button" class="btn btn-outline-secondary" onclick="document.getElementById('<%= txtImagen.ClientID %>').click();">
                            Seleccionar archivo
                        </button>
                        <span id="lblNombreArchivo" class="ms-3 text-muted fst-italic text-truncate" style="max-width: 200px;"></span>
                    </div>
                </div>

                <div class="text-start mt-4">
                    <asp:Image ID="imgNuevoPerfil"
                        ImageUrl="https://placehold.co/600x400/EEE/31343C?font=montserrat&text=Sin+Imagen"
                        runat="server"
                        CssClass="img-fluid rounded shadow-sm border bg-white"
                        Style="width: 100%; max-width: 300px; height: 300px; object-fit: contain;"
                        onerror="this.onerror=null; this.src='https://placehold.co/600x400/EEE/31343C?font=montserrat&text=Sin+Imagen';" />
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12 d-flex align-items-center">
                <asp:Button Text="Guardar Cambios" CssClass="btn btn-primary px-4 me-3" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" ValidationGroup="vgPerfil" />
                <a href="Default.aspx" class="btn btn-outline-secondary px-4">Regresar</a>
            </div>
            <div class="col-md-12 mt-3">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-success fw-bold"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
