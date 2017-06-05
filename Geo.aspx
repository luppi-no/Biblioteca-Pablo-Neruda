<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="Geo.aspx.cs" Inherits="Proyecto.Geo" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Title">
    EMIN - Capacitaciones
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadScript">
    <script type="text/javascript">
        function checkDate(sender, args) {
            if (sender._selectedDate < new Date()) {
                alert("No puedes seleccionar una fecha anterior a la de hoy.");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }
    </script>
    <style type="text/css">
        .auto-style10 {
            display: inline-block;
            display: block;
            height: auto;
            max-width: 100%;
            padding: 4px;
            line-height: 1.428571429;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 4px;
            -webkit-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
            margin-top: 276;
            margin-bottom: 0;
        }

        .auto-style11 {
            height: 22px;
        }

        .auto-style12 {
            height: 31px;
        }

        .auto-style13 {
            height: 22px;
            text-align: left;
        }

        .auto-style14 {
            font-size: large;
            color: #FF0000;
        }

        .auto-style15 {
            width: 237px;
            height: 33px;
        }

        .auto-style17 {
            width: 518px;
        }

        .auto-style18 {
            width: 145px;
        }

        .auto-style19 {
            width: 122px;
        }

        .auto-style21 {
            width: 100%;
            background-color: #5D7B9D;
            color: White;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            border-radius: 15px;
            height: 41px;
            padding-top: 5px;
        }

        .auto-style22 {
            font-size: x-large;
            font-family: arial, Helvetica, sans-serif;
        }

        .auto-style23 {
            height: 29px;
        }
        .auto-style24 {
            width: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <div class="tab-content">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <img alt="" class="auto-style15" src="Imagenes/blanco33px.png" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <div class="tab-pane active" id="capacitaciones">
                <div align="center">
                    <p class="auto-style21">
                        <asp:Label ID="Label11" runat="server" CssClass="auto-style22" Text="Evaluación Geosintéticos "></asp:Label>
                    </p>
                </div>
                <br />
                <table class="nav-justified">
                    <tr>
                        <td class="auto-style19">


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
                                        <asp:Button ID="btnVolver7" runat="server" Text="Evaluación Geosintéticos" CssClass="btn btn-primary btneminlarge" PostBackUrl="~/Geo.aspx" Width="165px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                        <asp:Button ID="btnVolver6" runat="server" Text="Evaluación Maquinarias" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Maquinaria.aspx" Width="165px" />
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
                                    <td class="auto-style23">
                                        <strong>
                                            <asp:Label ID="lberrorrut" runat="server" CssClass="auto-style37" Style="font-size: large; color: #FF0000"></asp:Label>
                                        </strong>
                                        <asp:Label ID="Label1" runat="server" Text="Rut:"></asp:Label>
                                    </td>
                                    <td class="auto-style23">

                                        <asp:TextBox ID="tb_rut" runat="server" placeholder="EJ:12345678-9"  AutoPostBack="True" CssClass="thumbnail" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Fecha de Evaluación:"></asp:Label>
                                    </td>
                                    <td>

                                        <asp:TextBox ID="tb_fecha" runat="server" MaxLength="10" placeholder="DD/MM/AAAA" CssClass="auto-style10" ></asp:TextBox>

                                        <ajaxToolkit:CalendarExtender ID="tb_fecha_CalendarExtender" runat="server" BehaviorID="tb_fecha_CalendarExtender" TargetControlID="tb_fecha">
                                        </ajaxToolkit:CalendarExtender>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Equipo Evaluado:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_eqeva" runat="server" DataSourceID="equipoevaluado" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Marca de Equipo:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_maeq" runat="server" DataSourceID="marcageo" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Modelo de Equipo:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_moeq" runat="server" DataSourceID="modelogeo" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Superficie Evaluada:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_suev" runat="server" DataSourceID="Xmlsuperficie" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="Resultado de Evalucación Teórica:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dp_reevteo" runat="server" DataSourceID="resultado" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text="Resultado de Evaluación Práctica:"></asp:Label>
                                    </td>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="auto-style24">
                                        <asp:DropDownList ID="dp_reevpra" runat="server" CssClass="thumbnail" DataSourceID="resultado" DataTextField="name" DataValueField="name" AutoPostBack="True" OnSelectedIndexChanged="dp_reevpra_SelectedIndexChanged">
                                        </asp:DropDownList>
                                                </td>
                                                <td class="text-left">
                                        <asp:Label ID="nota" runat="server" CssClass="auto-style17"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Resultado Global:"></asp:Label>
                                    </td>
                                    <td class="text-left">
                                        <asp:DropDownList ID="dp_global" runat="server" DataSourceID="resultado2" DataTextField="name" DataValueField="name" CssClass="thumbnail" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="tb_nota" runat="server" Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">
                                        <asp:Label ID="Label10" runat="server" Text="Agregar PDF"></asp:Label>
                                    </td>
                                    <td class="auto-style12">
                                        <asp:FileUpload ID="fu_fileupload" runat="server" Width="146px" CssClass="thumbnail" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11"></td>
                                    <td class="auto-style13">
                                        <strong>
                                            <asp:Label ID="lbcampos" runat="server" CssClass="auto-style14"></asp:Label>
                                        </strong></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="Imagenes/zurb/fi-address-book.svg"></asp:XmlDataSource>
                                        <asp:XmlDataSource ID="Xmlsuperficie" runat="server" DataFile="~/xml/superficiegeo.xml"></asp:XmlDataSource>
                                    </td>
                                    <td class="text-left">
                                        <asp:Button ID="bt_agregasql" runat="server" Text="Agregar" CssClass="btn btn-primary btneminlarge" Height="44px" Style="font-size: large; font-weight: bold" Width="157px" OnClick="bt_agregasql_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT [rut], [nombre], [apellido] FROM [trabajador] WHERE (rut LIKE '%' + @rut + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT IDgeo, rut, fecha, eqeval, eqmarca, eqmodelo, suev, resevteo, resevpra, resglo, pdf, nota FROM geosinteticos WHERE (rut LIKE '%' + @rut + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>


                <asp:XmlDataSource ID="resultado" runat="server" DataFile="~/xml/unoacien.xml"></asp:XmlDataSource>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" InsertCommand="INSERT INTO geosinteticos(pdf, resglo, resevpra, resevteo, suev, eqeval, rut, fecha, eqmarca, eqmodelo, nota) VALUES (@pdf, @resglo, @resevpra, @resevteo, @suev, @eqeval, @rut, @fecha, @eqmarca, @eqmodelo, @nota)" SelectCommand="SELECT * FROM [geosinteticos]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="fu_fileupload" Name="pdf" PropertyName="FileBytes" />
                        <asp:ControlParameter ControlID="dp_global" Name="resglo" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_reevpra" Name="resevpra" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_reevteo" Name="resevteo" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_suev" Name="suev" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_eqeva" Name="eqeval" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tb_fecha" Name="fecha" PropertyName="Text" />
                        <asp:ControlParameter ControlID="dp_maeq" Name="eqmarca" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dp_moeq" Name="eqmodelo" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tb_nota" Name="nota" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>


                <asp:XmlDataSource ID="equipoevaluado" runat="server" DataFile="~/xml/equipogeo.xml"></asp:XmlDataSource>
                <asp:XmlDataSource ID="marcageo" runat="server" DataFile="~/xml/marcageo.xml"></asp:XmlDataSource>
                <asp:XmlDataSource ID="modelogeo" runat="server" DataFile="~/xml/modelogeo.xml"></asp:XmlDataSource>
                <asp:XmlDataSource ID="resultado2" runat="server" DataFile="~/xml/resultado.xml"></asp:XmlDataSource>
                <br />
                <!-- =========================================================================== MODAL CAPACITACION =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarCapacitacion" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Ver Evaluaciones" class="btn btn-primary btneminlarge" Visible="False" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeCapacitacion" runat="server" DropShadow="true"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pCapacitacion" BackgroundCssClass="modalBackground" />
                        <asp:Panel ID="pCapacitacion" runat="server" Style="display: none" CssClass="modalPopup">
                            <div class="header">
                                <p class="title">Historial de Evaluaciones</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>

                                        <td style="width: 75%; text-align: left">
                                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource6" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
                                                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                <Fields>
                                                    <asp:BoundField DataField="rut" HeaderText="Rut" SortExpression="rut" />
                                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                                                    <asp:BoundField DataField="apellido" HeaderText="Spellido" SortExpression="apellido" />
                                                </Fields>
                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                            </asp:DetailsView>
                                        </td>

                                    </tr>
                                    <tr>

                                        <td style="width: 75%">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDgeo" DataSourceID="SqlDataSource7" ForeColor="#333333" GridLines="None" Height="168px" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="rut" HeaderText="Rut" SortExpression="rut" />
                                                    <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                                                    <asp:BoundField DataField="eqeval" HeaderText="Equipo" SortExpression="eqeval" />
                                                    <asp:BoundField DataField="eqmarca" HeaderText="Marca" SortExpression="eqmarca" />
                                                    <asp:BoundField DataField="eqmodelo" HeaderText="Modelo" SortExpression="eqmodelo" />
                                                    <asp:BoundField DataField="suev" HeaderText="Superficie" SortExpression="suev" />
                                                    <asp:BoundField DataField="resevteo" HeaderText="Ev. Teorica" SortExpression="resevteo" />
                                                    <asp:BoundField DataField="resevpra" HeaderText="Ev. Practica" SortExpression="resevpra" />
                                                    <asp:BoundField DataField="resglo" HeaderText="Global" SortExpression="resglo" />
                                                    <asp:BoundField DataField="nota" HeaderText="Nota Final" SortExpression="nota" />
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
                                <asp:Button ID="btnCerrarCapacitaciones" runat="server" Text="Cerrar" class="btn btn-default btneminsmall" />
                                <input type="button" name="imprimir" value="Imprimir" class="btn btn-default btneminsmall" onclick="window.print();">
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== MODAL EDITAR CAPACITACION =========================================================================== -->
                <asp:UpdatePanel ID="upCapacitacionE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pCapacitacionE" runat="server" Style="display: none" CssClass="modalPopup">
                            <asp:HiddenField ID="hfCapacitacionE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeCapacitacionE" runat="server" DropShadow="true"
                                TargetControlID="hfCapacitacionE" PopupControlID="pCapacitacionE" BackgroundCssClass="modalBackground" />
                            <div class="header">
                                <p class="title">Historial de Evaluaciones</p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>

                                        <td style="width: 75%; text-align: left">
                                            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource6" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
                                                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                <Fields>
                                                    <asp:BoundField DataField="rut" HeaderText="Rut" SortExpression="rut" />
                                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                                                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                                                </Fields>
                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                            </asp:DetailsView>
                                        </td>

                                    </tr>
                                    <tr>

                                        <td style="width: 75%">
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDgeo" DataSourceID="SqlDataSource7" ForeColor="#333333" GridLines="None" Height="168px" Width="100%">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="rut" HeaderText="Rut" SortExpression="rut" />
                                                    <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                                                    <asp:BoundField DataField="eqeval" HeaderText="Equipo" SortExpression="eqeval" />
                                                    <asp:BoundField DataField="eqmarca" HeaderText="Marca" SortExpression="eqmarca" />
                                                    <asp:BoundField DataField="eqmodelo" HeaderText="Modelo" SortExpression="eqmodelo" />
                                                    <asp:BoundField DataField="suev" HeaderText="Superficie" SortExpression="suev" />
                                                    <asp:BoundField DataField="resevteo" HeaderText="Ev. Teorica" SortExpression="resevteo" />
                                                    <asp:BoundField DataField="resevpra" HeaderText="Ev. Practica" SortExpression="resevpra" />
                                                    <asp:BoundField DataField="resglo" HeaderText="Global" SortExpression="resglo" />
                                                    <asp:BoundField DataField="nota" HeaderText="Nota Final" SortExpression="nota" />
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
                                <asp:Button ID="btnCerrarCapacitacionesE" runat="server" Text="Cerrar" class="btn btn-default btneminsmall" />
                                <input type="button" name="imprimir" value="Imprimir" class="btn btn-default btneminsmall" onclick="window.print();">
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR CAPACITACION =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
