<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="periodoevaluacion.aspx.cs" Inherits="Proyecto.periodoevaluacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Periodos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#periodos" data-toggle="tab"><span class="icon-list"></span>
                &nbsp;Periodos</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="periodos">
                <br />
                <p class="title">
                    Periodos</p>
                <div>
                    <asp:Panel ID="pNuevoPeriodo" runat="server" Visible="false">
                        <table width="100%">
                            <tr>
                                <td width="25%">
                                </td>
                                <td width="25%">
                                    <asp:Label ID="lPeriodo" runat="server" Text="Nombre del Periodo"></asp:Label>
                                </td>
                                <td width="25%">
                                    <asp:TextBox ID="tbPeriodo" runat="server" Width="100%"></asp:TextBox>
                                </td>
                                <td width="25%">
                                </td>
                            </tr>
                            <tr>
                                <td width="25%">
                                </td>
                                <td width="25%">
                                    <asp:Label ID="lDescPeriodo" runat="server" Text="Descripcion del Periodo"></asp:Label>
                                </td>
                                <td width="25%">
                                    <textarea cols="1" id="taDescPeriodo" runat="server" class="lock" style="width: 100%"></textarea>
                                </td>
                                <td width="25%">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="4">
                                    <asp:Button ID="btnCrearPeriodo" runat="server" OnClick="btnCrearPeriodo_Click" Text="Abrir Periodo"
                                        CssClass="btn btn-primary btneminlarge" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="pPeriodoExiste" runat="server" Visible="false">
                        <asp:GridView ID="gvPeriodo" runat="server" AutoGenerateColumns="False" CssClass="grid"
                            CellPadding="4" ForeColor="#333333" GridLines="None" OnDataBound="gvPeriodo_DataBound">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDPeriodo" HeaderText="ID">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchPeriodo" HeaderText="Nombre" />
                                <asp:BoundField DataField="vchDescPeriodo" HeaderText="Descripción" />
                                <asp:BoundField DataField="dtmFechaInicio" HeaderText="Fecha de Creación" />
                                <asp:BoundField DataField="TotalEva" HeaderText="Total Evaluaciones (TE)" />
                                <asp:BoundField DataField="TotalEvaFin" HeaderText="TE Finalizadas" />
                                <asp:BoundField DataField="TotalEvaPend" HeaderText="TE Pendientes" />
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
                        <br />
                        <div align="center">
                            <asp:Label ID="lPendientes" runat="server"></asp:Label>
                        </div>
                        <br />
                        <div align="center">
                            <asp:Button ID="btnCerrarPeriodo" runat="server" Text="Cerrar Periodo" OnClick="btnCerrarPeriodo_Click"
                                CssClass="btn btn-primary btneminlarge" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
