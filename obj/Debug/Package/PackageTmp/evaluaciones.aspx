<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="evaluaciones.aspx.cs" Inherits="Proyecto.evaluaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Evaluaciones
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a id="inicio" runat="server" href="inicioevaluacion.aspx"><span class="icon-home">
            </span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#evaluaciones" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Mis Evaluaciones</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="evaluaciones">
                <div id="evaluacionesasignadas" runat="server">
                    <br />
                    <p class="titlegrid">
                        Evaluaciones Asignadas</p>
                    <asp:GridView ID="gvEvaluacionesAsignadas" runat="server" AutoGenerateColumns="False"
                        CssClass="grid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvEvaluacionesAsignadas_RowCommand"
                        AllowPaging="True" Font-Size="Small" OnPageIndexChanging="gvEvaluacionesAsignadas_PageIndexChanging"
                        EmptyDataText="No hay evaluaciones asignadas." ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="intIDAsignacion" HeaderText="ID">
                                <HeaderStyle CssClass="hide" />
                                <ItemStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:BoundField DataField="evaluador" HeaderText="Evaluador">
                                <HeaderStyle Width="30%" />
                                <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="evaluado" HeaderText="Evaluado">
                                <HeaderStyle Width="30%" />
                                <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vchFormulario" HeaderText="Formulario">
                                <HeaderStyle Width="28%" />
                                <ItemStyle Width="28%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="porcentaje" HeaderText="Completado(%)">
                                <HeaderStyle CssClass="mid" HorizontalAlign="Center" Width="10%" />
                                <ItemStyle CssClass="mid" Width="10%" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbEvaluacion" runat="server" CausesValidation="False" CommandName="Select"
                                        CommandArgument='<%# Container.DataItemIndex %>' Text="" ToolTip="Evaluar"><span class="icon-pencil"></span></asp:LinkButton>
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
                    <br />
                </div>
                <div id="evaluacionesrealizadas" runat="server">
                    <br />
                    <p class="titlegrid">
                        Evaluaciones Realizadas</p>
                    <asp:GridView ID="gvEvaluacionesRealizadas" runat="server" AutoGenerateColumns="False"
                        CssClass="grid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvEvaluacionesRealizadas_RowCommand"
                        AllowPaging="True" Font-Size="Small" OnPageIndexChanging="gvEvaluacionesRealizadas_PageIndexChanging"
                        EmptyDataText="No hay evaluaciones realizadas." ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="intIDAsignacion" HeaderText="ID">
                                <HeaderStyle CssClass="hide" />
                                <ItemStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:BoundField DataField="evaluador" HeaderText="Evaluador">
                                <HeaderStyle Width="25%" />
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="evaluado" HeaderText="Evaluado">
                                <HeaderStyle Width="25%" />
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vchFormulario" HeaderText="Formulario">
                                <HeaderStyle Width="25%" />
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="feedback" HeaderText="¿Feedback?">
                            <HeaderStyle CssClass="mid" HorizontalAlign="Center" Width="13%" />
                                <ItemStyle CssClass="mid" Width="13%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="porcentaje" HeaderText="Completado(%)">
                                <HeaderStyle CssClass="mid" HorizontalAlign="Center" Width="10%" />
                                <ItemStyle CssClass="mid" Width="10%" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbDetalle" runat="server" CausesValidation="False" CommandName="Select"
                                        CommandArgument='<%# Container.DataItemIndex %>' Text="" ToolTip="Ver Detalle - Editar Evaluación"><span class="icon-zoom-in"></span></asp:LinkButton>
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
                    <br />
                </div>
                <div id="misevaluaciones" runat="server">
                    <br />
                    <p class="titlegrid">
                        Mis Evaluaciones</p>
                    <asp:GridView ID="gvMisEvaluaciones" runat="server" AutoGenerateColumns="False" CssClass="grid"
                        CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvMisEvaluaciones_RowCommand"
                        OnRowDataBound="gvMisEvaluaciones_RowDataBound" AllowPaging="True" Font-Size="Small"
                        OnPageIndexChanging="gvMisEvaluaciones_PageIndexChanging" EmptyDataText="No hay evaluaciones propias."
                        ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="intIDAsignacion" HeaderText="ID">
                                <HeaderStyle CssClass="hide" />
                                <ItemStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:BoundField DataField="evaluador" HeaderText="Evaluador">
                                <HeaderStyle Width="25%" />
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="evaluado" HeaderText="Evaluado">
                                <HeaderStyle Width="25%" />
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="formulario" HeaderText="Formulario">
                                <HeaderStyle Width="25%" />
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="feedback" HeaderText="¿Feedback?">
                            <HeaderStyle CssClass="mid" HorizontalAlign="Center" Width="13%" />
                                <ItemStyle CssClass="mid" Width="13%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="estado" HeaderText="Estado">
                                <HeaderStyle CssClass="mid" Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbDetalle" runat="server" CausesValidation="False" CommandName="Select"
                                        CommandArgument='<%# Container.DataItemIndex %>' Text="" ToolTip="Ver Detalle - Ingresar Feedback"><span class="icon-zoom-in"></span></asp:LinkButton>
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
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
