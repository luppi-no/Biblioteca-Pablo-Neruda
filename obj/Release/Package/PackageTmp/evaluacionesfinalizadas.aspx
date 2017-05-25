<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="evaluacionesfinalizadas.aspx.cs" Inherits="Proyecto.evaluacionesfinalizadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Evaluaciones Finalizadas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <script type="text/javascript">
        function checkDate(sender, args) {
            if (sender._selectedDate < new Date()) {
                alert("No puedes seleccionar una fecha anterior a la de hoy.");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="iniciocapacitacion.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="evaluadosacapacitar.aspx"><span class="icon-list"></span>&nbsp;Evaluados
                a Capacitar</a></li>
            <li class="active"><a id="detalleevaluacion" runat="server" href=""><span class="icon-list">
            </span>&nbsp;Detalle de Evaluación</a></li>
        </ul>
        <br />
        <div class="tab-content">
            <div class="tab-pane active" id="capacitaciones">
                <div id="divPrint">
                    <p class="titlegrid">
                        Datos del Evaluado</p>
                    <br />
                    <asp:UpdatePanel ID="upDatos" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table align="center" width="70%">
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblIDRut" runat="server" Text="Rut: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRut" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblIDNombre" runat="server" Text="Nombre: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblIDCargo" runat="server" Text="Cargo: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCargo" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblCapacitaciones" runat="server" Text="Capacitaciones asignadas: "></asp:Label>
                                    </td>
                                    <td rowspan="3">
                                        <asp:BulletedList ID="blCapacitaciones" runat="server" AppendDataBoundItems="true">
                                        </asp:BulletedList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblIDPeriodo" runat="server" Text="Periodo: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPeriodo" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <p class="titlegrid">
                        Evaluaciones del Periodo</p>
                    <asp:GridView ID="gvDatos" runat="server" AutoGenerateColumns="False" CellPadding="5"
                        CssClass="grid" ForeColor="#333333" GridLines="None" Font-Size="Small">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Competencia" HeaderText="Competencia">
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción">
                                <HeaderStyle Width="50%" />
                                <ItemStyle Width="50%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="intIDNotaCompetencia" HeaderText="Nota">
                                <HeaderStyle Width="17.5%" />
                                <ItemStyle Width="17.5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="intNotaEsperada" HeaderText="Nota Esperada">
                                <HeaderStyle Width="17.5%" />
                                <ItemStyle Width="17.5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Brecha" HeaderText="Brecha">
                                <HeaderStyle Width="17.5%" />
                                <ItemStyle Width="17.5%" />
                            </asp:BoundField>
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
                </div>
                <asp:UpdatePanel ID="upCapacitacion" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvEvaluacionesFinalizadas" runat="server" ShowHeaderWhenEmpty="True"
                            AutoGenerateColumns="False" CellPadding="8" ForeColor="#333333" GridLines="None"
                            CssClass="grid" AllowPaging="True" Font-Size="Small" OnRowCommand="gvEvaluacionesFinalizadas_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="vchRut" HeaderText="Rut">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCargo" HeaderText="Cargo">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nota_Esperada" HeaderText="Nota Esperada">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nota_Actual" HeaderText="Nota Actual">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Brecha" HeaderText="Brecha">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intIDAsignacion" HeaderText="">
                                    <ControlStyle Width="100%" CssClass="hide" />
                                    <FooterStyle CssClass="hide" />
                                    <HeaderStyle Width="15%" CssClass="hide" />
                                    <ItemStyle Width="15%" CssClass="hide" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDetalleEvaluacion" runat="server" CausesValidation="False"
                                            CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' Text=""
                                            ToolTip="Ver Detalle de Evaluación"><span class="icon-pencil"></span></asp:LinkButton>
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
                </asp:UpdatePanel>
            </div>
        </div>
        <br />
        <!-- =========================================================================== MODAL CAPACITAR =========================================================================== -->
        <asp:UpdatePanel ID="upCapacitarEvaluado" runat="server" UpdateMode="Conditional"
            ChildrenAsTriggers="false">
            <ContentTemplate>
                <asp:Button ID="btnNewCapacitacion" runat="server" Text="Capacitar Evaluado" class="btn btn-primary btneminlarge" />
                <ajaxToolkit:ModalPopupExtender ID="mpeCapacitacion" runat="server" DropShadow="true"
                    TargetControlID="btnNewCapacitacion" PopupControlID="pCapacitacion" BackgroundCssClass="modalBackground" />
                <asp:Panel ID="pCapacitacion" runat="server" Style="display: none" CssClass="modalPopup">
                    <div class="header">
                        <p class="title">
                            Ingreso de Capacitaciones</p>
                    </div>
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <ContentTemplate>
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblModalPeriodo" runat="server" Text="Periodo:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:Label ID="lblModalInfoPeriodo" runat="server" Text="" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 5%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblProgramada" runat="server" Text="Programada:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:DropDownList ID="ddlProgramada" runat="server" OnSelectedIndexChanged="ddlProgramada_SelectedIndexChanged"
                                                AppendDataBoundItems="true" Width="20%" AutoPostBack="true">
                                                <asp:ListItem Value="NO" Text="NO" Selected="True" />
                                                <asp:ListItem Value="SI" Text="SI" />
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                        </td>
                                        <td style="width: 75%;">
                                            <asp:DropDownList ID="ddlCapacitacion" runat="server" OnSelectedIndexChanged="ddlCapacitacion_SelectedIndexChanged"
                                                AppendDataBoundItems="true" Width="100%" AutoPostBack="true" Enabled="false">
                                                <asp:ListItem Selected="True" Value="0" Text="Seleccione Capacitacion"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblCapacitacion" runat="server" Text="* Capacitación:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%;">
                                            <asp:TextBox ID="tbCapacitacion" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvCapacitacion" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitarEvaluado" ControlToValidate="tbCapacitacion"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblCupos" runat="server" Text="*N° Cupos:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbCupos" runat="server" Width="20%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="ftbeCupos" runat="server" TargetControlID="tbCupos"
                                                FilterType="Numbers">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvCupos" runat="server" ErrorMessage="(*)" ValidationGroup="vgCapacitarEvaluado"
                                                ControlToValidate="tbCupos"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblHoras" runat="server" Text="*N° Horas:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbHoras" runat="server" Width="20%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                TargetControlID="tbHoras" ValidChars="1234567890">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvHoras" runat="server" ErrorMessage="(*)" ValidationGroup="vgCapacitarEvaluado"
                                                ControlToValidate="tbHoras"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblFechaDesde" runat="server" Text="*Fecha Desde:" Width="100%" placeholder="Fecha Desde"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbFechaDesde" runat="server" ReadOnly="True" placeholder="Fecha Desde"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="ceFechaDesde" runat="server" TargetControlID="tbFechaDesde"
                                                FirstDayOfWeek="Monday" PopupButtonID="btnFechaDesde" TodaysDateFormat="dd/MM/yyyy"
                                                Format="dd/MM/yyyy" EnableViewState="False" CssClass="cal_Theme1" OnClientDateSelectionChanged="checkDate">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:ImageButton ID="btnFechaDesde" runat="server" ImageUrl="~/Content/img/calendar.gif" />
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvFechaDesde" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitarEvaluado" ControlToValidate="tbFechaDesde"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblFechaHasta" runat="server" Text="*Fecha Hasta:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbFechaHasta" runat="server" ReadOnly="True" placeholder="Fecha Hasta"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="ceFechaHasta" runat="server" TargetControlID="tbFechaHasta"
                                                FirstDayOfWeek="Monday" PopupButtonID="btnFechaHasta" TodaysDateFormat="dd/MM/yyyy"
                                                Format="dd/MM/yyyy" CssClass="cal_Theme1" OnClientDateSelectionChanged="checkDate">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:ImageButton ID="btnFechaHasta" runat="server" ImageUrl="~/Content/img/calendar.gif" />
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvFechaHasta" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitarEvaluado" ControlToValidate="tbFechaHasta"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblTipoCapacitacion" runat="server" Text="* Tipo" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlTipoCapacitacion" runat="server" AppendDataBoundItems="true"
                                                Width="100%">
                                                <asp:ListItem Selected="True" Value="0" Text="Seleccione Tipo"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvTipoCapacitacion" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitarEvaluado" ControlToValidate="ddlTipoCapacitacion"
                                                InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblProveedor" runat="server" Text="* Proveedor" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlProveedor" runat="server" AppendDataBoundItems="true" Width="100%">
                                                <asp:ListItem Selected="True" Value="0" Text="Seleccione Proveedor"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvProveedorSI" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitarEvaluado" ControlToValidate="ddlProveedor" InitialValue="0"></asp:RequiredFieldValidator>
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
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlProgramada" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddlCapacitacion" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="footer">
                        <asp:Button ID="btnCerrarCapacitaciones" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                            OnClick="btnCerrarCapacitaciones_Click" />
                        <asp:Button ID="btnGuardarCapacitaciones" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                            OnClick="btnGuardarCapacitaciones_Click" CausesValidation="true" ValidationGroup="vgCapacitarEvaluado" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnCerrarCapacitaciones" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnGuardarCapacitaciones" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <!-- =========================================================================== FIN MODAL CAPACITAR =========================================================================== -->
    </div>
</asp:Content>
