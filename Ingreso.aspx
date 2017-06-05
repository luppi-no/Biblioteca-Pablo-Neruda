<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Ingreso.aspx.cs" Inherits="Proyecto.WebForm1" %>

<%@ Register Assembly="Tde.Controles.RutTextBox" Namespace="Tde.Controles" TagPrefix="tde" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style>
        a, a:hover {
            text-decoration: none;
        }

        /**********/

        ul#navWrapper {
            border: 0 black dashed;
            margin-left: 0px;
            float: left;
            width: 1384px;
        }

            ul#navWrapper li {
                border: 0 red dashed;
                float: left;
                list-style: none;
                margin-right: 0.75em;
                background-color: #DDD;
                padding: 0 0.25em;
                border-radius: 6px;
                box-shadow: 3px 3px 6px 1px #333;
                width: 190px;
                font: 200%;
            }

                ul#navWrapper li li {
                    border: 0 blue dashed;
                    float: none;
                    margin-left: -44px;
                    margin-top: 3px;
                }

                    ul#navWrapper li li:first-child {
                        margin-top: 4px;
                    }

            ul#navWrapper ul {
                display: none;
                position: absolute;
                background-color: #FFF; /* For non-CSS3 browsers. */
                background-color: rgba(255, 255, 255, 0);
            }

            ul#navWrapper li:hover ul {
                display: block;
            }

            ul#navWrapper a {
                font-weight: 700;
            }

            ul#navWrapper li:hover {
                background-color: #d2d3d8;
            }

        /**********/

        div#banner {
            border: 1px black solid;
            border-radius: 4px;
            clear: both;
            height: 4em;
            background-color: rgb(85, 126, 185); /* For non-CSS3 browsers. */
            background-image: -webkit-radial-gradient(100% 0%, circle cover, rgb(104,24,136) 0%, rgb(85,126,185) 100%);
            background-image: radial-gradient(circle at 100% 0%, rgb(104,24,136) 0%, rgb(85,126,185) 100%); /* IE10 and later */
        }

        .auto-style8 {
            height: 63px;
            text-align: left;
        }

        .auto-style21 {
            height: 63px;
            text-align: left;
            font-weight: bold;
            font-size: medium;
            margin-right: 5px;
        }

        .auto-style23 {
            width: 19px;
            text-align: left;
        }

        .auto-style27 {
            width: 227px;
            text-align: right;
        }

        .auto-style30 {
            width: 227px;
            text-align: right;
            height: 26px;
        }

        .auto-style31 {
            text-align: left;
            height: 26px;
        }

        .auto-style32 {
            width: 227px;
            text-align: right;
            height: 11px;
        }

        .auto-style33 {
            text-align: left;
            height: 11px;
        }

        .auto-style34 {
            height: 41px;
        }

        .auto-style35 {
            height: 63px;
            text-align: center;
            font-weight: bold;
            font-size: medium;
            margin-right: 5px;
        }

        .auto-style36 {
            color: #FF0000;
            font-size: large;
        }

        .auto-style38 {
            height: 40px;
        }

        .auto-style40 {
            width: 237px;
            height: 33px;
        }

        .auto-style46 {
            height: 41px;
            text-align: right;
        }

        .auto-style47 {
            width: 100%;
            background-color: #5D7B9D;
            color: White;
            font-size: x-large;
            font-weight: bold;
            text-align: center;
            border-radius: 15px;
            height: 36px;
            padding-top: 5px;
            font-family: arial, Helvetica, sans-serif;
        }

        .auto-style49 {
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
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <br />
    <!-- Top Nav -->
    <asp:Panel ID="Panel2" runat="server">
        <img alt="" class="auto-style40" src="Imagenes/blanco33px.png" />
    </asp:Panel>
    <td>
        <p class="auto-style47">
            Ingreso de Libro
        </p>
    </td>
    <p>
    </p>
    <table style="width: 100%;">
        <tr>
            <td>
                <p>

                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style23">


                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <p class="title">
                                                Menú
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnVolver9" runat="server" Text="Ingreso" CssClass="btn btn-primary btneminlarge" PostBackUrl="~/Ingreso.aspx" Width="165px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnVolver8" runat="server" Text="Evaluación Psicolaboral" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Evaluaciones.aspx" Width="165px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnVolver7" runat="server" Text="Evaluación Geosintéticos" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Geo.aspx" Width="165px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnVolver6" runat="server" Text="Evaluación Maquinarias" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Maquinaria.aspx" Width="165px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnVolver5" runat="server" Text="Reportes" CssClass="btn btn-default btneminlarge" PostBackUrl="~/menuinforme.aspx" Width="165px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnVolver4" runat="server" Text="Buscar" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Buscar.aspx" Width="165px" />
                                        </td>
                                    </tr>
                                </table>


                            </td>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="auto-style11">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td class="auto-style27">
                                                        &nbsp;</td>
                                                    <td class="text-left">

                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style27">
                                                        <asp:Label ID="Label2" runat="server" Text="Nombre:"></asp:Label>
                                                    </td>
                                                    <td class="text-left">
                                                        <asp:TextBox ID="tb_nombre" runat="server" CssClass="thumbnail"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style30">
                                                        <asp:Label ID="Label4" runat="server" Text="Autor:"></asp:Label>
                                                    </td>
                                                    <td class="auto-style31">
                                                        <asp:TextBox ID="tb_autor" runat="server" CssClass="thumbnail"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style30">
                                                        <asp:Label ID="Label3" runat="server" Text="Fecha de publicación:"></asp:Label>
                                                    </td>
                                                    <td class="auto-style31">
                                                        <asp:TextBox ID="tb_fnac" runat="server" placeholder="DD/MM/AAAA" MaxLength="10" CssClass="thumbnail" OnTextChanged="tb_fnac_TextChanged" AutoPostBack="True"></asp:TextBox>

                                                        <ajaxToolkit:CalendarExtender ID="tb_fnac_CalendarExtender" runat="server" BehaviorID="tb_fnac_CalendarExtender" TargetControlID="tb_fnac">
                                                        </ajaxToolkit:CalendarExtender>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style27">
                                                        <asp:Label ID="Label5" runat="server" Text="Codigo Libro:"></asp:Label>
                                                    </td>
                                                    <td class="text-left">
                                                        <asp:TextBox ID="tb_codigo" runat="server" CssClass="thumbnail"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style27">
                                                        <asp:Label ID="Label6" runat="server" Text="Editorial:"></asp:Label>
                                                    </td>
                                                    <td class="text-left">
                                                        <asp:TextBox ID="tb_editorial" runat="server" CssClass="thumbnail"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style27">
                                                        <asp:Label ID="Label7" runat="server" Text="Codigo Biblioteca:"></asp:Label>
                                                    </td>
                                                    <td class="text-left">
                                                        <asp:TextBox ID="tb_numfijo" runat="server" CssClass="thumbnail" placeholder="55 2234 5678"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style27">
                                                        <asp:Label ID="Label8" runat="server" Text="Ilustrador:"></asp:Label>
                                                    </td>
                                                    <td class="text-left">
                                                        <asp:TextBox ID="tb_nummovil" runat="server" CssClass="thumbnail" placeholder="9234 5678"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style27">
                                                        <asp:Label ID="Label24" runat="server" Text="Tipo:"></asp:Label>
                                                    </td>
                                                    <td class="text-left">
                                                        <asp:TextBox ID="tb_nummovil0" runat="server" CssClass="thumbnail" placeholder="9234 5678"></asp:TextBox>
                                                        <td class="text-left">
                                                            &nbsp;</td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style32">
                                                        &nbsp;</td>
                                                    <td class="auto-style33">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style27">
                                                        &nbsp;</td>
                                                    <td class="text-left">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td class="auto-style27">
                                                        &nbsp;</td>
                                                    <td class="auto-style13" style="text-align: left">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="auto-style11">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td class="text-right">
                                                        <asp:Label ID="Label21" runat="server" Text="Foto:"></asp:Label>
                                                    </td>
                                                    <td class="text-left">
                                                        <asp:FileUpload ID="fu_foto" runat="server" CssClass="thumbnail" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style30">
                                                        &nbsp;</td>
                                                    <td class="auto-style31">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right">
                                                        <asp:Label ID="Label20" runat="server" Text="Area:"></asp:Label>
                                                    </td>
                                                    <td class="text-left">
                                                        <asp:DropDownList ID="dp_area" runat="server" DataSourceID="SqlArea" DataTextField="area" DataValueField="IDarea" CssClass="thumbnail">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right">
                                                        &nbsp;</td>
                                                    <td class="text-left">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right">
                                                        &nbsp;</td>
                                                    <td class="text-left">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right">
                                                        &nbsp;</td>
                                                    <td class="text-left">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right">
                                                        &nbsp;</td>
                                                    <td class="text-left">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right">
                                                        &nbsp;</td>
                                                    <td class="text-left">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style17" style="text-align: right">
                                                        &nbsp;</td>
                                                    <td class="text-left">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right">
                                                        &nbsp;</td>
                                                    <td class="text-left">
                                                        <asp:TextBox ID="tb_pretencion" runat="server" CssClass="thumbnail"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right">
                                                        <asp:Label ID="Label22" runat="server" Text="Adjuntar PDF:"></asp:Label>
                                                    </td>
                                                    <td class="auto-style9" style="text-align: left">
                                                        <asp:FileUpload ID="fu_pdf" runat="server" Width="148px" CssClass="auto-style49" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style35">
                                            <asp:XmlDataSource ID="tiempo" runat="server" DataFile="~/xml/years.xml"></asp:XmlDataSource>
                                            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/xml/cities.xml"></asp:XmlDataSource>
                                            <asp:XmlDataSource ID="XmlDataSource4" runat="server" DataFile="~/xml/licencia.xml"></asp:XmlDataSource>
                                            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/xml/regiones.xml"></asp:XmlDataSource>
                                            <asp:Label ID="lb_campovacio" runat="server" CssClass="auto-style36"></asp:Label>
                                            <asp:XmlDataSource ID="XmlDataSource5" runat="server" DataFile="~/xml/Estudios.xml" OnTransforming="XmlDataSource5_Transforming"></asp:XmlDataSource>
                                        </td>
                                        <td class="auto-style21">
                                            <asp:SqlDataSource ID="SqlTitulo" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT * FROM [Titulo]"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlCertificacion" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT * FROM [Certificacion]"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlCargos" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT [cargo], [IDcargo] FROM [Cargos]"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlEspecialidad" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT * FROM [Especialidad]"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlArea" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT * FROM [Area]"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style46">
                                            <strong>
                                                <asp:Button ID="bt_agregapersona" runat="server" Text="Guardar" OnClick="bt_agregapersona_Click1" CssClass="btn btn-primary btneminlarge" Height="44px" Style="font-size: large; font-weight: bold" Width="157px" />
                                            </strong>
                                        </td>
                                        <td class="auto-style34">
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" InsertCommand="INSERT INTO Persona(rut, nombre, apellido, fecha_nacimiento, region, ciudad, numero_fijo, numero_movil, mail, licencia, nivel_estudio, titulo, fecha_ingreso, area, cargo, especialidad, certificacion, experiencia_cargo, experiencia_mineria, experiencia_emin, pretension, foto, pdf) VALUES (@rut, @nombre, @apellido, @fecha_nacimiento, @region, @ciudad, @numero_fijo, @numero_movil, @mail, @licencia, @nivel_estudio, @titulo, @fecha_ingreso, @area, @cargo, @especialidad, @certificacion, @experiencia_cargo, @experiencia_mineria, @experiencia_emin, @pretension, @foto, @pdf)" SelectCommand="SELECT * FROM [trabajador]">
                                                <InsertParameters>
                                                    <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="tb_nombre" Name="nombre" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="tb_apellido" Name="apellido" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="tb_fnac" Name="fecha_nacimiento" PropertyName="Text" DbType="Date" />
                                                    <asp:ControlParameter ControlID="dp_region" Name="region" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_ciudad" Name="ciudad" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="tb_numfijo" Name="numero_fijo" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="tb_nummovil" Name="numero_movil" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="tb_mail" Name="mail" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="dp_licencia" Name="licencia" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_nivelestudio" Name="nivel_estudio" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_titulo" Name="titulo" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="tb_ingreso" Name="fecha_ingreso" PropertyName="Text" DbType="Date" />
                                                    <asp:ControlParameter ControlID="dp_area" Name="area" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_cargo" Name="cargo" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_especialidad" Name="especialidad" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_certificacion" Name="certificacion" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_cargo" Name="experiencia_cargo" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_expmineria" Name="experiencia_mineria" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="dp_expemin" Name="experiencia_emin" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="tb_pretencion" Name="pretension" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="fu_foto" Name="foto" PropertyName="FileBytes" />
                                                    <asp:ControlParameter ControlID="fu_pdf" Name="pdf" PropertyName="FileBytes" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                            <asp:Button ID="bt_modificasql" runat="server" OnClick="bt_modificasql_Click" Text="Modificar" Enabled="False" Visible="False" />
                                            <asp:Button ID="btAgregar" runat="server" Text="//Terminar" OnClick="btAgregar_Click" Height="39px" Width="158px" Visible="False" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style38"></td>
                                        <td class="auto-style38">
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT [rut], [nombre], [apellido], [fnac], [region], [ciudad], [nfijo], [cargo], [area], [fingreso], [foto], [titulo], [nestudio], [licencia], [nmovil], [mail], [especialidad], [certificacion], [ecargo], [emineria], [eemin], [pretension], [pdf] FROM [trabajador] WHERE ([rut] = @rut) ORDER BY [rut]">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" DeleteCommand="DELETE FROM [trabajador] WHERE [IDpersona] = @IDpersona" InsertCommand="INSERT INTO [trabajador] ([rut], [nombre], [apellido], [fnac], [region], [ciudad], [nfijo], [nmovil], [mail], [licencia], [nestudio], [titulo], [foto], [fingreso], [area], [cargo], [especialidad], [certificacion], [ecargo], [emineria], [eemin], [pretension], [pdf]) VALUES (@rut, @nombre, @apellido, @fnac, @region, @ciudad, @nfijo, @nmovil, @mail, @licencia, @nestudio, @titulo, @foto, @fingreso, @area, @cargo, @especialidad, @certificacion, @ecargo, @emineria, @eemin, @pretension, @pdf)" SelectCommand="SELECT * FROM [trabajador]" UpdateCommand="UPDATE [trabajador] SET [rut] = @rut, [nombre] = @nombre, [apellido] = @apellido, [fnac] = @fnac, [region] = @region, [ciudad] = @ciudad, [nfijo] = @nfijo, [nmovil] = @nmovil, [mail] = @mail, [licencia] = @licencia, [nestudio] = @nestudio, [titulo] = @titulo, [foto] = @foto, [fingreso] = @fingreso, [area] = @area, [cargo] = @cargo, [especialidad] = @especialidad, [certificacion] = @certificacion, [ecargo] = @ecargo, [emineria] = @emineria, [eemin] = @eemin, [pretension] = @pretension, [pdf] = @pdf WHERE [IDpersona] = @IDpersona">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="IDpersona" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="rut" Type="String" />
                                                    <asp:Parameter Name="nombre" Type="String" />
                                                    <asp:Parameter Name="apellido" Type="String" />
                                                    <asp:Parameter Name="fnac" Type="String" />
                                                    <asp:Parameter Name="region" Type="String" />
                                                    <asp:Parameter Name="ciudad" Type="String" />
                                                    <asp:Parameter Name="nfijo" Type="String" />
                                                    <asp:Parameter Name="nmovil" Type="String" />
                                                    <asp:Parameter Name="mail" Type="String" />
                                                    <asp:Parameter Name="licencia" Type="String" />
                                                    <asp:Parameter Name="nestudio" Type="String" />
                                                    <asp:Parameter Name="titulo" Type="String" />
                                                    <asp:Parameter Name="foto" Type="Object" />
                                                    <asp:Parameter Name="fingreso" Type="String" />
                                                    <asp:Parameter Name="area" Type="String" />
                                                    <asp:Parameter Name="cargo" Type="String" />
                                                    <asp:Parameter Name="especialidad" Type="String" />
                                                    <asp:Parameter Name="certificacion" Type="String" />
                                                    <asp:Parameter Name="ecargo" Type="String" />
                                                    <asp:Parameter Name="emineria" Type="String" />
                                                    <asp:Parameter Name="eemin" Type="String" />
                                                    <asp:Parameter Name="pretension" Type="String" />
                                                    <asp:Parameter Name="pdf" Type="Object" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="tb_nombre" Name="nombre" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="tb_apellido" Name="apellido" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="tb_fnac" Name="fnac" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_region" Name="region" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_ciudad" Name="ciudad" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="tb_numfijo" Name="nfijo" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="tb_nummovil" Name="nmovil" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="tb_mail" Name="mail" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_licencia" Name="licencia" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_nivelestudio" Name="nestudio" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_titulo" Name="titulo" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="fu_foto" Name="foto" PropertyName="FileBytes" Type="Object" />
                                                    <asp:ControlParameter ControlID="tb_ingreso" Name="fingreso" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_area" Name="area" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_cargo" Name="cargo" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_especialidad" Name="especialidad" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_certificacion" Name="certificacion" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_expcargo" Name="ecargo" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_expmineria" Name="emineria" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="dp_expemin" Name="eemin" PropertyName="SelectedValue" Type="String" />
                                                    <asp:ControlParameter ControlID="tb_pretencion" Name="pretension" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="fu_pdf" Name="pdf" PropertyName="FileBytes" Type="Object" />
                                                    <asp:Parameter Name="IDpersona" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" DeleteCommand="DELETE FROM [trabajador] WHERE [IDpersona] = @original_IDpersona AND (([rut] = @original_rut) OR ([rut] IS NULL AND @original_rut IS NULL)) AND (([nombre] = @original_nombre) OR ([nombre] IS NULL AND @original_nombre IS NULL)) AND (([apellido] = @original_apellido) OR ([apellido] IS NULL AND @original_apellido IS NULL)) AND (([fnac] = @original_fnac) OR ([fnac] IS NULL AND @original_fnac IS NULL)) AND (([region] = @original_region) OR ([region] IS NULL AND @original_region IS NULL)) AND (([ciudad] = @original_ciudad) OR ([ciudad] IS NULL AND @original_ciudad IS NULL)) AND (([nfijo] = @original_nfijo) OR ([nfijo] IS NULL AND @original_nfijo IS NULL)) AND (([nmovil] = @original_nmovil) OR ([nmovil] IS NULL AND @original_nmovil IS NULL)) AND (([mail] = @original_mail) OR ([mail] IS NULL AND @original_mail IS NULL)) AND (([licencia] = @original_licencia) OR ([licencia] IS NULL AND @original_licencia IS NULL)) AND (([nestudio] = @original_nestudio) OR ([nestudio] IS NULL AND @original_nestudio IS NULL)) AND (([titulo] = @original_titulo) OR ([titulo] IS NULL AND @original_titulo IS NULL)) AND (([foto] = @original_foto) OR ([foto] IS NULL AND @original_foto IS NULL)) AND (([fingreso] = @original_fingreso) OR ([fingreso] IS NULL AND @original_fingreso IS NULL)) AND (([area] = @original_area) OR ([area] IS NULL AND @original_area IS NULL)) AND (([cargo] = @original_cargo) OR ([cargo] IS NULL AND @original_cargo IS NULL)) AND (([especialidad] = @original_especialidad) OR ([especialidad] IS NULL AND @original_especialidad IS NULL)) AND (([certificacion] = @original_certificacion) OR ([certificacion] IS NULL AND @original_certificacion IS NULL)) AND (([ecargo] = @original_ecargo) OR ([ecargo] IS NULL AND @original_ecargo IS NULL)) AND (([emineria] = @original_emineria) OR ([emineria] IS NULL AND @original_emineria IS NULL)) AND (([eemin] = @original_eemin) OR ([eemin] IS NULL AND @original_eemin IS NULL)) AND (([pretension] = @original_pretension) OR ([pretension] IS NULL AND @original_pretension IS NULL)) AND (([pdf] = @original_pdf) OR ([pdf] IS NULL AND @original_pdf IS NULL))" InsertCommand="INSERT INTO [trabajador] ([rut], [nombre], [apellido], [fnac], [region], [ciudad], [nfijo], [nmovil], [mail], [licencia], [nestudio], [titulo], [foto], [fingreso], [area], [cargo], [especialidad], [certificacion], [ecargo], [emineria], [eemin], [pretension], [pdf]) VALUES (@rut, @nombre, @apellido, @fnac, @region, @ciudad, @nfijo, @nmovil, @mail, @licencia, @nestudio, @titulo, @foto, @fingreso, @area, @cargo, @especialidad, @certificacion, @ecargo, @emineria, @eemin, @pretension, @pdf)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT rut, nombre, apellido, fnac, region, ciudad, nfijo, nmovil, mail, licencia, nestudio, titulo, foto, fingreso, area, cargo, especialidad, certificacion, ecargo, emineria, eemin, pretension, pdf FROM trabajador WHERE (rut LIKE '%' + @rut + '%')" UpdateCommand="UPDATE [trabajador] SET [rut] = @rut, [nombre] = @nombre, [apellido] = @apellido, [fnac] = @fnac, [region] = @region, [ciudad] = @ciudad, [nfijo] = @nfijo, [nmovil] = @nmovil, [mail] = @mail, [licencia] = @licencia, [nestudio] = @nestudio, [titulo] = @titulo, [foto] = @foto, [fingreso] = @fingreso, [area] = @area, [cargo] = @cargo, [especialidad] = @especialidad, [certificacion] = @certificacion, [ecargo] = @ecargo, [emineria] = @emineria, [eemin] = @eemin, [pretension] = @pretension, [pdf] = @pdf WHERE [IDpersona] = @original_IDpersona AND (([rut] = @original_rut) OR ([rut] IS NULL AND @original_rut IS NULL)) AND (([nombre] = @original_nombre) OR ([nombre] IS NULL AND @original_nombre IS NULL)) AND (([apellido] = @original_apellido) OR ([apellido] IS NULL AND @original_apellido IS NULL)) AND (([fnac] = @original_fnac) OR ([fnac] IS NULL AND @original_fnac IS NULL)) AND (([region] = @original_region) OR ([region] IS NULL AND @original_region IS NULL)) AND (([ciudad] = @original_ciudad) OR ([ciudad] IS NULL AND @original_ciudad IS NULL)) AND (([nfijo] = @original_nfijo) OR ([nfijo] IS NULL AND @original_nfijo IS NULL)) AND (([nmovil] = @original_nmovil) OR ([nmovil] IS NULL AND @original_nmovil IS NULL)) AND (([mail] = @original_mail) OR ([mail] IS NULL AND @original_mail IS NULL)) AND (([licencia] = @original_licencia) OR ([licencia] IS NULL AND @original_licencia IS NULL)) AND (([nestudio] = @original_nestudio) OR ([nestudio] IS NULL AND @original_nestudio IS NULL)) AND (([titulo] = @original_titulo) OR ([titulo] IS NULL AND @original_titulo IS NULL)) AND (([foto] = @original_foto) OR ([foto] IS NULL AND @original_foto IS NULL)) AND (([fingreso] = @original_fingreso) OR ([fingreso] IS NULL AND @original_fingreso IS NULL)) AND (([area] = @original_area) OR ([area] IS NULL AND @original_area IS NULL)) AND (([cargo] = @original_cargo) OR ([cargo] IS NULL AND @original_cargo IS NULL)) AND (([especialidad] = @original_especialidad) OR ([especialidad] IS NULL AND @original_especialidad IS NULL)) AND (([certificacion] = @original_certificacion) OR ([certificacion] IS NULL AND @original_certificacion IS NULL)) AND (([ecargo] = @original_ecargo) OR ([ecargo] IS NULL AND @original_ecargo IS NULL)) AND (([emineria] = @original_emineria) OR ([emineria] IS NULL AND @original_emineria IS NULL)) AND (([eemin] = @original_eemin) OR ([eemin] IS NULL AND @original_eemin IS NULL)) AND (([pretension] = @original_pretension) OR ([pretension] IS NULL AND @original_pretension IS NULL)) AND (([pdf] = @original_pdf) OR ([pdf] IS NULL AND @original_pdf IS NULL))" OnSelecting="SqlDataSource5_Selecting">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="original_IDpersona" Type="Int32" />
                                                    <asp:Parameter Name="original_rut" Type="String" />
                                                    <asp:Parameter Name="original_nombre" Type="String" />
                                                    <asp:Parameter Name="original_apellido" Type="String" />
                                                    <asp:Parameter Name="original_fnac" Type="String" />
                                                    <asp:Parameter Name="original_region" Type="String" />
                                                    <asp:Parameter Name="original_ciudad" Type="String" />
                                                    <asp:Parameter Name="original_nfijo" Type="String" />
                                                    <asp:Parameter Name="original_nmovil" Type="String" />
                                                    <asp:Parameter Name="original_mail" Type="String" />
                                                    <asp:Parameter Name="original_licencia" Type="String" />
                                                    <asp:Parameter Name="original_nestudio" Type="String" />
                                                    <asp:Parameter Name="original_titulo" Type="String" />
                                                    <asp:Parameter Name="original_foto" Type="Object" />
                                                    <asp:Parameter Name="original_fingreso" Type="String" />
                                                    <asp:Parameter Name="original_area" Type="String" />
                                                    <asp:Parameter Name="original_cargo" Type="String" />
                                                    <asp:Parameter Name="original_especialidad" Type="String" />
                                                    <asp:Parameter Name="original_certificacion" Type="String" />
                                                    <asp:Parameter Name="original_ecargo" Type="String" />
                                                    <asp:Parameter Name="original_emineria" Type="String" />
                                                    <asp:Parameter Name="original_eemin" Type="String" />
                                                    <asp:Parameter Name="original_pretension" Type="String" />
                                                    <asp:Parameter Name="original_pdf" Type="Object" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="rut" Type="String" />
                                                    <asp:Parameter Name="nombre" Type="String" />
                                                    <asp:Parameter Name="apellido" Type="String" />
                                                    <asp:Parameter Name="fnac" Type="String" />
                                                    <asp:Parameter Name="region" Type="String" />
                                                    <asp:Parameter Name="ciudad" Type="String" />
                                                    <asp:Parameter Name="nfijo" Type="String" />
                                                    <asp:Parameter Name="nmovil" Type="String" />
                                                    <asp:Parameter Name="mail" Type="String" />
                                                    <asp:Parameter Name="licencia" Type="String" />
                                                    <asp:Parameter Name="nestudio" Type="String" />
                                                    <asp:Parameter Name="titulo" Type="String" />
                                                    <asp:Parameter Name="foto" Type="Object" />
                                                    <asp:Parameter Name="fingreso" Type="String" />
                                                    <asp:Parameter Name="area" Type="String" />
                                                    <asp:Parameter Name="cargo" Type="String" />
                                                    <asp:Parameter Name="especialidad" Type="String" />
                                                    <asp:Parameter Name="certificacion" Type="String" />
                                                    <asp:Parameter Name="ecargo" Type="String" />
                                                    <asp:Parameter Name="emineria" Type="String" />
                                                    <asp:Parameter Name="eemin" Type="String" />
                                                    <asp:Parameter Name="pretension" Type="String" />
                                                    <asp:Parameter Name="pdf" Type="Object" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="rut" Type="String" />
                                                    <asp:Parameter Name="nombre" Type="String" />
                                                    <asp:Parameter Name="apellido" Type="String" />
                                                    <asp:Parameter Name="fnac" Type="String" />
                                                    <asp:Parameter Name="region" Type="String" />
                                                    <asp:Parameter Name="ciudad" Type="String" />
                                                    <asp:Parameter Name="nfijo" Type="String" />
                                                    <asp:Parameter Name="nmovil" Type="String" />
                                                    <asp:Parameter Name="mail" Type="String" />
                                                    <asp:Parameter Name="licencia" Type="String" />
                                                    <asp:Parameter Name="nestudio" Type="String" />
                                                    <asp:Parameter Name="titulo" Type="String" />
                                                    <asp:Parameter Name="foto" Type="Object" />
                                                    <asp:Parameter Name="fingreso" Type="String" />
                                                    <asp:Parameter Name="area" Type="String" />
                                                    <asp:Parameter Name="cargo" Type="String" />
                                                    <asp:Parameter Name="especialidad" Type="String" />
                                                    <asp:Parameter Name="certificacion" Type="String" />
                                                    <asp:Parameter Name="ecargo" Type="String" />
                                                    <asp:Parameter Name="emineria" Type="String" />
                                                    <asp:Parameter Name="eemin" Type="String" />
                                                    <asp:Parameter Name="pretension" Type="String" />
                                                    <asp:Parameter Name="pdf" Type="Object" />
                                                    <asp:Parameter Name="original_IDpersona" Type="Int32" />
                                                    <asp:Parameter Name="original_rut" Type="String" />
                                                    <asp:Parameter Name="original_nombre" Type="String" />
                                                    <asp:Parameter Name="original_apellido" Type="String" />
                                                    <asp:Parameter Name="original_fnac" Type="String" />
                                                    <asp:Parameter Name="original_region" Type="String" />
                                                    <asp:Parameter Name="original_ciudad" Type="String" />
                                                    <asp:Parameter Name="original_nfijo" Type="String" />
                                                    <asp:Parameter Name="original_nmovil" Type="String" />
                                                    <asp:Parameter Name="original_mail" Type="String" />
                                                    <asp:Parameter Name="original_licencia" Type="String" />
                                                    <asp:Parameter Name="original_nestudio" Type="String" />
                                                    <asp:Parameter Name="original_titulo" Type="String" />
                                                    <asp:Parameter Name="original_foto" Type="Object" />
                                                    <asp:Parameter Name="original_fingreso" Type="String" />
                                                    <asp:Parameter Name="original_area" Type="String" />
                                                    <asp:Parameter Name="original_cargo" Type="String" />
                                                    <asp:Parameter Name="original_especialidad" Type="String" />
                                                    <asp:Parameter Name="original_certificacion" Type="String" />
                                                    <asp:Parameter Name="original_ecargo" Type="String" />
                                                    <asp:Parameter Name="original_emineria" Type="String" />
                                                    <asp:Parameter Name="original_eemin" Type="String" />
                                                    <asp:Parameter Name="original_pretension" Type="String" />
                                                    <asp:Parameter Name="original_pdf" Type="Object" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                </p>
            </td>
        </tr>
    </table>

</asp:Content>
