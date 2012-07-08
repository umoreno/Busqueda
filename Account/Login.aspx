<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="Account_Login" EnableTheming="true" Codebehind="Login.aspx.cs" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                ValidationGroup="LoginUserValidationGroup" />
            <div id="login-box">
                <h2>
                    Iniciar sesión</h2>
                Por favor ingresa tu nombre de usuario y contraseña. Si aun no tienes una cuenta,
                <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Registrate</asp:HyperLink>
                .
                <br />
                <div id="login-box-name" style="margin-top: 20px;">
                    Usuario:</div>
                <div id="login-box-field" style="margin-top: 20px;">
                    <asp:TextBox ID="UserName" runat="server" CssClass="form-login"></asp:TextBox><asp:RequiredFieldValidator
                        ID="UserNameRequired" runat="server" ControlToValidate="UserName" CssClass="failureNotification"
                        ErrorMessage="Required" ToolTip="User Name is required." ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator></div>
                <div id="login-box-name">
                    Contraseña:</div>
                <div id="login-box-field">
                    <asp:TextBox ID="Password" runat="server" CssClass="form-login" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                        ID="PasswordRequired" runat="server" ControlToValidate="Password" CssClass="failureNotification"
                        ErrorMessage="Required" ToolTip="Password is required." ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator></div>
                <br />
                <span class="login-box-options">
                    <asp:CheckBox ID="RememberMe" runat="server" />Recordarme <a href="PasswordRecovery.aspx"
                        style="margin-left: 30px;">Olvidaste tu contraseña?</a></span>
                <br />
                <br />
                <asp:ImageButton runat="server" SkinID="LoginButton" CommandName="Login" Text="Iniciar sesión"
                    ValidationGroup="LoginUserValidationGroup" />
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>