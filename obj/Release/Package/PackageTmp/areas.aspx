<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="areas.aspx.cs" Inherits="Proyecto.areas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Áreas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#areas" data-toggle="tab"><span class="icon-list"></span>
                &nbsp;Áreas</a></li>
            <li><a href="gerencias.aspx"><span class="icon-list"></span>&nbsp;Gerencias</a></li>
            <li><a href="asignarareas.aspx"><span class="icon-list"></span>&nbsp;Asignar Áreas</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="areas">
                <div align="center">
                    <p class="title">
                        Búsqueda - Áreas
                    </p>
                    <asp:UpdatePanel ID="upBuscar" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblArea" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="tbArea" runat="server" Width="30%" placeholder="Ingrese texto a buscar"></asp:TextBox>
                            <asp:LinkButton ID="lnkbBuscarArea" runat="server" OnClick="lnkbBuscarArea_Click"
                                CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiarArea" runat="server" OnClick="lnkbLimpiarArea_Click"
                                CssClass="btn btn-danger btneminmedium" Visible="False"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkbBuscarArea" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarArea" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="upAreas" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvAreas" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid" OnPageIndexChanging="gvAreas_PageIndexChanging"
                            AllowPaging="True" OnRowCommand="gvAreas_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="intIDArea" HeaderText="ID" ReadOnly="True">
                                    <HeaderStyle CssClass="hide" />
                                    <ItemStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="vchArea" HeaderText="Área">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="25%" />
                                    <ItemStyle Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="txtDescArea" HeaderText="Descripción">
                                    <ControlStyle Width="100%" />
                                    <HeaderStyle Width="50%" />
                                    <ItemStyle Width="50%" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Editar"
                                            Text="" ToolTip="Editar"><span class="icon-edit"></span></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="2%" />
                                    <ItemStyle HorizontalAlign="Center" Width="2%" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbDelete" runat="server" CausesValidation="False" CommandName="Eliminar"
                                            Text="" ToolTip="Borrar"><span class="icon-trash"></span></asp:LinkButton>
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
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvAreas" EventName="PageIndexChanging" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbBuscarArea" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="lnkbLimpiarArea" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <!-- =========================================================================== MODAL AREA =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarArea" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Nuevo Registro" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeAreas" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pAreas" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pAreas" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Área</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomArea" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomArea" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomArea" runat="server" ErrorMessage="(*)" ValidationGroup="vgAreas"
                                                ControlToValidate="tbNomArea"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescArea" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescArea" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescArea" runat="server" ErrorMessage="(*)" ValidationGroup="vgAreas"
                                                ControlToValidate="txtaDescArea"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lblObligatorioPeso" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarArea" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarArea_Click" />
                                <asp:Button ID="btnGuardarArea" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarArea_Click" CausesValidation="true" ValidationGroup="vgAreas" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL AREA =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR AREA =========================================================================== -->
                <asp:UpdatePanel ID="upAreasE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pAreasE" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfAreas" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeAreasE" runat="server" BackgroundCssClass="modalBackground"
                                TargetControlID="hfAreas" PopupControlID="pAreasE" DropShadow="true">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Área</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomAreaE" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomAreaE" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomAreaE" runat="server" ErrorMessage="(*)" ValidationGroup="vgAreasE"
                                                ControlToValidate="tbNomAreaE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescAreaE" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescAreaE" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescAreaE" runat="server" ErrorMessage="(*)" ValidationGroup="vgAreasE"
                                                ControlToValidate="txtaDescAreaE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lblObligatorioPesoE" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarAreaE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall"
                                    OnClick="btnCerrarAreaE_Click" />
                                <asp:Button ID="btnGuardarAreaE" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall"
                                    OnClick="btnGuardarAreaE_Click" CausesValidation="true" ValidationGroup="vgAreasE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR AREA =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
