<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="asignarevaluadores.aspx.cs" Inherits="Proyecto.asignarevaluadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Asignar Evaluadores
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="usuarios.aspx"><span class="icon-list"></span>&nbsp;Usuarios</a></li>
            <li class="active"><a href="#asignarevaluadores" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Asignar Evaluadores</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="asignarevaluadores">
                <table width="50%">
                    <tr>
                        <td colspan="2">
                            <p class="title">
                                Asignación - Evaluadores/Evaluados</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40%">
                            <asp:Label ID="lPeriodo" runat="server" Text="Periodo"></asp:Label>
                        </td>
                        <td style="width: 55%">
                            <asp:DropDownList ID="ddlPeriodo" runat="server" Width="100%" AppendDataBoundItems="true"
                                OnSelectedIndexChanged="ddlPeriodo_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Selected="True" Value="0" Text="Seleccione Periodo"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 5%">
                            <asp:RequiredFieldValidator ID="rfvPeriodo" runat="server" ControlToValidate="ddlPeriodo"
                                InitialValue="0" ErrorMessage="(*)" ValidationGroup="vgPeriodo"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40%">
                            <asp:Label ID="lblEvaluador" runat="server" Text="Evaluador"></asp:Label>
                        </td>
                        <td style="width: 60%">
                            <asp:UpdatePanel ID="upUsuariosEvaluador" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlEvaluador" runat="server" AppendDataBoundItems="true" AutoPostBack="true"
                                        Width="100%" OnSelectedIndexChanged="ddlEvaluador_SelectedIndexChanged" Enabled="False">
                                        <asp:ListItem Selected="True" Value="0" Text="Seleccione Evaluador"></asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlPeriodo" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40%">
                            <asp:Label ID="lblUsuariosDesplegar" runat="server" Text="Usuarios a desplegar"></asp:Label>
                        </td>
                        <td style="width: 60%">
                            <asp:UpdatePanel ID="upUsuariosDesplegar" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlUsuariosDesplegar" runat="server" AutoPostBack="true" Width="100%"
                                        OnSelectedIndexChanged="ddlUsuariosDesplegar_SelectedIndexChanged" Enabled="False">
                                        <asp:ListItem Selected="True" Value="0" Text="Seleccione Usuarios a Desplegar"></asp:ListItem>
                                        <asp:ListItem Value="todos" Text="Todos"></asp:ListItem>
                                        <asp:ListItem Value="cc" Text="Centro de Costo"></asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlEvaluador" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40%">
                            &nbsp;
                        </td>
                        <td style="width: 60%">
                            <asp:UpdatePanel ID="upCentroCosto" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlCentroCosto" runat="server" AutoPostBack="true" Width="100%"
                                        Visible="false" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCentroCosto_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="0" Text="Seleccione Centro de Costo"></asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlUsuariosDesplegar" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <table width="100%">
                    <tr>
                        <td style="width: 48%;">
                            <p class="titlegrid">
                                Listado de Usuarios</p>
                            <div class="gvscroll2">
                                <asp:UpdatePanel ID="upUsuarios2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvUsuarios2" runat="server" CssClass="grid" EmptyDataText="No hay usuarios asociados."
                                            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None"
                                            OnRowCommand="gvUsuarios2_RowCommand">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:BoundField DataField="vchRut" HeaderText="Rut">
                                                    <HeaderStyle Width="10%" />
                                                    <ItemStyle Width="10%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre">
                                                    <HeaderStyle Width="45%" />
                                                    <ItemStyle Width="45%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="vchMail" HeaderText="Correo">
                                                    <HeaderStyle Width="13%" />
                                                    <ItemStyle Width="13%" />
                                                </asp:BoundField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkSelect" runat="server" CausesValidation="true" ValidationGroup="vgPeriodo"
                                                            CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' Text=""
                                                            ToolTip="Asignar Evaluado"><span class="icon-double-angle-right"></span></asp:LinkButton>
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
                                        <asp:AsyncPostBackTrigger ControlID="ddlUsuariosDesplegar" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="ddlCentroCosto" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                        <td style="width: 4%;">
                        </td>
                        <td style="width: 48%;">
                            <p class="titlegrid">
                                Usuarios asignados por evaluador</p>
                            <asp:UpdatePanel ID="upUsuariosAsignados" runat="server">
                                <ContentTemplate>
                                    <div class="gvscroll2">
                                        <asp:GridView ID="gvUsuariosAsignados" runat="server" CssClass="grid" EmptyDataText="No hay usuarios asociados."
                                            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None"
                                            OnRowDeleting="gvUsuariosAsignados_RowDeleting">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:BoundField DataField="vchRut" HeaderText="Rut">
                                                    <HeaderStyle Width="10%" />
                                                    <ItemStyle Width="10%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre">
                                                    <HeaderStyle Width="45%" />
                                                    <ItemStyle Width="45%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="vchMail" HeaderText="Correo">
                                                    <HeaderStyle Width="13%" />
                                                    <ItemStyle Width="13%" />
                                                </asp:BoundField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkbDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                            Text="" ToolTip="Eliminar"><span class="icon-trash"></span></asp:LinkButton>
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
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlEvaluador" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="gvUsuarios2" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
