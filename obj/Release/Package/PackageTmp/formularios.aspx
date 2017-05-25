<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="formularios.aspx.cs" Inherits="Proyecto.formularios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Formularios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#formularios" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Formularios</a></li>
            <li><a href="asignarcompetencias.aspx"><span class="icon-list"></span>&nbsp;Asignar
                Competencias</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="formularios">
                <div align="center">
                    <p class="title">
                        Búsqueda - Formularios
                    </p>
                    <asp:UpdatePanel ID="upFormulario" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblFormulario" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbFormulario" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscarFormulario" runat="server" OnClick="lnkbBuscarFormulario_Click"
                                CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiarFormulario" runat="server" OnClick="lnkbLimpiarFormulario_Click"
                                CssClass="btn btn-danger btneminmedium" Visible="false"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscarFormulario" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarFormulario" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upFormularios" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvFormularios" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvFormularios_PageIndexChanging"
                            AllowPaging="True" OnRowCommand="gvFormularios_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDFormulario" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchFormulario" HeaderText="Formulario">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="25%" />
                                    <ItemStyle Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="txtDescFormulario" HeaderText="Descripción">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="50%" />
                                    <ItemStyle Width="50%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbEdit" runat="server" CausesValidation="False" CommandName="Editar"
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
                        <asp:AsyncPostBackTrigger ControlID="gvFormularios" EventName="RowEditing" />
                        <asp:AsyncPostBackTrigger ControlID="gvFormularios" EventName="RowUpdating" />
                        <asp:AsyncPostBackTrigger ControlID="gvFormularios" EventName="RowCancelingEdit" />
                        <asp:AsyncPostBackTrigger ControlID="gvFormularios" EventName="RowDeleting" />
                        <asp:AsyncPostBackTrigger ControlID="gvFormularios" EventName="PageIndexChanging" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL FORMULARIOS =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarFormulario" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeFormulario" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pFormulario" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pFormulario" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Formulario</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomFormulario" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomFormulario" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomFormulario" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgFormulario" ControlToValidate="tbNomFormulario"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescFormulario" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescFormulario" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescFormulario" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgFormulario" ControlToValidate="txtaDescFormulario"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarFormulario" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarFormulario_Click" />
                                <asp:Button ID="btnGuardarFormulario" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarFormulario_Click" CausesValidation="true" ValidationGroup="vgFormulario" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL FORMULARIOS =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR FORMULARIOS =========================================================================== -->
                <asp:UpdatePanel ID="upFormularioE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pFormularioE" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfFormularioE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeFormularioE" runat="server" BackgroundCssClass="modalBackground"
                                TargetControlID="hfFormularioE" PopupControlID="pFormularioE" DropShadow="true">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Formulario</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomFormularioE" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomFormularioE" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomFormularioE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgFormularioE" ControlToValidate="tbNomFormularioE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescFormularioE" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescFormularioE" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescFormularioE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgFormularioE" ControlToValidate="txtaDescFormularioE"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarFormularioE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarFormularioE_Click" />
                                <asp:Button ID="btnGuardarFormularioE" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarFormularioE_Click" CausesValidation="true" ValidationGroup="vgFormularioE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR FORMULARIOS =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
