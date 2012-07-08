<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="RiesgoLaboral.Account.UserDetails" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
            <div class="inputform">
                <div class="Kartris-DetailsView">
                Modificar detalles
                <br />
                &nbsp;<div class="Kartris-DetailsView-Data">
                        <ul>
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Table runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li><span >
                                                        <asp:Label ID="lblFirstName" runat="server" EnableViewState="false" Text="Nombre" AssociatedControlID="txtFirstName" /></span></li>
                                                </asp:TableCell>                                
                                                <asp:TableCell>
                                                        <span
                                                            class="Kartris-DetailsView-Value">
                                                            <asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox></span>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                      <li><span >
                                                        <asp:Label ID="lblLastPName" runat="server" Text="Apellido Paterno" EnableViewState="false"
                                                            AssociatedControlID="txtLastPName" CssClass="requiredfield" /></span></li>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                        <span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox ID="txtLastPName" runat="server"></asp:TextBox>
                                                                </span>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li><span >
                                                        <asp:Label ID="lblLastMName" runat="server" Text="Apellido Materno" EnableViewState="false"
                                                            AssociatedControlID="txtLastMName" /></span>
                                                </asp:TableCell>
                                                <asp:TableCell>                                    
                                                            <span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox runat="server" ID="txtLastMName"></asp:TextBox></span></li>
                                                </asp:TableCell>
                                            </asp:TableRow> 
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li><span >
                                                        <asp:Label ID="lblCompany" runat="server" Text="Compañia" EnableViewState="false"
                                                            AssociatedControlID="txtCompany" CssClass="requiredfield" /></span></li>
                                                            </asp:TableCell><asp:TableCell>
                                                            <span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox runat="server" ID="txtCompany"></asp:TextBox>
                                                                </span>
                                                        </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li><span >
                                                        <asp:Label ID="lblStreet" runat="server" Text="Direccion" EnableViewState="false"
                                                            AssociatedControlID="txtAddress" CssClass="requiredfield" /></span>
                                                            </li>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox runat="server" ID="txtAddress"></asp:TextBox>
                                                                </span>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li><span >
                                                        <asp:Label ID="Label1" runat="server" Text="Colonia" EnableViewState="false"
                                                            AssociatedControlID="txtColonia" CssClass="requiredfield" /></span>
                                                            </li>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox runat="server" ID="txtColonia"></asp:TextBox>
                                                                </span>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li><span >
                                                        <asp:Label ID="lblCity" runat="server" Text="Ciudad" EnableViewState="false"
                                                            AssociatedControlID="txtCity" CssClass="requiredfield" /></span>
                                                            </li>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox runat="server" ID="txtCity"></asp:TextBox>
                                                                </span>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li><span >
                                                        <asp:Label ID="lblCountyState" runat="server" Text="Estado" EnableViewState="false"
                                                            AssociatedControlID="txtState" CssClass="requiredfield" /></span>
                                                            </li>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            <span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox runat="server" ID="txtState"></asp:TextBox>
                                                                </span>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li><span >
                                                        <asp:Label ID="lblPostcode" runat="server" Text="Codigo Postal" EnableViewState="false"
                                                            AssociatedControlID="txtZipCode" /></span></li>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            <span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox runat="server" ID="txtZipCode" CssClass="postcode"></asp:TextBox>
                                                                </span>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <li>
                                                        <asp:Label ID="lblPhone" runat="server" Text="Telefono" EnableViewState="false"
                                                            AssociatedControlID="txtPhone" CssClass="requiredfield" /></li></asp:TableCell>
                                                            <asp:TableCell><span class="Kartris-DetailsView-Value">
                                                                <asp:TextBox runat="server" ID="txtPhone" CssClass="phone"></asp:TextBox>
                                                                </span>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                    </asp:Table>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar perfil" 
                                            onclick="Button1_Click"/>                            
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ul>
                    </div>
                </div>
            </div>
</asp:Content>