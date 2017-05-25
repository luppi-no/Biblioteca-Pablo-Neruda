<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="bulkmail.aspx.cs" Inherits="Proyecto.bulkmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Correos Masivos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li><a href="mail.aspx"><span class="icon-list">
            </span>&nbsp;Correos Personalizados</a></li>
            <li class="active"><a href="#correosmasivos" data-toggle="tab"><span class="icon-list"></span>&nbsp;Correos
                Masivos</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div class="tab-pane active" id="correosmasivos">
                <p class="title">
                    Notificaciones Masivas por Correo</p>
                <br />
                <table width="100%">
                    <tr>
                        <td style="width: 25%">
                        </td>
                        <td style="width: 15%">
                            <asp:Label ID="lblDestinatario" runat="server" Text="Destinatarios"></asp:Label>
                        </td>
                        <td style="width: 35%">
                            <asp:DropDownList ID="ddlDestinatarios" runat="server" Width="100%" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlDestinatarios_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="todos" Text="Todos los usuarios"></asp:ListItem>
                                <asp:ListItem Value="evaluadores" Text="Evaluadores"></asp:ListItem>
                                <asp:ListItem Value="evaluadorespend" Text="Evaluadores con Evaluaciones Pendientes"></asp:ListItem>
                                <asp:ListItem Value="evaluados" Text="Evaluados"></asp:ListItem>
                                <asp:ListItem Value="cc" Text="Centro de Costo"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 25%;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 25%">
                        </td>
                        <td style="width: 15%">
                            &nbsp;
                        </td>
                        <td style="width: 35%">
                            <asp:UpdatePanel ID="upCentroCosto" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlCentroCosto" runat="server" Width="100%" Visible="false">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlDestinatarios" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td style="width: 25%;">
                        </td>
                    </tr>                    
                </table>
                <br />
                <div align="center">
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
                                    Envío de Correo Masivo</p>
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
                                            <asp:RequiredFieldValidator ID="rfvAsunto" runat="server" ErrorMessage="(*)" ValidationGroup="vgCorreoMasivo"
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
                                            <asp:RequiredFieldValidator ID="rfvCuerpo" runat="server" ErrorMessage="(*)" ValidationGroup="vgCorreoMasivo"
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
                                <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall" OnClick="btnCerrar_Click" />
                                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary btneminsmall"
                                    CausesValidation="true" ValidationGroup="vgCorreoMasivo" OnClick="btnEnviar_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL CORREO =========================================================================== -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
