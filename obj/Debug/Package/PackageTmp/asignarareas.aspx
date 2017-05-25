<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="asignarareas.aspx.cs" Inherits="Proyecto.Scripts.asignarareas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Asignar Áreas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="areas.aspx"><span class="icon-list"></span>&nbsp;Áreas</a></li>
            <li><a href="gerencias.aspx"><span class="icon-list"></span>&nbsp;Gerencias</a></li>
            <li class="active"><a href="#asignarareas" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Asignar Áreas</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="asignarareas">
                <br />
                <table width="50%">
                    <tr>
                        <td colspan="2">
                            <p class="title">
                                Asignación - Áreas/Gerencias
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40%">
                            <asp:Label ID="lblAsigGerencia" runat="server" Text="Gerencia"></asp:Label>
                        </td>
                        <td style="width: 60%">
                            <asp:DropDownList ID="ddlGerencias" runat="server" AppendDataBoundItems="true" Width="100%"
                                OnSelectedIndexChanged="ddlGerencias_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="0" Text="Seleccione Gerencia"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <p class="title">
                    Áreas Asignadas por Gerencia</p>
                <asp:UpdatePanel ID="upAreas" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvAreas" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" AllowPaging="True"
                            PageSize="100" EmptyDataText="No hay áreas asociadas." OnDataBound="gvAreas_DataBound"
                            Font-Size="Small">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="existe">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intIDArea">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchArea" HeaderText="Área">
                                    <HeaderStyle Width="20%" />
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="txtDescArea" HeaderText="Descripción">
                                    <HeaderStyle Width="50%" />
                                    <ItemStyle Width="50%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="gerencia" HeaderText="Gerencia">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="¿Asignar?">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="rbAsignar" runat="server" GroupName="Asignacion" AutoPostBack="true"
                                            OnCheckedChanged="rbAsignar_CheckedChanged" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="mid" Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
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
                        <asp:AsyncPostBackTrigger ControlID="ddlGerencias" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <div align="center">
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" 
                        CssClass="btn btn-default btneminmedium" onclick="btnVolver_Click" />
                </div>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
