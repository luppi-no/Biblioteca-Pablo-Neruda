<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="evaluacionesporevaluado.aspx.cs" Inherits="Proyecto.evaluacionesporevaluado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Evaluaciones por Evaluado
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="historialevaluaciones.aspx"><span class="icon-list"></span>&nbsp;Historial de Evaluaciones</a></li>
            <li class="active"><a id="evaluacionesporeva" runat="server" href=""><span class="icon-list">
            </span>&nbsp; Evaluaciones por Evaluado</a></li>
        </ul>
        <br />
        <div class="tab-content">
            <div class="tab-pane active" id="evaluacionesporeva">
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
                                        <asp:Label ID="lblIDPeriodo" runat="server" Text="Periodo: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPeriodo" runat="server" Text=""></asp:Label>
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
                                            ToolTip="Ver Detalle de Evaluación"><span class="icon-zoom-in"></span></asp:LinkButton>
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
    </div>
</asp:Content>
