<%@ Page Title="Iniciar Sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPFinalNivel3_Castro.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">

                <h2 class="fw-bold text-secondary text-center mb-4">Iniciar Sesión</h2>

                <div class="bg-light p-4 rounded shadow-sm border">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control w-100" placeholder="nombre@ejemplo.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="El email es obligatorio." ControlToValidate="txtEmail" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgLogin" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Contraseña</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control w-100" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="La contraseña es obligatoria." ControlToValidate="txtPassword" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgLogin" />
                    </div>

                    <asp:Label ID="lblErrorLogin" runat="server" CssClass="text-danger small fw-bold mb-3 d-block text-center" Visible="false"></asp:Label>
                    <div class="d-flex justify-content-center mt-4">
                        <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-primary fw-bold" OnClick="btnLogin_Click" ValidationGroup="vgLogin" />
                    </div>

                    <hr class="my-4 text-secondary" />

                    <div class="text-center mt-3">
                        <span class="text-muted small">¿No tienes cuenta?</span>
                        <a href="Registro.aspx" class="text-decoration-none fw-bold small">Regístrate aquí</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
