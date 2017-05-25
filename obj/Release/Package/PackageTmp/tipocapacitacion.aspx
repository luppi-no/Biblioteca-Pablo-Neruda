<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="tipocapacitacion.aspx.cs" Inherits="Proyecto.tipocapacitacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Tipo de Capacitaciones
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="iniciocapacitacion.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="capacitaciones.aspx"><span class="icon-list"></span>&nbsp;Capacitaciones</a></li>
            <li class="active"><a href="#tipocapacitacion" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Tipo de Capacitaciones</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="tipoCapacitaciones">
                <div align="center">
                    <p class="title">
                        Búsqueda - Tipo de Capacitaciones
                    </p>
                    <asp:UpdatePanel ID="upTipoCapacitaciones" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblTipoCapacitaciones" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbTipoCapacitaciones" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscar" runat="server" OnClick="lnkbBuscar_Click" CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiar" runat="server" OnClick="lnkbLimpiar_Click" CssClass="btn btn-danger btneminmedium"
                                Visible="False"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upTiposCapacitacion" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvTiposCapacitacion" runat="server" ShowHeaderWhenEmpty="True"
                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                            CssClass="grid" AllowPaging="True" OnPageIndexChanging="gvTiposCapacitacion_PageIndexChanging"
                            OnRowCommand="gvTiposCapacitacion_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIdTipoCapacitacion" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchTipoCapacitacion" HeaderText="Tipo de Capacitación" />
                                <asp:BoundField DataField="txtDescripcion" HeaderText="Descripción" />
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
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL TIPO CAPACITACION =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarTipoCapacitacion" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" class="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeTipoCapacitacion" runat="server" DropShadow="true"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pTipoCapacitacion" BackgroundCssClass="modalBackground" />
                        <asp:Panel ID="pTipoCapacitacion" runat="server" Style="display: none" CssClass="modalPopup">
                            <div class="header">
                                <p class="title">Ingreso Tipo de Capacitación</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblTipoCompetencia" runat="server" Text="* Tipo Capacitación:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%;">
                                            <asp:TextBox ID="tbTipoCapacitacion" runat="server" Width="100%" placeholder="Ingrese Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvTipoCapacitacion" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgTipoCapacitacion" ControlToValidate="tbTipoCapacitacion"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescTipoCapacitacion" runat="server" Text="* Descripción" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescTipoCapacitacion" runat="server" cols="20" rows="2" style="width: 100%"
                                                class="lock" placeholder="Ingrese Descripción"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescTipoCapacitacion" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgTipoCapacitacion" ControlToValidate="txtaDescTipoCapacitacion"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarTipoCapacitaciones" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                    OnClick="btnCerrarTipoCapacitaciones_Click" />
                                <asp:Button ID="btnGuardarTipoCapacitaciones" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarTipoCapacitaciones_Click" CausesValidation="true" ValidationGroup="vgTipoCapacitacion" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL TIPO CAPACITACION =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR TIPO CAPACITACION =========================================================================== -->
                <asp:UpdatePanel ID="upTipoCapacitacionE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pTipoCapacitacionE" runat="server" Style="display: none" CssClass="modalPopup">
                            <asp:HiddenField ID="hfTipoCapacitacionE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeTipoCapacitacionE" runat="server" DropShadow="true"
                                TargetControlID="hfTipoCapacitacionE" PopupControlID="pTipoCapacitacionE" BackgroundCssClass="modalBackground" />
                            <div class="header">
                                <p class="title">
                                    Edición Tipo de Capacitación</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblTipoCompetenciaE" runat="server" Text="* Tipo Capacitación:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%;">
                                            <asp:TextBox ID="tbTipoCapacitacionE" runat="server" Width="100%" placeholder="Ingrese Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvTipoCapacitacionE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgTipoCapacitacionE" ControlToValidate="tbTipoCapacitacionE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescTipoCapacitacionE" runat="server" Text="* Descripción" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescTipoCapacitacionE" runat="server" cols="20" rows="2" style="width: 100%"
                                                class="lock" placeholder="Ingrese Descripción"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescTipoCapacitacionE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgTipoCapacitacionE" ControlToValidate="txtaDescTipoCapacitacionE"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarTipoCapacitacionesE" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                    OnClick="btnCerrarTipoCapacitacionesE_Click" />
                                <asp:Button ID="btnGuardarTipoCapacitacionesE" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarTipoCapacitacionesE_Click" CausesValidation="true" ValidationGroup="vgTipoCapacitacionE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR TIPO CAPACITACION =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
