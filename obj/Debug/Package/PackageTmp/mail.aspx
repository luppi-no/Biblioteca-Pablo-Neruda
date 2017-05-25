<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="mail.aspx.cs" Inherits="Proyecto.mail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Correo Personalizado
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#correospersonalizados" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Correos Personalizados</a></li>
            <li><a href="bulkmail.aspx"><span class="icon-list"></span>&nbsp;Correos Masivos</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="correospersonalizados">
                <p class="titlegrid">
                    Listado de Usuarios con Correo
                </p>
                <div class="gvscroll">
                    <asp:UpdatePanel ID="upCorreo" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gvMailUsuario" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                CssClass="grid" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="vchRut" HeaderText="Rut" />
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                    <asp:BoundField DataField="vchMail" HeaderText="Correo" />
                                    <asp:TemplateField HeaderText="¿Destinatario?">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbDestinatario" runat="server" OnCheckedChanged="cbDestinatario_CheckedChanged"
                                                AutoPostBack="true" />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="mid" />
                                        <ItemStyle CssClass="mid" />
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
                    </asp:UpdatePanel>
                </div>
                <br />
                <!-- =========================================================================== MODAL CORREO =========================================================================== -->
                <asp:UpdatePanel ID="upCorreoPersonalizado" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnEnviarCorreo" runat="server" Text="Enviar Correo" CssClass="btn btn-primary btneminlarge" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeCorreoPersonalizado" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnEnviarCorreo" PopupControlID="pCorreoPersonalizado" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pCorreoPersonalizado" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Envío de Correo Personalizado</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblAsunto" runat="server" Text="* Asunto:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbAsunto" runat="server" Width="100%" placeholder="Ingresar Asunto"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvAsunto" runat="server" ErrorMessage="(*)" ValidationGroup="vgCorreoPersonalizado"
                                                ControlToValidate="tbAsunto"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblCuerpo" runat="server" Text="* Cuerpo:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaCuerpo" runat="server" cols="20" rows="5" style="width: 100%" placeholder="Ingresar Cuerpo"
                                                class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvCuerpo" runat="server" ErrorMessage="(*)" ValidationGroup="vgCorreoPersonalizado"
                                                ControlToValidate="txtaCuerpo"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lblObligatorio" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall" />
                                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary btneminsmall"
                                    CausesValidation="true" ValidationGroup="vgCorreoPersonalizado" OnClick="btnEnviar_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL CORREO =========================================================================== -->
                <br />
            </div>
        </div>
    </div>
</asp:Content>
