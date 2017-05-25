<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="asignarcompetencias.aspx.cs" Inherits="Proyecto.asignarcompetencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Asignar Competencias
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="formularios.aspx"><span class="icon-list"></span>&nbsp;Formularios</a></li>
            <li class="active"><a href="#asignarcompetencias" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Asignar Competencias</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="asignarcompetencias">
                <table width="50%">
                    <tr>
                        <td colspan="2">
                            <p class="title">
                                Asignación - Formularios/Competencias
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40%">
                            <asp:Label ID="lblAsigFormulario" runat="server" Text="Formulario"></asp:Label>
                        </td>
                        <td style="width: 60%">
                            <asp:DropDownList ID="ddlFormularios" runat="server" AppendDataBoundItems="true"
                                Width="100%" OnSelectedIndexChanged="ddlFormularios_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="0" Text="Seleccione Formulario"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <p class="title">
                    Competencias Asignadas por Formulario</p>
                <asp:UpdatePanel ID="upCompetencias" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvCompetencias" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" AllowPaging="True"
                            PageSize="100" EmptyDataText="No hay competencias asociadas." OnDataBound="gvCompetencia_DataBound"
                            Font-Size="Small">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="existe">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="intIDCompetencia">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchCompetencia" HeaderText="Competencia">
                                    <HeaderStyle Width="20%" />
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="txtDescCompetencia" HeaderText="Descripción">
                                    <HeaderStyle Width="50%" />
                                    <ItemStyle Width="50%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchTipoCompetencia" HeaderText="Tipo">
                                    <HeaderStyle Width="20%" />
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="formulario">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="¿Asignar?">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="rb1" runat="server" GroupName="Asignacion" 
                                            oncheckedchanged="rb1_CheckedChanged" AutoPostBack="true" />
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
                        <br />
                        <br />
                        <div align="center">
                        <asp:Button ID="btnVolver" runat="server" Text="Volver" 
                                CssClass="btn btn-default btneminmedium" onclick="btnVolver_Click" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlFormularios" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
