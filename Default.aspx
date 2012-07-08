<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="_Default" Codebehind="Default.aspx.cs" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2 style="margin-left: 40px">
        Bienvenidos a Riesgo Laboral!
    </h2>
    <p>
        Si ya eres un miembro Haz click en la opcion Log in para acceder a la aplicacion inmediatamente, de lo contrario te invitamos a que te registres.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Registrate</asp:HyperLink>
    </p>
    <p>

    </p>
</asp:Content>
