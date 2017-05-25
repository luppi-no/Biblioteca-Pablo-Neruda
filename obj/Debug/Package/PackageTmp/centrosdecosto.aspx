<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="centrosdecosto.aspx.cs" Inherits="Proyecto.centrosdecosto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Centros de Costo
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#centrosdecosto" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Centros de Costo</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="centrosdecosto">
                <div align="center">
                    <p class="title">
                        Búsqueda - Centros de Costo
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblNomCentroDeCosto" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbNomCentroDeCosto" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscarCentro" runat="server" OnClick="lnkbBuscarCentro_Click"
                                CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiarCentro" runat="server" OnClick="lnkbLimpiarCentro_Click"
                                CssClass="btn btn-danger btneminmedium" Visible="False"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscarCentro" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarCentro" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upCentros" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvCentros" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvCentros_PageIndexChanging"
                            AllowPaging="True" OnRowCommand="gvCentros_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDCentroCosto" HeaderText="ID">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="5%" />
                                    <ItemStyle Width="5%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCentroCosto" HeaderText="Centro">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="25%" />
                                    <ItemStyle Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="txtDescCentroCosto" HeaderText="Descripción">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="50%" />
                                    <ItemStyle Width="50%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbEdit" runat="server" CausesValidation="False" CommandName="Editar"
                                            ToolTip="Editar" CommandArgument="Editar"><span class="icon-edit"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="2%" />
                                    <ItemStyle HorizontalAlign="Center" Width="2%" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDelete" runat="server" CausesValidation="False" CommandName="Borrar"
                                            Text="" ToolTip="Borrar"><span class="icon-trash"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="2%" />
                                    <ItemStyle HorizontalAlign="Center" Width="2%" />
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
                        <asp:AsyncPostBackTrigger ControlID="gvCentros" EventName="PageIndexChanging" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscarCentro" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarCentro" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL NUEVO CENTRO COSTO =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarCC" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeCentroCosto" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pCentroCosto" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pCentroCosto" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Centro de Costo</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomCentro" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomCentro" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomCentro" ValidationGroup="vgCentroCosto" runat="server"
                                                ErrorMessage="(*)" ControlToValidate="tbNomCentro"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescCentro" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescCentro" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescCentro" ValidationGroup="vgCentroCosto" runat="server"
                                                ErrorMessage="(*)" ControlToValidate="txtaDescCentro"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lblObligatorioPeso" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarCentro" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarCentro_Click" CausesValidation="false" />
                                <asp:Button ID="btnGuardarCentro" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarCentro_Click" CausesValidation="true" ValidationGroup="vgCentroCosto" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL NUEVO CENTRO COSTO =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR CENTRO COSTO =========================================================================== -->
                <asp:UpdatePanel ID="upEditarCC" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pEditarCC" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfEditarCentro" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeEditarCentro" runat="server" BackgroundCssClass="modalBackground"
                                PopupControlID="pEditarCC" DropShadow="true" TargetControlID="hfEditarCentro">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Centro de Costo</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <asp:HiddenField ID="hfID" runat="server" />
                                        <td style="width: 20%">
                                            <asp:Label ID="lNomCentroCosto" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomCentroCosto" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomCentroCosto" ValidationGroup="vgEditCentroCosto"
                                                runat="server" ErrorMessage="(*)" ControlToValidate="tbNomCentroCosto"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lDescCentroCosto" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescCentroCosto" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescCentroCosto" ValidationGroup="vgEditCentroCosto"
                                                runat="server" ErrorMessage="(*)" ControlToValidate="txtaDescCentroCosto"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lCampos" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnEditarCerrarCentro" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnEditarCerrarCentro_Click" CausesValidation="false" />
                                <asp:Button ID="btnEditarGuardarCentro" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnEditarGuardarCentro_Click" CausesValidation="true" ValidationGroup="vgEditCentroCosto" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR CENTRO COSTO =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
