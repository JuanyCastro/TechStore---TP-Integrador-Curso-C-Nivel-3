<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="_Default.aspx.cs" Inherits="TPFinalNivel3_Castro._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .product-card-hover {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

            .product-card-hover:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 25px rgba(0,0,0,.15) !important;
                cursor: pointer;
            }
    </style>

    <div class="text-center mt-5 mb-5">
        <h1 class="display-4 fw-bold text-dark">Bienvenido a TechStore</h1>
        <p class="lead text-muted">Descubre la mejor selección de tecnología y gadgets.</p>
    </div>

    <div class="container">

        <div class="row bg-light p-3 rounded shadow-sm mb-4 align-items-center">
            <div class="col-md-4">
                <label class="form-label fw-bold">Buscar:</label>
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Nombre o descripción..."></asp:TextBox>
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold">Marca:</label>
                <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold">Categoría:</label>
                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="col-md-2 d-flex pt-4">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary me-2" OnClick="btnBuscar_Click" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-outline-secondary" OnClick="btnLimpiar_Click" />
            </div>
        </div>

        <h2 class="mb-4 fw-bold text-secondary">Nuestro Catálogo</h2>
        <hr />

        <asp:UpdatePanel ID="upFavoritos" runat="server">
            <ContentTemplate>
                <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4 mt-1">
                    <asp:Repeater ID="repArticulos" runat="server">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card h-100 shadow-sm position-relative border-0 product-card-hover" style="background-color: #fcfcfc;">

                                    <img src='<%# Eval("ImagenUrl") %>'
                                        class="card-img-top p-3"
                                        style="height: 250px; object-fit: contain;"
                                        alt="Imagen de <%# Eval("Nombre") %>"
                                        onerror="this.src='https://placehold.co/600x400/EEE/31343C?font=montserrat&text=Sin+Imagen';">

                                    <div class="card-body d-flex flex-column text-center justify-content-end bg-white border-top">
                                        <h5 class="card-title fw-bold mb-1 text-truncate" title='<%# Eval("Nombre") %>'>
                                            <%# Eval("Nombre") %>
                                        </h5>

                                        <h4 class="text-success fw-bold mt-2 mb-3">
                                            <%# String.Format("{0:C}", Eval("Precio")) %>
                                        </h4>

                                        <div class="d-flex justify-content-between mt-auto">
                                            <a href="Detalle.aspx?id=<%# Eval("Id") %>" class="btn btn-outline-dark w-75">Ver Detalle</a>
                                            <asp:Button ID="btnFavorito" runat="server"
                                                Text='<%# EsFavorito(Convert.ToInt32(Eval("Id"))) ? "❤️" : "🤍" %>'
                                                CssClass="btn btn-outline-danger w-auto px-3 ms-1"
                                                CommandArgument='<%# Eval("Id") %>'
                                                OnClick="btnFavorito_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
