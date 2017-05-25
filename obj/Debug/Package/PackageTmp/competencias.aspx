<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="competencias.aspx.cs" Inherits="Proyecto.competencias" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Competencias
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#competencias" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Competencias</a></li>
            <li><a href="tiposdecompetencias.aspx"><span class="icon-list"></span>&nbsp;Tipo de
                Competencias</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="competencias">
                <div align="center">
                    <p class="title">
                        Búsqueda - Competencias
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblNomCompetencia" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbNomCompetencia" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscar2" runat="server" OnClick="lnkbBuscar2_Click" CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiar2" runat="server" OnClick="lnkbLimpiar2_Click" CssClass="btn btn-danger btneminmedium"
                                Visible="False"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscar2" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar2" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upCompetencias" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvCompetencias" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvCompetencias_PageIndexChanging"
                            AllowPaging="True" OnRowCommand="gvCompetencias_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDCompetencia" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCompetencia" HeaderText="Competencia">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="txtDescCompetencia" HeaderText="Descripción" />
                                <asp:BoundField DataField="dcmPeso" HeaderText="Peso" />
                                <asp:BoundField DataField="intNotaEsperada" HeaderText="Nota" />
                                <asp:BoundField DataField="vchTipoCompetencia" HeaderText="Tipo" />
                                <asp:BoundField DataField="intIDTipoCompetencia">
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
                        <asp:AsyncPostBackTrigger ControlID="gvCompetencias" EventName="RowEditing" />
                        <asp:AsyncPostBackTrigger ControlID="gvCompetencias" EventName="RowUpdating" />
                        <asp:AsyncPostBackTrigger ControlID="gvCompetencias" EventName="RowCancelingEdit" />
                        <asp:AsyncPostBackTrigger ControlID="gvCompetencias" EventName="RowDeleting" />
                        <asp:AsyncPostBackTrigger ControlID="gvCompetencias" EventName="PageIndexChanging" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscar2" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar2" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL COMPETENCIA =========================================================================== -->
                <asp:UpdatePanel ID="upCompetenciasI" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeCentroCosto" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pCompetencia" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pCompetencia" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Competencia</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCompetencia" runat="server" Text="* Competencia:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbCompetencia" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvCompetencia" ValidationGroup="vgCompetencias"
                                                runat="server" ErrorMessage="(*)" ControlToValidate="tbCompetencia"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescCompetencia" runat="server" Text="* Descripción" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescCompetencia" runat="server" cols="20" rows="2" style="width: 100%"
                                                class="lock" placeholder="Ingresar Descripción"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescCompetencia" ValidationGroup="vgCompetencias"
                                                runat="server" ErrorMessage="(*)" ControlToValidate="txtaDescCompetencia"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblPesoCompetencia" runat="server" Text="* Peso" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <telerik:RadMaskedTextBox ID="tbPesoCompetencia" runat="server" Mask="##,##" Width="100%"
                                                SelectionOnFocus="CaretToBeginning">
                                            </telerik:RadMaskedTextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPesoCompetencia" runat="server"
                                                ErrorMessage="(*)" ControlToValidate="tbPesoCompetencia" ValidationGroup="vgCompetencias"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator Display="Dynamic" ID="revPesoCompetencia" ValidationExpression="\d{2},\d{2}"
                                                ValidationGroup="vgCompetencias" runat="server" ErrorMessage="(*)" ControlToValidate="tbPesoCompetencia"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNotaEsperada" runat="server" Text="Nota:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlNotaEsperada" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblTipoCompetencia2" runat="server" Text="Tipo" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlTipo2" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="Label4" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarCompetencia" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarCompetencia_Click" CausesValidation="false" />
                                <asp:Button ID="btnGuardarCompetencia" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarCompetencia_Click" CausesValidation="true" ValidationGroup="vgCompetencias" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL COMPETENCIA =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR COMPETENCIA =========================================================================== -->
                <asp:UpdatePanel ID="upEditarCompetencia" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pEditarCompetencia" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfEditarCompetencia" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeEditarCompetencia" runat="server" BackgroundCssClass="modalBackground"
                                PopupControlID="pEditarCompetencia" DropShadow="true" TargetControlID="hfEditarCompetencia">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Competencia</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCompetenciaE" runat="server" Text="* Competencia:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbCompetenciaE" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvCompetenciaE" ValidationGroup="vgCompetenciasE"
                                                runat="server" ErrorMessage="(*)" ControlToValidate="tbCompetenciaE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescCompetenciaE" runat="server" Text="* Descripción" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescCompetenciaE" runat="server" cols="20" rows="2" style="width: 100%"
                                                class="lock" placeholder="Ingresar Descripción"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescCompetenciaE" ValidationGroup="vgCompetenciasE"
                                                runat="server" ErrorMessage="(*)" ControlToValidate="txtaDescCompetenciaE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblPesoCompetenciaE" runat="server" Text="* Peso" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <telerik:RadMaskedTextBox ID="tbPesoCompetenciaE" runat="server" Mask="##,##" Width="100%"
                                                SelectionOnFocus="CaretToBeginning">
                                            </telerik:RadMaskedTextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPesoCompetenciaE" runat="server"
                                                ErrorMessage="(*)" ControlToValidate="tbPesoCompetenciaE" ValidationGroup="vgCompetenciasE"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator Display="Dynamic" ID="revPesoCompetenciaE" ValidationExpression="\d{2},\d{2}"
                                                ValidationGroup="vgCompetenciasE" runat="server" ErrorMessage="(*)" ControlToValidate="tbPesoCompetenciaE"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNotaEsperadaE" runat="server" Text="Nota:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlNotaEsperadaE" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblTipoCompetencia2E" runat="server" Text="Tipo" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlTipo2E" runat="server" Width="100%" Enabled="false">
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
                                <asp:Button ID="btnCerrarCompetenciaE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarCompetenciaE_Click" CausesValidation="false" />
                                <asp:Button ID="btnGuardarCompetenciaE" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarCompetenciaE_Click" CausesValidation="true" ValidationGroup="vgCompetenciasE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR COMPETENCIA =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
