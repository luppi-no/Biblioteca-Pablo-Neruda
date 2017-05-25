<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="admevaluaciones.aspx.cs" Inherits="Proyecto.admevaluaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Todas las Evaluaciones
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx" id="inicio" runat="server"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#admevaluaciones" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Todas las Evaluaciones</a></li>
            <li><a href="admmisevaluaciones.aspx"><span class="icon-list"></span>&nbsp;Mis Evaluaciones</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="admevaluaciones">
                <br />
                <p class="title">
                    Búsqueda - Evaluaciones</p>
                <div align="center">
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblBuscarPor" runat="server" Text="Buscar por: "></asp:Label>
                            <asp:DropDownList ID="ddlBuscadoEvaluacio" runat="server">
                                <asp:ListItem Value="0">Todos</asp:ListItem>
                                <asp:ListItem Value="1">Evaluado</asp:ListItem>
                                <asp:ListItem Value="2">Evaluador</asp:ListItem>
                                <asp:ListItem Value="3">Centro de Costo</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="tbNombre" runat="server" placeholder="Ingrese el texto a buscar"
                                Width="25%"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscar" runat="server" Text="Buscar" CssClass="btn btn-default btneminmedium"
                                OnClick="lnkbBuscar_Click"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiar" runat="server" Text="Quitar Filtro" CssClass="btn btn-danger btneminmedium"
                                OnClick="lnkbLimpiar_Click" Visible="false"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <p class="titlegrid">
                    Pendientes</p>
                <asp:UpdatePanel ID="upPendientes" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvEvaluacionesPendientes" runat="server" AutoGenerateColumns="False"
                            CssClass="grid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvEvaluacionesPendientes_RowCommand"
                            AllowPaging="True" Font-Size="Small" OnPageIndexChanging="gvEvaluacionesPendientes_PageIndexChanging"
                            PageSize="15" EmptyDataText="No existen registros de evaluaciones pendientes."
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
                                <asp:BoundField DataField="vchFormulario" HeaderText="Formulario">
                                    <HeaderStyle Width="25%" />
                                    <ItemStyle Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="porcentaje" HeaderText="Completado(%)">
                                    <HeaderStyle CssClass="mid" Width="10%" />
                                    <ItemStyle CssClass="mid" HorizontalAlign="Center" Width="10%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDetallePendientes" runat="server" CausesValidation="False"
                                            CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' Text=""
                                            ToolTip="Evaluar - Ver Detalle"><span class="icon-pencil"></span></asp:LinkButton>
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
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="gvEvaluacionesPendientes" EventName="PageIndexChanging" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <br />
                <p class="titlegrid">
                    Finalizadas</p>
                <asp:UpdatePanel ID="upFinalizadas" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvEvaluacionesFinalizadas" runat="server" AutoGenerateColumns="False"
                            CssClass="grid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvEvaluacionesFinalizadas_RowCommand"
                            AllowPaging="True" Font-Size="Small" OnPageIndexChanging="gvEvaluacionesFinalizadas_PageIndexChanging"
                            PageSize="15" EmptyDataText="No existen registros de evaluaciones finalizadas."
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
                                <asp:BoundField DataField="vchFormulario" HeaderText="Formulario">
                                    <HeaderStyle Width="25%" />
                                    <ItemStyle Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="feedback" HeaderText="¿Feedback?">
                                    <HeaderStyle CssClass="mid" Width="13%" />
                                    <ItemStyle CssClass="mid" HorizontalAlign="Center" Width="13%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="porcentaje" HeaderText="Completado(%)">
                                    <HeaderStyle CssClass="mid" Width="10%" />
                                    <ItemStyle CssClass="mid" HorizontalAlign="Center" Width="10%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDetalleFinalizadas" runat="server" CausesValidation="False"
                                            CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' Text=""
                                            ToolTip="Evaluar - Ver Detalle"><span class="icon-pencil"></span></asp:LinkButton>
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
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="gvEvaluacionesPendientes" EventName="PageIndexChanging" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
