<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="Maquinaria.aspx.cs" Inherits="Proyecto.cargos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Cargos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style type="text/css">
        .auto-style9 {
            width: 237px;
            height: 33px;
        }

        .auto-style10 {
            width: 113px;
            height: 300px;
        }

        .auto-style11 {
            font-family: arial, Helvetica, sans-serif;
            font-size: x-large;
        }

        .auto-style12 {
            width: 100%;
            background-color: #5D7B9D;
            color: White;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            border-radius: 15px;
            height: 36px;
            padding-top: 5px;
        }

        .auto-style13 {
            height: 29px;
        }

        .auto-style15 {
            width: 100%;
            height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <div class="tab-content">
            <asp:Panel ID="Panel1" runat="server">
                <img alt="" class="auto-style9" src="Imagenes/blanco33px.png" />
            </asp:Panel>
            <br />
            <div class="tab-pane active" id="cargos">
                <div align="center">
                    <p class="auto-style12">
                        <asp:Label ID="Label23" runat="server" CssClass="auto-style11" Text="Evaluación de Maquinarias"></asp:Label>
                    </p>
                </div>
                <br />
                <table class="auto-style15">
                    <tr>
                        <td class="auto-style10">


                            <table class="nav-justified">
                                <tr>
                                    <td>
                                        <p class="title">
                                            Menú
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Button ID="btnVolver9" runat="server" Text="Ingreso" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Ingreso.aspx" Width="165px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Button ID="btnVolver8" runat="server" Text="Evaluación Psicolaboral" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Evaluaciones.aspx" Width="165px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Button ID="btnVolver7" runat="server" Text="Evaluación Geosintéticos" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Geo.aspx" Width="165px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Button ID="btnVolver6" runat="server" Text="Evaluación Maquinarias" CssClass="btn btn-primary btneminlarge" PostBackUrl="~/Maquinaria.aspx" Width="165px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Button ID="btnVolver5" runat="server" Text="Reportes" CssClass="btn btn-default btneminlarge" PostBackUrl="~/menuinforme.aspx" Width="165px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Button ID="btnVolver4" runat="server" Text="Buscar" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Buscar.aspx" Width="165px" />
                                    </td>
                                </tr>
                            </table>

                        </td>
                        <td>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <strong>
                                            <asp:Label ID="lberrorrut" runat="server" CssClass="auto-style37" Style="font-size: large; color: #FF0000"></asp:Label>
                                        </strong>
                                        <asp:Label ID="Label21" runat="server" Text="RUT" CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td>

                                        <asp:TextBox ID="tb_rut" runat="server" required="true" placeholder="EJ:12345678-9" AutoPostBack="True" CssClass="thumbnail" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Fecha Evaluación: " CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDate" runat="server" MaxLength="10" required="true" placeholder="dd/mm/aaaa" CssClass="thumbnail"></asp:TextBox>

                                        <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" runat="server" BehaviorID="txtDate_CalendarExtender" TargetControlID="txtDate">
                                        </ajaxToolkit:CalendarExtender>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="Especialidad: " CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_especialidad" runat="server" DataSourceID="Especialidad" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="Equipo Evaluado: " CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_evaluado" runat="server" DataSourceID="equipo" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="Marca Equipo: " CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_marcaequipo" runat="server" DataSourceID="marcas" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="Modelo Equipo: " CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_modeloequipo" runat="server" DataSourceID="Modelo" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label17" runat="server" Text="Categoría: " CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_categoria" runat="server" DataSourceID="Categoriamaquinaria" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style28">
                                        <asp:Label ID="Label18" runat="server" Text="Resultado Eval. Teórica: " CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td class="auto-style28">
                                        <asp:DropDownList ID="dp_reevte" runat="server" DataSourceID="notas" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label19" runat="server" Text="Resultado Eval. Práctica: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_reevpr" runat="server" DataSourceID="notas" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label20" runat="server" Text="Resultado Global: " CssClass="auto-style26"></asp:Label>
                                    </td>
                                    <td class="text-left">
                                        <asp:DropDownList ID="dp_reglobal" runat="server" DataSourceID="notas" DataTextField="name" DataValueField="name" CssClass="thumbnail" AutoPostBack="True" OnSelectedIndexChanged="dp_reglobal_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="tb_aprobado" runat="server" Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style13">
                                        <asp:Label ID="Label22" runat="server" Text="Adjuntar Archivo:" CssClass="auto-style25"></asp:Label>
                                    </td>
                                    <td class="auto-style13">
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="thumbnail" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="text-left">
                                        <strong>
                                            <asp:Label ID="lbcampos" runat="server" CssClass="auto-style20" Style="font-size: large; color: #FF0000"></asp:Label>
                                        </strong></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="text-left">

                                        <asp:Button ID="bt_agregasql" runat="server" Text="Guardar" CssClass="btn btn-primary btneminlarge" Height="44px" Style="font-size: large; font-weight: bold" Width="157px" OnClick="bt_agregasql_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
                <!-- =========================================================================== MODAL CARGO =========================================================================== -->
                <asp:XmlDataSource ID="Categoriamaquinaria" runat="server" DataFile="~/xml/categoriasmaquinaria.xml"></asp:XmlDataSource>


                <asp:XmlDataSource ID="equipo" runat="server" DataFile="~/xml/Equipomaquinaria.xml"></asp:XmlDataSource>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" InsertCommand="INSERT INTO maquinaria(pdf, revapra, revateo, categoria, moeq, maeq, eqeva, especialidad, rut, fecha, resultado, nota) VALUES (@pdf, @revapra, @revateo, @categoria, @moeq, @maeq, @eqeva, @especialidad, @rut, @fecha, @resultado,@nota)" SelectCommand="SELECT * FROM [maquinaria]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="FileUpload1" Name="pdf" PropertyName="FileBytes" />
                        <asp:ControlParameter ControlID="dp_reglobal" Name="reglo" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_reevpr" Name="revapra" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_reevte" Name="revateo" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_categoria" Name="categoria" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_modeloequipo" Name="moeq" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_marcaequipo" Name="maeq" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_evaluado" Name="eqeva" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_especialidad" Name="especialidad" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDate" Name="fecha" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tb_aprobado" Name="resultado" PropertyName="Text" />
                        <asp:ControlParameter ControlID="dp_reglobal" Name="nota" PropertyName="SelectedIndex" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:XmlDataSource ID="Especialidad" runat="server" DataFile="~/xml/Especialidad.xml"></asp:XmlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT nombre, apellido, rut FROM trabajador WHERE (rut LIKE '%' + @rut + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT IDmaquinaria, rut, fecha, especialidad, eqeva, maeq, moeq, categoria, revateo, revapra, reglo, pdf FROM maquinaria WHERE (rut LIKE '%' + @rut + '%')" OnSelecting="SqlDataSource2_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:XmlDataSource ID="marcas" runat="server" DataFile="~/xml/marcamaquinaria.xml"></asp:XmlDataSource>
                <asp:XmlDataSource ID="Modelo" runat="server" DataFile="~/xml/modelomaquina.xml"></asp:XmlDataSource>
                <asp:XmlDataSource ID="notas" runat="server" DataFile="~/xml/unoasiete.xml"></asp:XmlDataSource>
                <asp:UpdatePanel ID="upCargosI" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Ver Evaluaciones" CssClass="btn btn-primary btneminlarge" Visible="False" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeCargos" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pCargo" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pCargo" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Historial de Evaluaciones
                                </p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>

                                        <td style="width: 75%; text-align: left">
                                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
                                                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                <Fields>
                                                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                                                    <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                                                    <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                                                </Fields>
                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                            </asp:DetailsView>
                                        </td>

                                    </tr>
                                    <tr>

                                        <td style="width: 75%">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDmaquinaria" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="168px" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="IDmaquinaria" HeaderText="IDmaquinaria" SortExpression="IDmaquinaria" InsertVisible="False" ReadOnly="True" />
                                                    <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                                                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                                                    <asp:BoundField DataField="especialidad" HeaderText="especialidad" SortExpression="especialidad" />
                                                    <asp:BoundField DataField="eqeva" HeaderText="eqeva" SortExpression="eqeva" />
                                                    <asp:BoundField DataField="maeq" HeaderText="maeq" SortExpression="maeq" />
                                                    <asp:BoundField DataField="moeq" HeaderText="moeq" SortExpression="moeq" />
                                                    <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                                                    <asp:BoundField DataField="revateo" HeaderText="revateo" SortExpression="revateo" />
                                                    <asp:BoundField DataField="revapra" HeaderText="revapra" SortExpression="revapra" />
                                                    <asp:BoundField DataField="reglo" HeaderText="reglo" SortExpression="reglo" />
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </td>

                                    </tr>

                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarCargo" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall" />
                                <input type="button" name="imprimir" value="Imprimir" class="btn btn-default btneminsmall" onclick="window.print();">
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL CARGO =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR CARGO =========================================================================== -->
                <asp:UpdatePanel ID="upCargoE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pCargoE" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfCargoE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeCargoE" runat="server" BackgroundCssClass="modalBackground"
                                TargetControlID="hfCargoE" PopupControlID="pCargoE" DropShadow="true">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Historial de Evaluaciones
                                </p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>

                                        <td style="width: 75%; text-align: left">
                                            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
                                                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                <Fields>
                                                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                                                    <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                                                    <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                                                </Fields>
                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                            </asp:DetailsView>
                                        </td>

                                    </tr>
                                    <tr>

                                        <td style="width: 75%">
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDmaquinaria" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="168px" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="IDmaquinaria" HeaderText="IDmaquinaria" SortExpression="IDmaquinaria" InsertVisible="False" ReadOnly="True" />
                                                    <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                                                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                                                    <asp:BoundField DataField="especialidad" HeaderText="especialidad" SortExpression="especialidad" />
                                                    <asp:BoundField DataField="eqeva" HeaderText="eqeva" SortExpression="eqeva" />
                                                    <asp:BoundField DataField="maeq" HeaderText="maeq" SortExpression="maeq" />
                                                    <asp:BoundField DataField="moeq" HeaderText="moeq" SortExpression="moeq" />
                                                    <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                                                    <asp:BoundField DataField="revateo" HeaderText="revateo" SortExpression="revateo" />
                                                    <asp:BoundField DataField="revapra" HeaderText="revapra" SortExpression="revapra" />
                                                    <asp:BoundField DataField="reglo" HeaderText="reglo" SortExpression="reglo" />
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </td>

                                    </tr>

                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarCargoE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall" />
                                <input type="button" name="imprimir" value="Imprimir" class="btn btn-default btneminsmall" onclick="window.print();">
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR CARGO =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
