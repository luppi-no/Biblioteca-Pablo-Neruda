<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="proveedores.aspx.cs" Inherits="Proyecto.proveedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Proveedores
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="iniciocapacitacion.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#proveedores" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Proveedores</a></li>
            <li><a href="proveedorcapacitacion.aspx"><span class="icon-list"></span>&nbsp;Asignar
                Capacitación</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="proveedores">
                <div align="center">
                    <p class="title">
                        Búsqueda - Proveedores
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblNomProveedor" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbNomProveedor" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscar" runat="server" OnClick="lnkbBuscar_Click" CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiar" runat="server" OnClick="lnkbLimpiar_Click" CssClass="btn btn-danger btneminmedium"
                                Visible="false"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upProveedores" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvProveedores" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" AllowPaging="True"
                            OnPageIndexChanging="gvProveedor_PageIndexChanging" OnRowCommand="gvProveedores_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDProveedor" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchProveedor" HeaderText="Proveedor" />
                                <asp:BoundField DataField="txtDescripcionProveedor" HeaderText="Descripción" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbEdit" runat="server" CausesValidation="False" CommandName="Editar"
                                            Text="" ToolTip="Editar"><span class="icon-edit"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="2%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDelete" runat="server" CausesValidation="False" CommandName="Eliminar"
                                            Text="" ToolTip="Eliminar"><span class="icon-trash"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="2%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
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
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvProveedores" EventName="PageIndexChanging" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL PROVEEDOR =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarProveedor" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" class="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeProveedor" runat="server" DropShadow="true"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pProveedor" BackgroundCssClass="modalBackground" />
                        <asp:Panel ID="pProveedor" runat="server" Style="display: none" CssClass="modalPopup">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Proveedor</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblProveedor" runat="server" Text="* Proveedor:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%;">
                                            <asp:TextBox ID="tbProveedor" runat="server" Width="100%" placeholder="Ingrese Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvProveedor" runat="server" ErrorMessage="(*)" ValidationGroup="vgProveedor"
                                                ControlToValidate="tbProveedor"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescProveedor" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescProveedor" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingrese Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescProveedor" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgProveedor" ControlToValidate="txtaDescProveedor"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lblObligatorio" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarProveedor" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                    OnClick="btnCerrarProveedor_Click" />
                                <asp:Button ID="btnGuardarProveedor" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarProveedor_Click" CausesValidation="true" ValidationGroup="vgProveedor" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL PROVEEDOR =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR PROVEEDOR =========================================================================== -->
                <asp:UpdatePanel ID="upProveedorE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pProveedorE" runat="server" Style="display: none" CssClass="modalPopup">
                            <asp:HiddenField ID="hfProveedorE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeProveedorE" runat="server" DropShadow="true"
                                TargetControlID="hfProveedorE" PopupControlID="pProveedorE" BackgroundCssClass="modalBackground" />
                            <div class="header">
                                <p class="title">
                                    Edición de Proveedor</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblProveedorE" runat="server" Text="* Proveedor:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%;">
                                            <asp:TextBox ID="tbProveedorE" runat="server" Width="100%" placeholder="Ingrese Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvProveedorE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgProveedorE" ControlToValidate="tbProveedorE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescProveedorE" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescProveedorE" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingrese Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescProveedorE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgProveedorE" ControlToValidate="txtaDescProveedorE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lblObligatorioE" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarProveedorE" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                    OnClick="btnCerrarProveedorE_Click" />
                                <asp:Button ID="btnGuardarProveedorE" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarProveedorE_Click" CausesValidation="true" ValidationGroup="vgProveedorE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR PROVEEDOR =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
