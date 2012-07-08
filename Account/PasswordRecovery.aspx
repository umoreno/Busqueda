<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="Account_PasswordRecovery" Codebehind="PasswordRecovery.aspx.cs" %>


<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
  
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" 
        UserNameFailureText="No se encontro el usuario.">
        <UserNameTemplate>
            <table border="0" cellpadding="1">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                            <td align="center" colspan="2">
                                Recuperar Password</td>
                            </tr>
                            <tr>
                            <td align="center" colspan="2">
                                Introduce tu nombre de usuario para recibir tu password a tu cuenta de correo registrada.</td>
                            </tr>
                            <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label></td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                ErrorMessage="Nombre de usuario requerido." ToolTip="Nombre de usuario requerido." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                            </td>
                            </tr>
                            <tr>
                            <td align="center" colspan="2" style="color: red">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                            </tr>
                            <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Recuperar Password" ValidationGroup="PasswordRecovery1" />
                            </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </UserNameTemplate>
       <MailDefinition  
        Subject="Nuevo Password"
    BodyFileName="pMail.txt" />
    </asp:PasswordRecovery>
</asp:Content>

