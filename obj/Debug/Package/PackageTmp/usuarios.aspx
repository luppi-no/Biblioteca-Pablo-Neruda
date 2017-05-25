<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="usuarios.aspx.cs" Inherits="Proyecto.usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Usuarios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#usuarios" data-toggle="tab"><span class="icon-list"></span>
                &nbsp;Usuarios</a></li>
            <li><a href="asignarevaluadores.aspx"><span class="icon-list"></span>&nbsp;Asignar Evaluadores</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="usuarios">
                <div align="center">
                    <p class="title">
                        Búsqueda - Usuarios
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblUsuario" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbUsuario" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscarUsuario" runat="server" OnClick="lnkbBuscarUsuario_Click"
                                CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiarUsuario" runat="server" OnClick="lnkbLimpiarUsuario_Click"
                                CssClass="btn btn-danger btneminmedium" Visible="False"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscarUsuario" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarUsuario" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upUsuarios" runat="server">
                    <ContentTemplate>
                        <p class="titlegrid">
                            Listado de Usuarios</p>
                        <asp:GridView ID="gvUsuarios" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" Font-Size="Small"
                            OnRowCommand="gvUsuarios_RowCommand" AllowPaging="True" PageSize="15" OnPageIndexChanging="gvUsuarios_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="vchRut" HeaderText="Rut">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchNombre" HeaderText="Nombre">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchApePat" HeaderText="ApePat">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchApeMat" HeaderText="ApeMat">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="nombre" HeaderText="Usuario" />
                                <asp:BoundField DataField="vchMail" HeaderText="Mail" />
                                <asp:BoundField DataField="intIDArea" HeaderText="IDArea">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchArea" HeaderText="Área" />
                                <asp:BoundField DataField="intIDCargo" HeaderText="IDCargo">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCargo" HeaderText="Cargo" />
                                <asp:BoundField DataField="intIDCentroCosto" HeaderText="IDCentroCosto">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCentroCosto" HeaderText="Centro Costo" />
                                <asp:BoundField DataField="intIDFormulario" HeaderText="IDFormulario">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchFormulario" HeaderText="Formulario" />
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
                                            Text="" ToolTip="Borrar"><span class="icon-trash"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="2%" />
                                    <ItemStyle HorizontalAlign="Center" Width="2%" />
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
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscarUsuario" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarUsuario" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL USUARIO =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarUsuario" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeUsuarios" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pUsuarios" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pUsuarios" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Usuario</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblRutUsuario" runat="server" Text="* Rut:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbRutUsuario" runat="server" Width="100%" placeholder="Ingresar Rut"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvRutUsuario" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgUsuario" ControlToValidate="tbRutUsuario"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomUsuario" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomUsuario" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomUsuario" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgUsuario" ControlToValidate="tbNomUsuario"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblApePatUsuario" runat="server" Text="* A. Paterno:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbApePatUsuario" runat="server" Width="100%" placeholder="Ingresar Apellido Paterno"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvApePatUsuario" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgUsuario" ControlToValidate="tbApePatUsuario"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblApeMatUsuario" runat="server" Text="* A. Materno:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbApeMatUsuario" runat="server" Width="100%" placeholder="Ingresar Apellido Materno"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvApeMatUsuario" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgUsuario" ControlToValidate="tbApeMatUsuario"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblMail" runat="server" Text="* e-Mail:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbMail" runat="server" Width="100%" placeholder="Ingresar e-Mail"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvMail" runat="server" ErrorMessage="(*)" ValidationGroup="vgUsuario"
                                                ControlToValidate="tbMail"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblArea" runat="server" Text="Área:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlArea" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCargo" runat="server" Text="Cargo:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlCargos" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCentro" runat="server" Text="Centro:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlCentro" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblFormulario" runat="server" Text="Formulario:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlFormulario" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
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
                                <asp:Button ID="btnCerrarUsuario" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarUsuario_Click" />
                                <asp:Button ID="btnGuardarUsuario" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarUsuario_Click" CausesValidation="true" ValidationGroup="vgUsuario" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL USUARIO =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR USUARIO =========================================================================== -->
                <asp:UpdatePanel ID="upUsuariosE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pUsuariosE" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfUsuariosE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeUsuariosE" runat="server" BackgroundCssClass="modalBackground"
                                TargetControlID="hfUsuariosE" PopupControlID="pUsuariosE" DropShadow="true">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Usuario</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblRutUsuarioE" runat="server" Text="* Rut:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbRutUsuarioE" runat="server" Width="100%" placeholder="Ingresar Rut"
                                                ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvRutUsuarioE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgUsuarioE" ControlToValidate="tbRutUsuarioE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomUsuarioE" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomUsuarioE" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomUsuarioE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgUsuarioE" ControlToValidate="tbNomUsuarioE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblApePatUsuarioE" runat="server" Text="* A. Paterno:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbApePatUsuarioE" runat="server" Width="100%" placeholder="Ingresar Apellido Paterno"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvApePatUsuarioE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgUsuarioE" ControlToValidate="tbApePatUsuarioE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblApeMatUsuarioE" runat="server" Text="* A. Materno:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbApeMatUsuarioE" runat="server" Width="100%" placeholder="Ingresar Apellido Materno"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvApeMatUsuarioE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgUsuarioE" ControlToValidate="tbApeMatUsuarioE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblMailE" runat="server" Text="* e-Mail:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbMailE" runat="server" Width="100%" placeholder="Ingresar e-Mail"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvMailE" runat="server" ErrorMessage="(*)" ValidationGroup="vgUsuarioE"
                                                ControlToValidate="tbMailE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblAreaE" runat="server" Text="Área:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlAreaE" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCargoE" runat="server" Text="Cargo:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlCargosE" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCentroE" runat="server" Text="Centro:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlCentroE" runat="server" Width="100%">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblFormularioE" runat="server" Text="Formulario:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlFormularioE" runat="server" Width="100%" Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%">
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
                                <asp:Button ID="btnCerrarUsuarioE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarUsuarioE_Click" />
                                <asp:Button ID="btnGuardarUsuarioE" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarUsuarioE_Click" CausesValidation="true" ValidationGroup="vgUsuarioE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR USUARIO =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
