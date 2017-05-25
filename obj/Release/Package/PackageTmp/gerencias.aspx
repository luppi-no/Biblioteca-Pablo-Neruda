<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="gerencias.aspx.cs" Inherits="Proyecto.gerencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Gerencias
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="areas.aspx"><span class="icon-list"></span>&nbsp;Áreas</a></li>
            <li class="active"><a href="#gerencias" data-toggle="tab"><span class="icon-list"></span>
                &nbsp;Gerencias</a></li>
            <li><a href="asignarareas.aspx"><span class="icon-list"></span>&nbsp;Asignar Áreas</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="gerencias">
                <div align="center">
                    <p class="title">
                        Búsqueda - Gerencias
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblGerencia" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbGerencia" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscarGerencia" runat="server" OnClick="lnkbBuscarGerencia_Click"
                                CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiarGerencia" runat="server" OnClick="lnkbLimpiarGerencia_Click"
                                CssClass="btn btn-danger btneminmedium" Visible="False"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscarGerencia" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarGerencia" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upGerencias" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvGerencias" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvGerencias_PageIndexChanging"
                            AllowPaging="True" OnRowCommand="gvGerencias_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDGerencia" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchGerencia" HeaderText="Gerencia">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="94%" />
                                    <ItemStyle Width="94%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Editar"
                                            Text="" ToolTip="Editar"><span class="icon-edit"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="2%" />
                                    <ItemStyle HorizontalAlign="Center" Width="2%" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDelete" runat="server" CausesValidation="False" CommandName="Eliminar"
                                            Text="" ToolTip="Eliminar"><span class="icon-trash"></span></asp:LinkButton>
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
                        <asp:AsyncPostBackTrigger ControlID="gvGerencias" EventName="PageIndexChanging" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscarGerencia" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarGerencia" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL GERENCIA =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarGerencia" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeGerencias" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pGerencias" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pGerencias" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Gerencia</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomGerencia" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomGerencia" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomGerencia" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgGerencia" ControlToValidate="tbNomGerencia"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarGerencia" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarGerencia_Click" />
                                <asp:Button ID="btnGuardarGerencia" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarGerencia_Click" CausesValidation="true" ValidationGroup="vgGerencia" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL GERENCIA =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR GERENCIA =========================================================================== -->
                <asp:UpdatePanel ID="upGerenciasE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pGerenciasE" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfGerenciasE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeGerenciasE" runat="server" BackgroundCssClass="modalBackground"
                                TargetControlID="hfGerenciasE" PopupControlID="pGerenciasE" DropShadow="true">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Gerencia</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomGerenciaE" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomGerenciaE" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomGerenciaE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgGerenciaE" ControlToValidate="tbNomGerenciaE"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarGerenciaE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarGerenciaE_Click" />
                                <asp:Button ID="btnGuardarGerenciaE" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarGerenciaE_Click" CausesValidation="true" ValidationGroup="vgGerenciaE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR GERENCIA =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
