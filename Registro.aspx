<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPFinalNivel3_Castro.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">

                <h2 class="fw-bold text-secondary text-center mb-4">Creá tu cuenta</h2>

                <div class="bg-light p-4 rounded shadow-sm border">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Email</label>
                        <asp:TextBox runat="server" CssClass="form-control w-100" ID="txtEmail" TextMode="Email" placeholder="nombre@ejemplo.com" />
                        <asp:RequiredFieldValidator ErrorMessage="El email es obligatorio." ControlToValidate="txtEmail" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgRegistro" />
                        <asp:RegularExpressionValidator ErrorMessage="Formato de email incorrecto." ControlToValidate="txtEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgRegistro" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Contraseña</label>
                        <asp:TextBox runat="server" CssClass="form-control w-100" ID="txtPassword" TextMode="Password" placeholder="••••••••" />
                        <asp:RequiredFieldValidator ErrorMessage="La contraseña es obligatoria." ControlToValidate="txtPassword" runat="server" CssClass="text-danger small" Display="Dynamic" ValidationGroup="vgRegistro" />
                    </div>

                    <asp:Label ID="lblErrorDato" runat="server" CssClass="text-danger small fw-bold mb-3 d-block text-center" Visible="false"></asp:Label>

                    <div class="d-flex justify-content-center mt-4">
                        <asp:Button Text="Registrarse" CssClass="btn btn-primary fw-bold me-2" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" ValidationGroup="vgRegistro" />
                        <a href="Default.aspx" class="btn btn-outline-secondary">Cancelar</a>
                    </div>

                    <hr class="my-4 text-secondary" />

                    <div class="text-center mt-3">
                        <span class="text-muted small">¿Ya tienes una cuenta?</span>
                        <a href="Login.aspx" class="text-decoration-none fw-bold small">Inicia sesión</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
