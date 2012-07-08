<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="Search" Codebehind="Search.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1"
        runat="server" />
    <asp:UpdatePanel ID="updExternal" runat="server">
        <ContentTemplate>
            <div id="divControlContainer" runat="server"></div> 
            <input id="dummy" type="button" style="display: none" runat="server" /> 
            <asp:ModalPopupExtender ID="MPESearchNames" runat="server" TargetControlID="dummy"
                PopupControlID="PanelSearchNames" DropShadow="true" OkControlID="btnBuscar"
                CancelControlID="btnCancelar" PopupDragHandleControlID="Panel3" 
                BackgroundCssClass="modalBackground">
            </asp:ModalPopupExtender>
            <asp:Panel ID="PanelSearchNames" runat="server" CssClass="modalPopup">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="search">
                            <asp:ListView ID="lvDynamicTextboxes" runat="server" 
                                            ItemPlaceholderID="itemPlaceholder" 
                                            onitemdatabound="lvDynamicTextboxes_ItemDataBound">

                                <LayoutTemplate>
                                    <table style="width: 50%" class="permissions">
                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr class="top">
                                        <td>
                                            Nombre:
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtName" runat="server" Width="90%">
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                </asp:ListView> 
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddTextBox" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                        </Triggers> 
                    </asp:UpdatePanel>
                <asp:Button ID="btnAddTextBox" runat="server" 
                    Text="Add" onclick="btnAddTextBox_Click" />
                    <asp:Button ID="btnBuscar" runat="server" 
                    Text="Buscar" onclick="btn_OnClick" />
                    <asp:Button ID="btnCancelar" runat="server" 
                    Text="Cancelar" onclick="btnAddTextBox_Click" />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Table ID="Table1" runat="server" Width="100%">
        <asp:TableRow>
            <asp:TableCell> 
                <table style="width:100%;">
                    <tr><td>Usted tiene <a title="8">Consultas disponibles</a>.</td></tr>
                    <tr><td>
                        <asp:Button ID="btnConsulta" runat="server" Text="Consultar" OnClick="btnConsulta_Click"/></td></tr>
                </table>       
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <div class="results">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               <asp:GridView ID="grdMaster" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyNames="rowID"  BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="1" CssClass="th" PagerStyle-CssClass="note" >
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" CssClass="note" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" /><Columns>
                        <asp:BoundField DataField="rowID" HeaderText="Head" InsertVisible="False"
                            ReadOnly="True" SortExpression="MasterID" >
                            <ItemStyle CssClass="td00" />
                        </asp:BoundField>
                        <asp:BoundField DataField="staffMemberName" HeaderText="Nombre" SortExpression="staffMemberName" >
                            <ItemStyle CssClass="td00" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Child Rows">
                            <ItemStyle CssClass="td00" /><ItemTemplate>
                                <asp:GridView ID="grdChildGridNormal" runat="server" AutoGenerateColumns="False" DataKeyNames="ChildIndex"
                                     AllowPaging="True" AllowSorting="True"  BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" PageSize="5" >
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                    <Columns>
                                        <asp:BoundField DataField="ChildIndex" HeaderText="ChildTableID" InsertVisible="False"
                                            ReadOnly="True" SortExpression="ChildTableID" />
                                        <asp:BoundField DataField="id_expediente" HeaderText="Expediente" SortExpression="id_expediente" />
                                        <asp:BoundField DataField="Num_expediente" HeaderText="Numero de Expediente" SortExpression="Num_expediente" />
                                        <asp:BoundField  DataField="año" HeaderText="Año" SortExpression="año" />
                                        <asp:BoundField  DataField="Desc_junta" HeaderText="Junta" SortExpression="Desc_junta" />
                                        <asp:BoundField  DataField="nom_actor" HeaderText="Nombre del Actor" SortExpression="nom_actor" />
                                        <asp:BoundField  DataField="Desc_demandado" HeaderText="Demandado" SortExpression="Desc_demandado" />
                                    </Columns>
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                </asp:GridView>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </ContentTemplate>
        </asp:UpdatePanel>
     </div>
</asp:Content>


