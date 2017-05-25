<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="detalleevaluaciones.aspx.cs" Inherits="Proyecto.detalleevaluaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Detalle de Evaluación
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="iniciocapacitacion.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="evaluacionesfinalizadas.aspx"><span class="icon-list"></span>&nbsp;Evaluados
                a Capacitar</a></li>
            <li class="active"><a id="detalleevaluacion" runat="server" href=""><span class="icon-list">
            </span>&nbsp;Detalle de Evaluación</a></li>
        </ul>
    </div>
    <div class="tab-content">
        <div class="tab-pane active" id="formularioevaluacion">
            <br />
            <div id="divPrint">
                <p class="titlegrid">
                    Datos del Evaluado</p>
                <br />
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
                <br />
                <p class="titlegrid">
                    Detalle de la Evaluación</p>
                <asp:GridView ID="gvDatos" runat="server" AutoGenerateColumns="False" CellPadding="5"
                    CssClass="grid" ForeColor="#333333" GridLines="None" OnDataBound="gvDatos_DataBound"
                    Font-Size="Small">
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
        </div>
        <br />
        <div align="center">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" class="btn btn-default btneminsmall"
                OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
