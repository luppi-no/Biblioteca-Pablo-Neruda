<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="detallecapacitacion.aspx.cs" Inherits="Proyecto.detallecapacitacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Detalle de Capacitación
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a id="inicio" runat="server" href=""><span class="icon-home"></span>&nbsp Menú
                Principal</a></li>
            <li><a id="listacapacitacion" runat="server" href=""><span class="icon-list"></span>
                &nbsp Lista de Capacitaciones</a></li>
            <li class="active"><a id="detalle" runat="server" href=""><span class="icon-list"></span>
                &nbsp Detalle</a></li>
        </ul>
    </div>
    <div class="tab-content">
        <div class="tab-pane active" id="tabDetalleCapacitacion">
            <br />
            <div id="divPrint">
                <p class="titlegrid">
                    Datos Capacitacion</p>
                <br />
                <table align="center" width="70%">
                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="lblTituloCapacitacion" runat="server" Text="Capacitacion: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCapacitacion" runat="server" Text=""></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:Label ID="lblTituloArea" runat="server" Text="Área: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblArea" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="lblTituloProveedor" runat="server" Text="Proveedor: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblProveedor" runat="server" Text=""></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:Label ID="lblTituloDesde" runat="server" Text="Fecha Desde: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDesde" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="lblTiruloHasta" runat="server" Text="Fecha Hasta: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHasta" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <p class="titlegrid">
                    Listado de Usuarios Capacitados
                </p>
                <asp:UpdatePanel ID="upDetalleCapacitacion" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvDetalleCapacitaciones" runat="server" ShowHeaderWhenEmpty="True"
                            AutoGenerateColumns="False" CellPadding="8" ForeColor="#333333" GridLines="None"
                            CssClass="grid" AllowPaging="True" Font-Size="Small" 
                            EmptyDataText="No hay participantes asignados a esta capacitacion." 
                            onrowcommand="gvDetalleCapacitaciones_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="vchRut" HeaderText="Rut">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCargo" HeaderText="Cargo">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDelete" runat="server" CausesValidation="False" CommandName="Eliminar"
                                            Text="" ToolTip="Eliminar"><span class="icon-trash"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="2%" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
