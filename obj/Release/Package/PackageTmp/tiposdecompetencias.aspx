<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="tiposdecompetencias.aspx.cs" Inherits="Proyecto.tiposdecompetencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Tipo de Competencias
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="competencias.aspx"><span class="icon-list"></span>&nbsp;Competencias</a></li>
            <li class="active"><a href="#tiposcompetencias" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Tipo de Competencias</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="tiposcompetencias">
                <div align="center">
                    <p class="title">
                        Búsqueda - Tipo de Competencias
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblNomTipo" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbTipo" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
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
                <asp:UpdatePanel ID="upTiposCompetencias" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvTiposCompetencias" runat="server" ShowHeaderWhenEmpty="True"
                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                            CssClass="grid" AllowPaging="True" OnPageIndexChanging="gvTiposCompetencias_PageIndexChanging"
                            OnRowCommand="gvTiposCompetencias_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDTipoCompetencia" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchTipoCompetencia" HeaderText="Tipo de Competencia" />
                                <asp:BoundField DataField="txtDescTipoCompetencia" HeaderText="Descripción" />
                                <asp:BoundField DataField="vchCatCompetencia" HeaderText="Categoría" ReadOnly="True">
                                </asp:BoundField>
                                <asp:BoundField DataField="intIDCatCompetencia">
                                    <ControlStyle CssClass="hide" />
                                    <FooterStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
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
                        <asp:AsyncPostBackTrigger ControlID="gvTiposCompetencias" EventName="PageIndexChanging" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL TIPO COMPETENCIA =========================================================================== -->
                <asp:UpdatePanel ID="upTipoCompetenciaI" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeTipoCompetencia" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pTipoCompetencia" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pTipoCompetencia" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Tipo de Competencia</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblTipoCompetencia" runat="server" Text="* Tipo:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbTipoCompetencia" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvTipoCompetencia" runat="server" ControlToValidate="tbTipoCompetencia"
                                                ErrorMessage="(*)" ValidationGroup="vgTipoCompetencia"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescTipoCompetencia" runat="server" Text="* Descripción" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescTipoCompetencia" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescTipoCompetencia" runat="server" ControlToValidate="txtaDescTipoCompetencia"
                                                ErrorMessage="(*)" ValidationGroup="vgTipoCompetencia"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCatCompetencia" runat="server" Text="* Categoría" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlCatCompetencia" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
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
                                <asp:Button ID="btnCerrarTipoCompetencia" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarTipoCompetencia_Click" CausesValidation="false" />
                                <asp:Button ID="btnGuardarTipoCompetencia" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarTipoCompetencia_Click" CausesValidation="true" ValidationGroup="vgTipoCompetencia" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL TIPO COMPETENCIA =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR TIPO COMPETENCIA =========================================================================== -->
                <asp:UpdatePanel ID="upTipoCompetenciaE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pTipoCompetenciaE" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfTipoCompetenciaE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeTipoCompetenciaE" runat="server" BackgroundCssClass="modalBackground"
                                TargetControlID="hfTipoCompetenciaE" PopupControlID="pTipoCompetenciaE" DropShadow="true">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Tipo de Competencia</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblTipoCompetenciaE" runat="server" Text="* Tipo:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbTipoCompetenciaE" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvTipoCompetenciaE" runat="server" ControlToValidate="tbTipoCompetenciaE"
                                                ErrorMessage="(*)" ValidationGroup="vgTipoCompetenciaE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescTipoCompetenciaE" runat="server" Text="* Descripción" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescTipoCompetenciaE" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescTipoCompetenciaE" runat="server" ControlToValidate="txtaDescTipoCompetenciaE"
                                                ErrorMessage="(*)" ValidationGroup="vgTipoCompetenciaE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCatCompetenciaE" runat="server" Text="Categoría" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlCatCompetenciaE" runat="server" Width="100%" Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="Label1" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarTipoCompetenciaE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarTipoCompetenciaE_Click" CausesValidation="false" />
                                <asp:Button ID="btnGuardarTipoCompetenciaE" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarTipoCompetenciaE_Click" CausesValidation="true" ValidationGroup="vgTipoCompetenciaE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR TIPO COMPETENCIA =========================================================================== -->
                <br />
            </div>
        </div>
    </div>
</asp:Content>
