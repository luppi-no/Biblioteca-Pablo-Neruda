<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="historialevaluaciones.aspx.cs" Inherits="Proyecto.historialevaluaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Historial de Evaluaciones
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#historialevaluaciones" data-toggle="tab"><span class="icon-list"></span>
                &nbsp;Historial de Evaluaciones</a></li>
        </ul>
        <br />
        <div class="tab-content">
            <div class="tab-pane active" id="historialevaluaciones">
                <div align="center">
                    <p class="title">
                        Búsqueda - Historial de Evaluaciones
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblBuscar" runat="server" Text="Buscar:"></asp:Label>
                            <asp:TextBox ID="tbRut" runat="server" Width="15%" placeholder="Ingrese Rut a buscar"></asp:TextBox>
                            <asp:TextBox ID="tbNomEvaluado" runat="server" Width="15%" placeholder="Ingrese Nombre a buscar"></asp:TextBox>
                            <asp:TextBox ID="tbCargo" runat="server" Width="15%" placeholder="Ingrese Cargo a buscar"></asp:TextBox>
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
                <div align="center">
                    <p class="title">
                        Evaluados por Periodo</p>
                    <asp:UpdatePanel ID="upPeriodo" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblPeriodo" runat="server" Text="Periodo:"></asp:Label>
                            <asp:DropDownList ID="ddlAnnoPeriodo" runat="server" AppendDataBoundItems="true"
                                Width="10%" AutoPostBack="true" OnSelectedIndexChanged="ddlAnnoPeriodo_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlPeriodo" runat="server" Width="20%" OnSelectedIndexChanged="ddlPeriodo_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlAnnoPeriodo" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upCapacitacion" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvEvaluacionesFinalizadas" runat="server" ShowHeaderWhenEmpty="True"
                            AutoGenerateColumns="False" CellPadding="8" ForeColor="#333333" GridLines="None"
                            CssClass="grid" AllowPaging="True" Font-Size="Small" 
                            OnRowCommand="gvEvaluacionesFinalizadas_RowCommand" 
                            EmptyDataText="No existen registros asociados a este año y periodo especifico.">
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
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDetalleEvaluacion" runat="server" CausesValidation="False"
                                            CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' Text=""
                                            ToolTip="Ver Detalle del Evaluado"><span class="icon-zoom-in"></span></asp:LinkButton>
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
                        <br />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlPeriodo" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ddlAnnoPeriodo" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
