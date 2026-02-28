<%@ Page Title="Gestionar Artículo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="TPFinalNivel3_Castro.FormularioArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">

        <h2 class="fw-bold text-secondary">Gestionar Artículo</h2>
        <hr />

        <div class="row bg-light p-4 rounded shadow-sm">

            <div class="col-md-6">
                <div class="mb-3">
                    <label for="txtCodigo" class="form-label fw-bold">Código</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" placeholder="Ej: S01" />
                    <asp:RequiredFieldValidator ErrorMessage="El código es obligatorio." ControlToValidate="txtCodigo" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgGuardar" />
                </div>

                <div class="mb-3">
                    <label for="txtNombre" class="form-label fw-bold">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" placeholder="Ej: Galaxy S10" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es obligatorio." ControlToValidate="txtNombre" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgGuardar" />
                </div>

                <div class="mb-3">
                    <label for="ddlMarca" class="form-label fw-bold">Marca</label>
                    <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="ddlCategoria" class="form-label fw-bold">Categoría</label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="txtPrecio" class="form-label fw-bold">Precio</label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" placeholder="Ej: 50000.99" />
                    </div>
                    <asp:RequiredFieldValidator ErrorMessage="El precio es obligatorio." ControlToValidate="txtPrecio" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgGuardar" />
                    <asp:RegularExpressionValidator ErrorMessage="Solo números válidos (Ej: 10.50)." ControlToValidate="txtPrecio" ValidationExpression="^[0-9]+([,\.][0-9]+)?$" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgGuardar" />
                </div>
            </div>

            <div class="col-md-6">
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label fw-bold">Descripción</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" Rows="4" placeholder="Breve descripción del artículo..." />
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="mb-1">
                            <label for="txtImagenUrl" class="form-label fw-bold">Url Imagen</label>
                            <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" placeholder="https://ejemplo.com/imagen.jpg" />
                        </div>

                        <div class="text-start mt-3">
                            <asp:Image ImageUrl="https://placehold.co/600x400/EEE/31343C?font=montserrat&text=Sin+Imagen"
                                runat="server" ID="imgArticulo"
                                CssClass="img-fluid rounded shadow-sm border bg-white"
                                Style="width: 100%; max-width: 450px; height: 300px; object-fit: contain;"
                                onerror="this.onerror=null; this.src='https://placehold.co/600x400/EEE/31343C?font=montserrat&text=Sin+Imagen';" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-12 d-flex align-items-center">
                <asp:Button Text="Guardar Artículo" ID="btnAceptar" CssClass="btn btn-primary px-4 me-3" OnClick="btnAceptar_Click" runat="server" ValidationGroup="vgGuardar" />

                <a href="ListaArticulos.aspx" class="btn btn-outline-secondary px-4 me-3">Cancelar</a>

                <div class="ms-auto">
                    <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger px-4" runat="server" Visible="false" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
