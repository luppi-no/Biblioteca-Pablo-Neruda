<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="listacapacitaciones.aspx.cs" Inherits="Proyecto.listacapacitaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Lista de Capacitaciones
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="iniciocapacitacion.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#capacitar" data-toggle="tab"><span class="icon-list"></span>
                &nbsp;Lista de Capacitaciones</a></li>
        </ul>
        <br />
        <div class="tab-content">
            <div class="tab-pane active" id="capacitaciones">
                <p class="title">
                    Búsqueda - Capacitaciones
                </p>
                <div align="center">
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="tbArea" runat="server" Width="15%" placeholder="Ingrese Área a buscar"></asp:TextBox>
                            <asp:TextBox ID="tbProveedor" runat="server" Width="15%" placeholder="Ingrese Proveedor a buscar"></asp:TextBox>
                            <asp:TextBox ID="tbCentroCosto" runat="server" Width="15%" placeholder="Ingrese CentroCosto a buscar"></asp:TextBox>
                            <asp:TextBox ID="tbCapacitacion" runat="server" Width="15%" placeholder="Ingrese Capacitación a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscar" runat="server" OnClick="lnkbBuscar_Click" CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiar" runat="server" OnClick="lnkbLimpiar_Click" CssClass="btn btn-danger btneminmedium"
                                Visible="false"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiar" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upCapacitacion" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvOculto" runat="server" Visible="false" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="dtmDesde" HeaderText="Desde">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="20%" />
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dtmHatas" HeaderText="">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="30%" />
                                    <ItemStyle Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intIDCapacitacion" HeaderText="">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intIDProCap" HeaderText="">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <div align="center">
                            <p class="title">
                                Capacitaciones por Año
                            </p>
                            <asp:Label ID="lblAnnoPeriodo" runat="server" Text="Año:"></asp:Label>
                            <asp:DropDownList ID="ddlAnnoPeriodo" runat="server" Width="10%" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlAnnoPeriodo_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <br />
                        <asp:UpdatePanel ID="upListaCapacitaciones" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvListaCapacitaciones" runat="server" ShowHeaderWhenEmpty="True"
                                    AutoGenerateColumns="False" CellPadding="8" ForeColor="#333333" GridLines="None"
                                    CssClass="grid" AllowPaging="True" Font-Size="Small" OnRowCommand="gvListaCapacitaciones_RowCommand"
                                    EmptyDataText="No existen registros asociados a este año especifico.">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="vchArea" HeaderText="Área">
                                            <ControlStyle Width="100%" />
                                            <HeaderStyle Width="15%" />
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="vchProveedor" HeaderText="Proveedor">
                                            <ControlStyle Width="100%" />
                                            <HeaderStyle Width="15%" />
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="vchCapacitacion" HeaderText="Capacitación">
                                            <ControlStyle Width="100%" />
                                            <HeaderStyle Width="15%" />
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="intHoras" HeaderText="Horas">
                                            <ControlStyle Width="100%" />
                                            <HeaderStyle Width="15%" />
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Num_Participantes" HeaderText="N° Participantes">
                                            <ControlStyle Width="100%" />
                                            <HeaderStyle Width="15%" />
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbDetalleCapacitacion" runat="server" CausesValidation="False"
                                                    CommandName="Detalle" CommandArgument='<%# Container.DataItemIndex %>' Text="Detalle"
                                                    ToolTip="Ver Detalle"><span>Detalle</span></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="2%" />
                                            <ItemStyle HorizontalAlign="Center" Width="2%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbFacturaCapacitacion" runat="server" CausesValidation="False"
                                                    CommandName="Factura" CommandArgument='<%# Container.DataItemIndex %>' Text="Factura"
                                                    ToolTip="Ver Factura"><span>Facturación</span></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="2%" />
                                            <ItemStyle HorizontalAlign="Center" Width="2%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbValorCapacitacion" runat="server" CausesValidation="False"
                                                    CommandName="ValorC" CommandArgument='<%# Container.DataItemIndex %>' Text="Valor Curso"
                                                    ToolTip="Ver Valor Curso"><span>Valor Capacitación</span></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="2%" />
                                            <ItemStyle HorizontalAlign="Center" Width="2%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="mes" HeaderText="Mes" />
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
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlAnnoPeriodo" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
