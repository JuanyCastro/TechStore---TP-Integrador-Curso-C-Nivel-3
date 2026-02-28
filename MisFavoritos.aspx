<%@ Page Title="Mis Favoritos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisFavoritos.aspx.cs" Inherits="TPFinalNivel3_Castro.MisFavoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="fw-bold text-secondary">Mis Favoritos ❤</h2>
        <hr />

        <asp:Label ID="lblSinFavoritos" runat="server" CssClass="h5 text-muted mt-4" Visible="false" Text="Aún no tienes artículos en tus favoritos. ¡Ve al catálogo a buscar algunos!"></asp:Label>

        <asp:UpdatePanel ID="upFavoritos" runat="server">
            <ContentTemplate>
                <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4 mt-3">
                    <asp:Repeater ID="repFavoritos" runat="server">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card h-100 shadow-sm border-0 product-card-hover" style="background-color: #fcfcfc;">

                                    <img src='<%# Eval("ImagenUrl") %>'
                                        class="card-img-top p-3"
                                        style="height: 250px; object-fit: contain;"
                                        alt="Imagen de <%# Eval("Nombre") %>"
                                        onerror="this.onerror=null; this.src='https://placehold.co/600x400/EEE/31343C?font=montserrat&text=Sin+Imagen';" />

                                    <div class="card-body d-flex flex-column text-center justify-content-end bg-white border-top">
                                        <h5 class="card-title fw-bold mb-1 text-truncate" title='<%# Eval("Nombre") %>'>
                                            <%# Eval("Nombre") %>
                                        </h5>

                                        <h4 class="text-success fw-bold mt-2 mb-3">
                                            <%# String.Format("{0:C}", Eval("Precio")) %>
                                        </h4>

                                        <div class="d-flex justify-content-between mt-auto">
                                            <a href="Detalle.aspx?id=<%# Eval("Id") %>" class="btn btn-outline-dark w-75">Ver Detalle</a>
                                            <asp:Button ID="btnEliminarFav" runat="server" Text="💔" CssClass="btn btn-outline-danger w-25 ms-1" CommandArgument='<%# Eval("Id") %>' OnClick="btnEliminarFav_Click" title="Quitar de favoritos" />
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
