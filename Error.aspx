<%@ Page Title="Hubo un problema" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TPFinalNivel3_Castro.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">

                <h1 class="display-1 text-danger fw-bold">⚠️</h1>
                <h2 class="mb-4">¡Ups! Algo salió mal...</h2>

                <p class="lead">Lo sentimos, la aplicación encontró un problema inesperado.</p>

                <div class="alert alert-danger text-start mt-4" role="alert" style="overflow-wrap: break-word;">
                    <strong>Detalle del error:</strong><br />
                    <asp:Label ID="lblMensajeError" runat="server" Text="Error desconocido."></asp:Label>
                </div>

                <div class="mt-4">
                    <a href="Default.aspx" class="btn btn-primary btn-lg">Volver al Inicio</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
