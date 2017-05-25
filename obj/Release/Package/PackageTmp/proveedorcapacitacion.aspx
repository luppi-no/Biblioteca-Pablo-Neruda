<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="proveedorcapacitacion.aspx.cs" Inherits="Proyecto.proveedorcapacitacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Asignar Capacitación
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="iniciocapacitacion.aspx"><span class="icon-home"></span>&nbsp;Menú Capacitaciones</a></li>
            <li><a href="proveedores.aspx"><span class="icon-list"></span>&nbsp;Proveedores</a></li>
            <li class="active"><a href="#proveedorcapacitacion" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Asignar Capacitación</a></li>
        </ul>
        <br />
        <div class="tab-pane" id="asignarcapacitaciones">
            <table width="50%">
                <tr>
                    <td colspan="2">
                        <p class="title">
                            Asignación - Proveedor/Capacitación
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="width: 40%">
                        <asp:Label ID="lblAsigProveedor" runat="server" Text="Proveedor"></asp:Label>
                    </td>
                    <td style="width: 60%">
                        <asp:DropDownList ID="ddlProveedor" runat="server" AppendDataBoundItems="true" Width="100%"
                            OnSelectedIndexChanged="ddlProveedor_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="0" Text="Seleccione Proveedor"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <p class="title">
                Capacitación Asignadas por Proveedor</p>
            <asp:UpdatePanel ID="upCapacitacion" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvCapacitacion" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                        CellPadding="5" ForeColor="#333333" GridLines="None" CssClass="grid" AllowPaging="True"
                        PageSize="100" EmptyDataText="No hay capacitaciones asociadas." OnDataBound="gvCapacitacion_DataBound"
                        Font-Size="Small">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="existe">
                                <ControlStyle CssClass="hide" />
                            <FooterStyle CssClass="hide" />
                                <HeaderStyle Width="20%" CssClass="hide" />
                                <ItemStyle Width="20%" CssClass="hide" />
                            </asp:BoundField>
                            <asp:BoundField DataField="intIDCapacitacion">
                                <HeaderStyle CssClass="hide" />
                                <ItemStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vchCapacitacion" HeaderText="Competencia">
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dtmDesde" HeaderText="Desde">
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dtmHatas" HeaderText="Hasta">
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="proveedor">
                                <HeaderStyle CssClass="hide" />
                                <ItemStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="¿Asignar?">
                                <ItemTemplate>
                                    <asp:CheckBox ID="rb1" runat="server" GroupName="Asignacion" 
                                        oncheckedchanged="rb1_CheckedChanged" AutoPostBack="true" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="mid" Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <br />
                    <br />
                    <div align="center">
                        <asp:Button ID="btnVolver" runat="server" Text="Volver" 
                            CssClass="btn btn-default btneminmedium" onclick="btnVolver_Click" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlProveedor" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
