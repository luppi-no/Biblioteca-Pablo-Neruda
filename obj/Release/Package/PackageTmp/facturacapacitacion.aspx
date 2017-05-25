<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="facturacapacitacion.aspx.cs" Inherits="Proyecto.facturacapacitacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Facturas
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
            <li class="active"><a id="facturacion" runat="server" href=""><span class="icon-list">
            </span>&nbsp Facturación</a></li>
        </ul>
    </div>
    <div class="tab-content">
        <div class="tab-pane active" id="tabFacturacion">
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
                <asp:UpdatePanel ID="upFacturas" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvFacturas" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="8" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvFacturas_PageIndexChanging"
                            AllowPaging="True" Font-Size="Small" OnRowCommand="gvFacturas_RowCommand" 
                            EmptyDataText="No hay registros de facturas asociadas a esta capacitación.">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="vchProveedor" HeaderText="Proveedor" ReadOnly="True">
                                    <ControlStyle Width="100%" />
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intNumeroFactura" HeaderText="N° Factura" />
                                <asp:BoundField DataField="vchVB_CB" HeaderText="V°B° CB" />
                                <asp:BoundField DataField="vchVB_CC" HeaderText="V°B° CC" />
                                <asp:BoundField DataField="vchMes" HeaderText="Mes" />
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
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <br />
            <!-- =========================================================================== MODAL FACTURACION =========================================================================== -->
            <asp:UpdatePanel ID="upIngresarFactura" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" class="btn btn-primary btneminlarge" />
                    <ajaxToolkit:ModalPopupExtender ID="mpeFacturacion" runat="server" DropShadow="true"
                        TargetControlID="btnNuevoRegistro" PopupControlID="pFacturacion" BackgroundCssClass="modalBackground" />
                    <asp:Panel ID="pFacturacion" runat="server" Style="display: none" CssClass="modalPopup">
                        <div class="header">
                            <p class="title">
                                Ingreso de Facturas</p>
                        </div>
                        <br />
                        <div class="body">
                            <table width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblNumFactura" runat="server" Text="*N° Factura:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:TextBox ID="tbNumFactura" runat="server" placeholder="Número de Factura" Width="100%"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="ftbeNumFactura" runat="server" TargetControlID="tbNumFactura"
                                            ValidChars="1234567890">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td style="width: 5%">
                                        <asp:RequiredFieldValidator ID="rfvNumFactura" runat="server" ErrorMessage="(*)"
                                            ValidationGroup="vgFacturacion" ControlToValidate="tbNumFactura"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblcb" runat="server" Text="V°B° CB:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:DropDownList ID="ddlbvcb" runat="server">
                                            <asp:ListItem Value="OK" Text="OK" />
                                            <asp:ListItem Value="NOK" Text="NO OK" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblcc" runat="server" Text="V°B° CC:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:DropDownList ID="ddlbvcc" runat="server">
                                            <asp:ListItem Value="OK" Text="OK" />
                                            <asp:ListItem Value="NOK" Text="NO OK" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblMes" runat="server" Text="Mes:" Width="100%"></asp:Label>
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
                            <asp:Button ID="btnCerrarFactura" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                OnClick="btnCerrarFactura_Click" />
                            <asp:Button ID="btnGuardarFactura" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                OnClick="btnGuardarFactura_Click" CausesValidation="true" ValidationGroup="vgFacturacion" />
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <!-- =========================================================================== FIN MODAL FACTURACION =========================================================================== -->
            <!-- =========================================================================== MODAL EDITAR FACTURACION =========================================================================== -->
            <asp:UpdatePanel ID="upFacturacionE" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Panel ID="pFacturacionE" runat="server" Style="display: none" CssClass="modalPopup">
                        <asp:HiddenField ID="hfFacturacionE" runat="server" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeFacturacionE" runat="server" DropShadow="true"
                            TargetControlID="hfFacturacionE" PopupControlID="pFacturacionE" BackgroundCssClass="modalBackground" />
                        <div class="header">
                            <p class="title">
                                Edición de Facturas</p>
                        </div>
                        <br />
                        <div class="body">
                            <table width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblNumFacturaE" runat="server" Text="*N° Factura:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:TextBox ID="tbNumFacturaE" runat="server" placeholder="Número de Factura" Width="100%"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="ftbeNumFacturaE" runat="server" TargetControlID="tbNumFacturaE"
                                            ValidChars="1234567890">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </td>
                                    <td style="width: 5%">
                                        <asp:RequiredFieldValidator ID="rfvNumFacturaE" runat="server" ErrorMessage="(*)"
                                            ValidationGroup="vgFacturacionE" ControlToValidate="tbNumFacturaE"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblcbE" runat="server" Text="V°B° CB:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:DropDownList ID="ddlbvcbE" runat="server">
                                            <asp:ListItem Value="OK" Text="OK" />
                                            <asp:ListItem Value="NOK" Text="NO OK" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblccE" runat="server" Text="V°B° CC:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:DropDownList ID="ddlbvccE" runat="server">
                                            <asp:ListItem Value="OK" Text="OK" />
                                            <asp:ListItem Value="NOK" Text="NO OK" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblMesE" runat="server" Text="Mes:" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 75%">
                                        <asp:DropDownList ID="ddlMesE" runat="server" targetcontrolid="txtProgramada">
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
                            <asp:Button ID="btnCerrarFacturaE" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                OnClick="btnCerrarFacturaE_Click" />
                            <asp:Button ID="btnGuardarFacturaE" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                OnClick="btnGuardarFacturaE_Click" CausesValidation="true" ValidationGroup="vgFacturacionE" />
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <!-- =========================================================================== FIN MODAL EDITAR FACTURACION =========================================================================== -->
        </div>
    </div>
</asp:Content>
