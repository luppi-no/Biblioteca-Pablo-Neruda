<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="formularioevaluacion.aspx.cs" Inherits="Proyecto.formularioevaluacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Formulario de Evaluación
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <script type="text/javascript">
        function RefreshUpdatePanel() {
            __doPostBack('<%= tbObservacion.ClientID %>', '');
        };
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <%--<li><a id="inicio" runat="server" href=""><span class="icon-home"></span>&nbsp;Menú
                Principal</a></li>
            <li id="admevaluaciones" runat="server"><a href="admevaluaciones.aspx"><span class="icon-list">
            </span>&nbsp;Todas las Evaluaciones</a></li>
            <li><a id="evaluaciones" runat="server" href=""><span class="icon-list"></span>&nbsp;Mis
                Evaluaciones</a></li>--%>
            <li class="active"><a href="#formularioevaluacion" data-toggle="tab"><span class="icon-list">
            </span>&nbsp;Formulario de Evaluación</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="formularioevaluacion">
                <br />
                <div id="divPrint">
                    <p class="titlegrid">
                        Información</p>
                    <asp:GridView ID="gvDatos" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        CssClass="grid" ForeColor="#333333" GridLines="None" OnDataBound="gvDatos_DataBound"
                        Font-Size="Small">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="evaluador" HeaderText="Evaluador">
                                <HeaderStyle Width="17.5%" />
                                <ItemStyle Width="17.5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="evaluado" HeaderText="Evaluado">
                                <HeaderStyle Width="17.5%" />
                                <ItemStyle Width="17.5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="formulario" HeaderText="Formulario">
                                <HeaderStyle Width="17.5%" />
                                <ItemStyle Width="17.5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="observacion" NullDisplayText=" " ControlStyle-CssClass="hide"
                                HeaderStyle-CssClass="hide" FooterStyle-CssClass="hide" HtmlEncode="False" HtmlEncodeFormatString="False">
                                <ControlStyle CssClass="hide"></ControlStyle>
                                <FooterStyle CssClass="hide"></FooterStyle>
                                <HeaderStyle CssClass="hide" Width="0px" />
                                <ItemStyle CssClass="hide" Width="0px" Wrap="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="deacuerdo">
                                <HeaderStyle CssClass="hide" Width="0px" />
                                <ItemStyle CssClass="hide" Width="0px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="areacentrocosto" HeaderText="Área / C.C">
                                <HeaderStyle Width="30%" />
                                <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha" HeaderText="Fecha de Termino">
                                <HeaderStyle Width="17.5%" />
                                <ItemStyle Width="17.5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="aporte" HeaderText="Nota" />
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
                    <p class="titlegrid">
                        Formulario</p>
                    <asp:GridView ID="gvFormularioEvaluacion" runat="server" AutoGenerateColumns="False"
                        CellPadding="4" CssClass="grid" ForeColor="#333333" GridLines="None" DataKeyNames="intIDCompetencia"
                        OnDataBound="gvFormularioEvaluacion_DataBound" Font-Size="Small">
                        <AlternatingRowStyle BackColor="#FFFFCC" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="intIDCompetencia" ConvertEmptyStringToNull="False" NullDisplayText="vacio"
                                HtmlEncode="False">
                                <HeaderStyle CssClass="hide" Width="0px" />
                                <ItemStyle CssClass="hide" Width="0px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="intIDNotaCompetencia" ConvertEmptyStringToNull="False"
                                NullDisplayText="vacio" HtmlEncode="False">
                                <ControlStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" Width="0px" />
                                <ItemStyle CssClass="hide" Width="0px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vchCompetencia" HeaderText="Competencia">
                                <HeaderStyle Width="25%" />
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="txtDescCompetencia" HeaderText="Descripción">
                                <HeaderStyle Width="50%" />
                                <ItemStyle Width="50%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Casi Nunca">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rb1" runat="server" GroupName="eva" />
                                </ItemTemplate>
                                <HeaderStyle Width="5%" CssClass="mid" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="A Veces">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rb2" runat="server" GroupName="eva" />
                                </ItemTemplate>
                                <HeaderStyle Width="5%" HorizontalAlign="Center" CssClass="mid" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" CssClass="mid" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Normalmente">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rb3" runat="server" GroupName="eva" />
                                </ItemTemplate>
                                <HeaderStyle Width="5%" CssClass="mid" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" CssClass="mid" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Casi Siempre">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rb4" runat="server" GroupName="eva" />
                                </ItemTemplate>
                                <HeaderStyle Width="5%" CssClass="mid" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" CssClass="mid" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Siempre">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rb5" runat="server" GroupName="eva" />
                                </ItemTemplate>
                                <HeaderStyle Width="5%" HorizontalAlign="Center" CssClass="mid" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
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
                    <asp:UpdatePanel ID="uptest" runat="server">
                        <ContentTemplate>
                            <p class="titlegrid">
                                Comentario (50 caracteres mínimos) -
                                <asp:Label ID="lblContador" runat="server" Text="0"></asp:Label>
                            caracteres.
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="tbObservacion" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    </p>
                    <asp:TextBox ID="tbObservacion" runat="server" TextMode="MultiLine" OnTextChanged="txtExample_TextChanged"
                        AutoPostBack="true" onkeyup="RefreshUpdatePanel();" CssClass="grid lock" />
                    <br />
                    <br />
                    <div id="feedback" runat="server">
                        <p class="titlegrid">
                            Retroalimentación</p>
                        <table width="100%">
                            <tr>
                                <td style="width: 80%">
                                    <asp:Label ID="lblPreguntaEvaluado" runat="server" Text="¿Tu jefe realizó la reunión de retroalimentación?"></asp:Label>
                                </td>
                                <td style="width: 10%">
                                    <asp:RadioButton ID="rbRespuestaSI" runat="server" Text="&nbsp;SI" GroupName="respuesta" />
                                </td>
                                <td style="width: 10%">
                                    <asp:RadioButton ID="rbREspuestaNO" runat="server" Text="&nbsp;NO" GroupName="respuesta" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br />
                <div align="center">
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-default btneminsmall"
                        OnClick="btnVolver_Click" />
                    <asp:Button ID="btnGuardarFormulario" runat="server" Text="Guardar" OnClick="btnGuardarFormulario_Click"
                        CssClass="btn btn-primary btneminsmall" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
