<%@ Page Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="valorcapacitacion.aspx.cs"
    Inherits="Proyecto.valorcapacitacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Valor de Capacitación
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a id="inicio" runat="server" href=""><span class="icon-home"></span>&nbsp Menú
                Principal</a></li>
            <li><a id="listacapacitacion" runat="server" href=""><span class="icon-list"></span>
                &nbsp Lista de Capacitaciones</a></li>
            <li class="active"><a id="valorcapa" runat="server" href=""><span class="icon-list">
            </span>&nbsp Valor Capacitación</a></li>
        </ul>
    </div>
    <div class="tab-content">
        <div class="tab-pane active" id="tabValorCapacitacion">
            <br />
            <div id="divPrint">
                <p class="titlegrid">
                    Datos Capacitacion</p>
                <br />
                <table align="center" width="70%">
                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="lblTituloCapacitacion" runat="server" Text="Capacitacion: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCapacitacion" runat="server" Text=""></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:Label ID="lblTituloArea" runat="server" Text="Área: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblArea" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="lblTituloProveedor" runat="server" Text="Proveedor: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblProveedor" runat="server" Text=""></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:Label ID="lblTituloDesde" runat="server" Text="Fecha Desde: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDesde" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="lblTiruloHasta" runat="server" Text="Fecha Hasta: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblHasta" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="upValorCurso" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvValorCurso" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="8" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvValorCurso_PageIndexChanging"
                            AllowPaging="True" Font-Size="Small" 
                            OnRowCommand="gvValorCurso_RowCommand" 
                            EmptyDataText="No hay registros de valores asociados a esta capacitación.">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDValorCurso" HeaderText="">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intFranquicia" HeaderText="Valor Franquicia" />
                                <asp:BoundField DataField="intEmpresa" HeaderText="Valor Empresa" />
                                <asp:BoundField DataField="vchMes" HeaderText="Mes" />
                                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="true">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="20%" />
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbEdit" runat="server" CausesValidation="False" CommandName="Editar"
                                            Text="" ToolTip="Editar"><span class="icon-edit"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="2%" />
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
                </asp:UpdatePanel>
            </div>
            <br />
            <!-- =========================================================================== MODAL VALOR CAPACITACION =========================================================================== -->
            <asp:UpdatePanel ID="upIngresoValorCapacitacion" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" class="btn btn-primary btneminlarge" />
                    <ajaxToolkit:ModalPopupExtender ID="mpeValorCapacitacion" runat="server" DropShadow="true"
                        TargetControlID="btnNuevoRegistro" PopupControlID="pValorCapacitacion" BackgroundCssClass="modalBackground" />
                    <asp:Panel ID="pValorCapacitacion" runat="server" Style="display: none" CssClass="modalPopup">
                        <div class="header">
                            <p class="title">
                                Ingreso de Valor de Capacitación</p>
                        </div>
                        <br />
                        <div class="body">
                            <table width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblFranquicia" runat="server" Text="*Valor Franquicia:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:TextBox ID="tbFranquicia" runat="server" Width="100%" placeholder="Valor Franquicia"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="ftbeFranquicia" runat="server" TargetControlID="tbFranquicia"
                                            ValidChars="1234567890">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td style="width: 5%">
                                         <asp:RequiredFieldValidator ID="rfvFranquicia" runat="server" ErrorMessage="(*)"
                                            ValidationGroup="vgValorCapacitacion" ControlToValidate="tbFranquicia"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblEmpresa" runat="server" Text="*Valor Empresa:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:TextBox ID="tbEmpresa" runat="server" Width="100%" placeholder="Valor Empresa"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="ftbeEmpresa" runat="server" TargetControlID="tbEmpresa"
                                            ValidChars="1234567890">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td style="width: 5%">
                                    <asp:RequiredFieldValidator ID="rfvEmpresa" runat="server" ErrorMessage="(*)" ValidationGroup="vgValorCapacitacion"
                                            ControlToValidate="tbEmpresa"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblMes" runat="server" Text="Mes:" Width="100%" placeholder="Fecha Desde"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:DropDownList ID="ddlMes" runat="server" targetcontrolid="txtProgramada">
                                            <asp:ListItem Value="Enero" Text="Enero" />
                                            <asp:ListItem Value="Febrero" Text="Febrero" />
                                            <asp:ListItem Value="Marzo" Text="Marzo" />
                                            <asp:ListItem Value="Abril" Text="Abril" />
                                            <asp:ListItem Value="Mayo" Text="Mayo" />
                                            <asp:ListItem Value="Junio" Text="Junio" />
                                            <asp:ListItem Value="Julio" Text="Julio" />
                                            <asp:ListItem Value="Agosto" Text="Agosto" />
                                            <asp:ListItem Value="Septiembre" Text="Septiembre" />
                                            <asp:ListItem Value="Octubre" Text="Octubre" />
                                            <asp:ListItem Value="Noviembre" Text="Nomviembre" />
                                            <asp:ListItem Value="Diciembre" Text="Diciembre" />
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
                            <asp:Button ID="btnCerrarValor" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                OnClick="btnCerrarValor_Click" />
                            <asp:Button ID="btnGuardarValor" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                OnClick="btnGuardarValor_Click" CausesValidation="true" ValidationGroup="vgValorCapacitacion" />
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <!-- =========================================================================== FIN MODAL VALOR CAPACITACION =========================================================================== -->
            <!-- =========================================================================== MODAL VALOR EDITAR VALOR CAPACITACION =========================================================================== -->
            <asp:UpdatePanel ID="upValorCapacitacionE" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Panel ID="pValorCapacitacionE" runat="server" Style="display: none" CssClass="modalPopup">
                        <asp:HiddenField ID="hfValorCapacitacionE" runat="server" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeValorCapacitacionE" runat="server" DropShadow="true"
                            TargetControlID="hfValorCapacitacionE" PopupControlID="pValorCapacitacionE" BackgroundCssClass="modalBackground" />
                        <div class="header">
                            <p class="title">
                                Edición de Valor de Capacitación</p>
                        </div>
                        <br />
                        <div class="body">
                            <table width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblFranquiciaE" runat="server" Text="*Valor Franquicia:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:TextBox ID="tbFranquiciaE" runat="server" placeholder="Valor Franquicia" Width="100%"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="ftbeFranquiciaE" runat="server" TargetControlID="tbFranquiciaE"
                                            ValidChars="1234567890">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td style="width: 5%">
                                        <asp:RequiredFieldValidator ID="rfvFranquiciaE" runat="server" ErrorMessage="(*)"
                                            ValidationGroup="vgValorCapacitacionE" ControlToValidate="tbFranquiciaE"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblEmpresaE" runat="server" Text="*Valor Empresa:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:TextBox ID="tbEmpresaE" runat="server" placeholder="Valor Empresa" Width="100%"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="ftbeEmpresaE" runat="server" TargetControlID="tbEmpresaE"
                                            ValidChars="1234567890">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td style="width: 5%">
                                        <asp:RequiredFieldValidator ID="rfvEmpresaE" runat="server" ErrorMessage="(*)" ValidationGroup="vgValorCapacitacionE"
                                            ControlToValidate="tbEmpresaE"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblMesE" runat="server" Text="Mes:" placeholder="Fecha Desde" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:DropDownList ID="ddlMesE" runat="server">
                                            <asp:ListItem Value="Enero" Text="Enero" />
                                            <asp:ListItem Value="Febrero" Text="Febrero" />
                                            <asp:ListItem Value="Marzo" Text="Marzo" />
                                            <asp:ListItem Value="Abril" Text="Abril" />
                                            <asp:ListItem Value="Mayo" Text="Mayo" />
                                            <asp:ListItem Value="Junio" Text="Junio" />
                                            <asp:ListItem Value="Julio" Text="Julio" />
                                            <asp:ListItem Value="Agosto" Text="Agosto" />
                                            <asp:ListItem Value="Septiembre" Text="Septiembre" />
                                            <asp:ListItem Value="Octubre" Text="Octubre" />
                                            <asp:ListItem Value="Noviembre" Text="Nomviembre" />
                                            <asp:ListItem Value="Diciembre" Text="Diciembre" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 5%">
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
                            <asp:Button ID="btnCerrarValorE" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                OnClick="btnCerrarValorE_Click" />
                            <asp:Button ID="btnGuardarValorE" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                OnClick="btnGuardarValorE_Click" CausesValidation="true" ValidationGroup="vgValorCapacitacionE" />
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <!-- =========================================================================== FIN MODAL EDITAR VALOR CAPACITACION =========================================================================== -->
        </div>
    </div>
</asp:Content>
