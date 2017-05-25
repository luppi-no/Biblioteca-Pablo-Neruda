<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="capacitaciones.aspx.cs" Inherits="Proyecto.capacitaciones" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Title">
    EMIN - Capacitaciones
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadScript">
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
            <li class="active"><a href="#capacitaciones" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Capacitaciones</a></li>
            <li><a href="tipocapacitacion.aspx"><span class="icon-list"></span>&nbsp;Tipo de Capacitaciones</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="capacitaciones">
                <div align="center">
                    <p class="title">
                        Búsqueda - Capacitaciones
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblNomCapacitaciones" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbNomCapacitaciones" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscarCapacitacion" runat="server" OnClick="lnkbBuscarCapacitacion_Click"
                                CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiarCapacitacion" runat="server" OnClick="lnkbLimpiarCapacitacion_Click"
                                CssClass="btn btn-danger btneminmedium" Visible="False"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscarCapacitacion" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarCapacitacion" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upCapacitacion" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvCapacitaciones" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="8" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvCapacitaciones_PageIndexChanging"
                            AllowPaging="True" Font-Size="Small" OnRowCommand="gvCapacitaciones_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDCapacitacion" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCapacitacion" HeaderText="Capacitacion">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intCupos" HeaderText="Cupos" />
                                <asp:BoundField DataField="intHoras" HeaderText="N° de Horas" />
                                <asp:BoundField DataField="dtmDesde" HeaderText="Fecha Desde" />
                                <asp:BoundField DataField="dtmHatas" HeaderText="Fecha Hasta" />
                                <asp:BoundField DataField="vchTipoCapacitacion" HeaderText="Tipo" ReadOnly="True">
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intIDTipoCapacitacion" HeaderText="IDTipo">
                                    <ControlStyle CssClass="hide" />
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
                <br />
                <!-- =========================================================================== MODAL CAPACITACION =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarCapacitacion" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" class="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeCapacitacion" runat="server" DropShadow="true"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pCapacitacion" BackgroundCssClass="modalBackground" />
                        <asp:Panel ID="pCapacitacion" runat="server" Style="display: none" CssClass="modalPopup">
                            <div class="header">
                                <p class="title">Ingreso de Capacitación</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblCapacitacion" runat="server" Text="* Capacitación:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%;">
                                            <asp:TextBox ID="tbCapacitacion" runat="server" Width="100%" placeholder="Ingreso de Capacitación"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvCapacitacion" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitacion" ControlToValidate="tbCapacitacion"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblCupos" runat="server" Text="*N° Cupos:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbCupos" runat="server" Width="10%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="ftbeCupos" runat="server" TargetControlID="tbCupos"
                                                FilterType="Numbers">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvCupos" runat="server" ErrorMessage="(*)" ValidationGroup="vgCapacitacion"
                                                ControlToValidate="tbCupos"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblHoras" runat="server" Text="*N° Horas:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbHoras" runat="server" Width="10%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="ftbeHoras" runat="server" TargetControlID="tbHoras"
                                                ValidChars="1234567890">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvHoras" runat="server" ErrorMessage="(*)" ValidationGroup="vgCapacitacion"
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
                                                FirstDayOfWeek="Monday" PopupButtonID="btnCalendar" TodaysDateFormat="dd/MM/yyyy"
                                                Format="dd/MM/yyyy" EnableViewState="False" CssClass="cal_Theme1" OnClientDateSelectionChanged="checkDate">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:ImageButton ID="btnCalendar" runat="server" ImageUrl="~/Content/img/calendar.gif" />
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvFechaDesde" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitacion" ControlToValidate="tbFechaDesde"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblFechaHasta" runat="server" Text="*Fecha Hasta:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbFechaHasta" runat="server" ReadOnly="True" placeholder="Fecha Hasta"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="ceFechaHasta" runat="server" TargetControlID="tbFechaHasta"
                                                FirstDayOfWeek="Monday" PopupButtonID="btnCalendar2" TodaysDateFormat="dd/MM/yyyy"
                                                Format="dd/MM/yyyy" CssClass="cal_Theme1" OnClientDateSelectionChanged="checkDate">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:ImageButton ID="btnCalendar2" runat="server" ImageUrl="~/Content/img/calendar.gif" />
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvFechaHasta" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitacion" ControlToValidate="tbFechaHasta"></asp:RequiredFieldValidator>
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
                                                ValidationGroup="vgCapacitacion" ControlToValidate="ddlTipoCapacitacion" InitialValue="0"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarCapacitaciones" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                    OnClick="btnCerrarCapacitaciones_Click" />
                                <asp:Button ID="btnGuardarCapacitaciones" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarCapacitaciones_Click" CausesValidation="true" ValidationGroup="vgCapacitacion" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL CAPACITACION =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR CAPACITACION =========================================================================== -->
                <asp:UpdatePanel ID="upCapacitacionE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pCapacitacionE" runat="server" Style="display: none" CssClass="modalPopup">
                            <asp:HiddenField ID="hfCapacitacionE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeCapacitacionE" runat="server" DropShadow="true"
                                TargetControlID="hfCapacitacionE" PopupControlID="pCapacitacionE" BackgroundCssClass="modalBackground" />
                            <div class="header">
                                <p class="title">Edición de Capacitación</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblCapacitacionE" runat="server" Text="* Capacitación:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%;">
                                            <asp:TextBox ID="tbCapacitacionE" runat="server" Width="100%" placeholder="Ingreso de Capacitación"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvCapacitacionE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitacionE" ControlToValidate="tbCapacitacionE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblCuposE" runat="server" Text="*N° Cupos:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbCuposE" runat="server" Width="10%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="ftbeCuposE" runat="server" TargetControlID="tbCuposE"
                                                FilterType="Numbers">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvCuposE" runat="server" ErrorMessage="(*)" ValidationGroup="vgCapacitacionE"
                                                ControlToValidate="tbCuposE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblHorasE" runat="server" Text="*N° Horas:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbHorasE" runat="server" Width="10%"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="ftbeHorasE" runat="server" TargetControlID="tbHorasE"
                                                ValidChars="1234567890">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvHorasE" runat="server" ErrorMessage="(*)" ValidationGroup="vgCapacitacionE"
                                                ControlToValidate="tbHorasE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblFechaDesdeE" runat="server" Text="*Fecha Desde:" Width="100%" placeholder="Fecha Desde"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbFechaDesdeE" runat="server" ReadOnly="True" placeholder="Fecha Desde"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="ceFechaDesdeE" runat="server" TargetControlID="tbFechaDesdeE"
                                                FirstDayOfWeek="Monday" PopupButtonID="btnCalendarE" TodaysDateFormat="dd/MM/yyyy"
                                                Format="dd/MM/yyyy" CssClass="cal_Theme1" OnClientDateSelectionChanged="checkDate">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:ImageButton ID="btnCalendarE" runat="server" ImageUrl="~/Content/img/calendar.gif" />
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvFechaDesdeE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitacionE" ControlToValidate="tbFechaDesdeE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblFechaHastaE" runat="server" Text="*Fecha Hasta:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%; text-align: left">
                                            <asp:TextBox ID="tbFechaHastaE" runat="server" ReadOnly="True" placeholder="Fecha Hasta"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="ceFechaHastaE" runat="server" TargetControlID="tbFechaHastaE"
                                                FirstDayOfWeek="Monday" PopupButtonID="btnCalendar2E" TodaysDateFormat="dd/MM/yyyy"
                                                Format="dd/MM/yyyy" CssClass="cal_Theme1" OnClientDateSelectionChanged="checkDate">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:ImageButton ID="btnCalendar2E" runat="server" ImageUrl="~/Content/img/calendar.gif" />
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvFechaHastaE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitacionE" ControlToValidate="tbFechaHastaE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblTipoCapacitacionE" runat="server" Text="* Tipo" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:DropDownList ID="ddlTipoCapacitacionE" runat="server" AppendDataBoundItems="true"
                                                Width="100%" Enabled="false">
                                                <asp:ListItem Selected="True" Value="0" Text="Seleccione Tipo"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 5%;">
                                            <asp:RequiredFieldValidator ID="rfvTipoCapacitacionE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgCapacitacionE" ControlToValidate="ddlTipoCapacitacionE" InitialValue="0"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarCapacitacionesE" runat="server" Text="Cerrar" class="btn btn-default btneminsmall"
                                    OnClick="btnCerrarCapacitacionesE_Click" />
                                <asp:Button ID="btnGuardarCapacitacionesE" runat="server" Text="Guardar" class="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarCapacitacionesE_Click" CausesValidation="true" ValidationGroup="vgCapacitacionE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR CAPACITACION =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
