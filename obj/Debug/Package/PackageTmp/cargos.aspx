<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="cargos.aspx.cs" Inherits="Proyecto.cargos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Cargos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#cargos" data-toggle="tab"><span class="icon-list"></span>
                &nbsp;Cargos</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="cargos">
                <div align="center">
                    <p class="title">
                        Búsqueda - Cargos
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblCargo" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbCargo" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscarCargo" runat="server" OnClick="lnkbBuscarCargo_Click"
                                CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiarCargo" runat="server" OnClick="lnkbLimpiarCargo_Click"
                                CssClass="btn btn-danger btneminmedium" Visible="False"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscarCargo" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarCargo" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upCargos" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvCargos" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvCargos_PageIndexChanging"
                            AllowPaging="True" OnRowCommand="gvCargos_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDCargo" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCargo" HeaderText="Cargo">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="25%" />
                                    <ItemStyle Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="txtDescCargo" HeaderText="Descripción">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="50%" />
                                    <ItemStyle Width="50%" />
                                </asp:BoundField>
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
                        <asp:AsyncPostBackTrigger ControlID="gvCargos" EventName="PageIndexChanging" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscarCargo" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarCargo" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL CARGO =========================================================================== -->
                <asp:UpdatePanel ID="upCargosI" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeCargos" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pCargo" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pCargo" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Cargo</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomCargo" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomCargo" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomCargo" runat="server" ErrorMessage="(*)" ValidationGroup="vgCargo"
                                                ControlToValidate="tbNomCargo"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescCargo" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescCargo" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescCargo" runat="server" ErrorMessage="(*)" ValidationGroup="vgCargo"
                                                ControlToValidate="txtaDescCargo"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarCargo" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarCargo_Click" />
                                <asp:Button ID="btnGuardarCargo" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarCargo_Click" CausesValidation="true" ValidationGroup="vgCargo" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL CARGO =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR CARGO =========================================================================== -->
                <asp:UpdatePanel ID="upCargoE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pCargoE" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfCargoE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeCargoE" runat="server" BackgroundCssClass="modalBackground"
                                TargetControlID="hfCargoE" PopupControlID="pCargoE" DropShadow="true">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Cargo</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomCargoE" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomCargoE" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomCargoE" runat="server" ErrorMessage="(*)" ValidationGroup="vgCargoE"
                                                ControlToValidate="tbNomCargoE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescCargoE" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescCargoE" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescCargoE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCargoE" ControlToValidate="txtaDescCargoE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lblObligatorioPesoE" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarCargoE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarCargoE_Click" />
                                <asp:Button ID="btnGuardarCargoE" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarCargoE_Click" CausesValidation="true" ValidationGroup="vgCargoE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR CARGO =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
