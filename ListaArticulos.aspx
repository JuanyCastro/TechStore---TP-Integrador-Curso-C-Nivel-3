<%@ Page Title="Lista de Artículos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaArticulos.aspx.cs" Inherits="TPFinalNivel3_Castro.ListaArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-secondary">Administrar Catálogo</h2>
            <a href="FormularioArticulo.aspx" class="btn btn-success rounded-pill px-4 shadow-sm">+ Agregar Artículo</a>
        </div>
        <hr />

        <div class="row bg-light p-3 rounded shadow-sm mb-4 align-items-center">
            <div class="col-md-4">
                <label class="form-label fw-bold">Buscar:</label>
                <asp:TextBox ID="txtBuscarAdmin" runat="server" CssClass="form-control" placeholder="Nombre o código..."></asp:TextBox>
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold">Marca:</label>
                <asp:DropDownList ID="ddlMarcaAdmin" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold">Categoría:</label>
                <asp:DropDownList ID="ddlCategoriaAdmin" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="col-md-2 d-flex pt-4">
                <asp:Button ID="btnBuscarAdmin" runat="server" Text="Buscar" CssClass="btn btn-primary me-2" OnClick="btnBuscarAdmin_Click" />
                <asp:Button ID="btnLimpiarAdmin" runat="server" Text="Limpiar" CssClass="btn btn-outline-secondary" OnClick="btnLimpiarAdmin_Click" />
            </div>
        </div>

        <div class="table-responsive shadow-sm rounded">
            <asp:GridView ID="dgvArticulos" runat="server"
                CssClass="table table-striped table-hover table-borderless align-middle mb-0"
                AutoGenerateColumns="false"
                DataKeyNames="Id"
                OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged">

                <HeaderStyle CssClass="table-dark" />

                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="Codigo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Marca" DataField="MarcaArticulo.Descripcion" />
                    <asp:BoundField HeaderText="Categoría" DataField="CategoriaArticulo.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C}" />
                    <asp:CommandField ShowSelectButton="true" SelectText="Editar" ControlStyle-CssClass="btn btn-sm btn-outline-primary fw-bold" HeaderText="Acción" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
