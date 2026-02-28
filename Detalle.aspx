<%@ Page Title="Detalle del Artículo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TPFinalNivel3_Castro.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mb-5">

        <h2 class="fw-bold text-secondary">Detalle del Artículo</h2>
        <hr />

        <div class="row bg-light p-4 rounded shadow-sm align-items-center border">

            <div class="col-md-6 text-center mb-4 mb-md-0">
                <asp:Image ImageUrl="https://placehold.co/600x400/EEE/31343C?font=montserrat&text=Sin+Imagen"
                    runat="server" ID="imgArticulo"
                    CssClass="img-fluid rounded shadow-sm border bg-white p-2"
                    Style="width: 100%; max-width: 450px; height: 450px; object-fit: contain;"
                    onerror="this.onerror=null; this.src='https://placehold.co/600x400/EEE/31343C?font=montserrat&text=Sin+Imagen';" />
            </div>

            <div class="col-md-6">

                <div class="mb-3">
                    <label class="form-label fw-bold text-secondary small text-uppercase">Código</label>
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control bg-white text-muted" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold text-secondary small text-uppercase">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control bg-white text-dark fw-bold" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold text-secondary small text-uppercase">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control bg-white text-muted" TextMode="MultiLine" Rows="4" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-6 mb-3">
                        <label class="form-label fw-bold text-secondary small text-uppercase">Marca</label>
                        <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control bg-white text-muted" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-6 mb-3">
                        <label class="form-label fw-bold text-secondary small text-uppercase">Categoría</label>
                        <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control bg-white text-muted" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-bold text-secondary small text-uppercase">Precio</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control bg-white text-success fw-bold fs-4" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="d-flex mt-4">
                    <a href="Default.aspx" class="btn btn-outline-secondary px-5 fw-bold">Volver al Catálogo</a>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
