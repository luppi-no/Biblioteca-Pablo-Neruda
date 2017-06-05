 <%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="Evaluaciones.aspx.cs" Inherits="Proyecto.formularios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Formularios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style type="text/css">
        .auto-style9 {
            width: 237px;
            height: 33px;
        }

        .auto-style10 {
            font-family: arial, Helvetica, sans-serif;
            font-size: x-large;
        }

        .auto-style11 {
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

        .auto-style12 {
            width: 67px;
        }

        .auto-style13 {
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
            margin-top: 0;
        }

        .auto-style14 {
            width: 82px;
        }

        .auto-style15 {
            width: 26px;
        }

        .auto-style16 {
            width: 1px;
        }

        .auto-style17 {
            height: 29px;
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
            <div class="tab-pane active" id="formularios">
                <div align="center">
                    <p class="auto-style11">
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style10" Text="Evaluación Psicolaboral"></asp:Label>
                    </p>
                </div>
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style12">


                            <table class="nav-justified">
                                <tr>
                                    <td>
                                            <p class="title">
                                                Menú
                                            </p>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnVolver9" runat="server" Text="Ingreso" CssClass="btn btn-default btneminlarge" PostBackUrl="~/Ingreso.aspx" Width="165px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnVolver8" runat="server" Text="Evaluación Psicolaboral" CssClass="btn btn-primary btneminlarge" PostBackUrl="~/Evaluaciones.aspx" Width="165px" />
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


                            <asp:XmlDataSource ID="unoacienxml" runat="server" DataFile="~/xml/alerta.xml"></asp:XmlDataSource>
                            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/xml/Porcentage.xml"></asp:XmlDataSource>
                            <asp:XmlDataSource ID="unoasetentaycinco" runat="server" DataFile="~/xml/unoasetentaycinco.xml"></asp:XmlDataSource>
                            <asp:XmlDataSource ID="unoacienporcien" runat="server" DataFile="~/xml/Porcentage.xml"></asp:XmlDataSource>
                            <asp:XmlDataSource ID="sinoaplica" runat="server" DataFile="~/xml/sinoaplica.xml"></asp:XmlDataSource>
                            <asp:XmlDataSource ID="resultado" runat="server" DataFile="~/xml/resultado.xml"></asp:XmlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" InsertCommand="INSERT INTO psicolaboral(pdf, resglo, resent, reslu, resperllu, resot, resaler, fechaev, rut, alerta) VALUES (@pdf, @resglo, @resent, @reslu, @resperllu, @resot, @resaler, @fechaev, @rut,@alerta)" SelectCommand="SELECT * FROM [psicolaboral]">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="fu_fileupload" Name="pdf" PropertyName="FileBytes" />
                                    <asp:ControlParameter ControlID="dpresglobal" Name="resglo" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="dprespsicolaboral" Name="resent" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="dptestlucho" Name="reslu" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="dppbll" Name="resperllu" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="dpotis" Name="resot" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="dpalerta" Name="resaler" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="tb_fecha" Name="fechaev" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="tb_rut" Name="rut" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="alerta" Name="alerta" PropertyName="Text" />
                                </InsertParameters>
                            </asp:SqlDataSource>


                        </td>
                        <td>
                            <table class="nav-justified">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label19" runat="server" Text="RUT"></asp:Label>
                                    </td>
                                    <td>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style14">
                                                    <asp:TextBox ID="tb_rut" runat="server" MaxLength="10" AutoPostBack="True" placeholder="EJ:12345678-9" CssClass="thumbnail" OnTextChanged="tb_rut_TextChanged" required="true"></asp:TextBox>

                                                </td>
                                                <td class="text-left">
                                                    <strong>
                                                        <asp:Label ID="lberrorrut" runat="server" CssClass="auto-style39" Style="color: #FF0000"></asp:Label>
                                                    </strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Fecha de Evaluacion: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tb_fecha" runat="server" placeholder="DD/MM/AAAA" MaxLength="10" CssClass="thumbnail" required="true" AutoPostBack="True"></asp:TextBox>



                                        <ajaxToolkit:CalendarExtender ID="tb_fecha_CalendarExtender" runat="server" BehaviorID="tb_fecha_CalendarExtender" TargetControlID="tb_fecha">
                                        </ajaxToolkit:CalendarExtender>



                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="Resultados Test de Alerta:"></asp:Label>
                                    </td>
                                    <td class="text-left">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style15">
                                                    <asp:DropDownList ID="dpalerta" runat="server" DataSourceID="unoacienxml" required="true" DataTextField="name" DataValueField="name" AutoPostBack="True" CssClass="thumbnail" OnSelectedIndexChanged="dpalerta_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:TextBox ID="alerta" runat="server" Visible="False"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <strong>
                                                        <asp:Label ID="lbabajo" runat="server" CssClass="auto-style27" Text="Bajo" Visible="False" Style="color: #FF0000"></asp:Label>
                                                        <asp:Label ID="lbamediobajo" runat="server" CssClass="auto-style38" Text="Medio-Bajo" Visible="False" Style="color: #CC6600"></asp:Label>
                                                    </strong>
                                                    <asp:Label ID="lbamedio" runat="server" CssClass="auto-style31" Text="Medio" Visible="False" Style="color: #FF9900"></asp:Label>
                                                    <strong>
                                                        <asp:Label ID="lbaalto" runat="server" CssClass="auto-style29" Text="Alto" Visible="False" Style="color: #009933"></asp:Label>
                                                    </strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="Resultados OTIS:"></asp:Label>
                                    </td>
                                    <td>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="auto-style16">
                                                    <asp:DropDownList ID="dpotis" runat="server" DataSourceID="XmlDataSource1" DataTextField="name" DataValueField="name" AutoPostBack="True" CssClass="thumbnail" OnSelectedIndexChanged="dpotis_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="text-left">
                                                    <strong>
                                                        <asp:Label ID="lbbajoo" runat="server" CssClass="auto-style27" Text="Bajo" Visible="False" Style="color: #FF0000"></asp:Label>
                                                        <asp:Label ID="lbmediobajoo" runat="server" CssClass="auto-style38" Text="Medio-Bajo" Visible="False" Style="color: #CC6600"></asp:Label>
                                                        <asp:Label ID="lbmedioo" runat="server" CssClass="auto-style31" Text="Medio" Visible="False" Style="color: #FF9900"></asp:Label>
                                                        <asp:Label ID="lbaltoo" runat="server" CssClass="auto-style29" Text="Alto" Visible="False" Style="color: #009933"></asp:Label>
                                                    </strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="Resultado Persona Bajo la Lluvia:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dppbll" runat="server" DataSourceID="XmlDataSource1" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="Resultado Test Luscher:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dptestlucho" runat="server" DataSourceID="sinoaplica" DataTextField="name" DataValueField="name" CssClass="auto-style13">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label17" runat="server" Text="Resultado Entrevista Psicolaboral:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dprespsicolaboral" runat="server" DataSourceID="resultado" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:Label ID="Label18" runat="server" Text="Resultado Global:"></asp:Label>
                                    </td>
                                    <td class="auto-style17">
                                        <asp:DropDownList ID="dpresglobal" runat="server" DataSourceID="resultado" DataTextField="name" DataValueField="name" CssClass="thumbnail">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="Agregar PDF"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="fu_fileupload" runat="server" Width="146px" CssClass="thumbnail" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="text-left">
                                        <strong>
                                            <asp:Label ID="lbcampos" runat="server" CssClass="auto-style27" Style="color: #FF0000; font-size: medium;"></asp:Label>
                                        </strong></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="text-left">
                                        <strong>
                                            <asp:Button ID="bt_agregasql" runat="server" Text="GUARDAR" CssClass="btn btn-primary btneminlarge" Height="44px" Style="font-size: large; font-weight: bold" Width="157px" OnClick="bt_agregasql_Click" />
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
                <!-- =========================================================================== MODAL FORMULARIOS =========================================================================== -->
                <asp:UpdatePanel ID="upIngresarFormulario" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnNuevoRegistro" runat="server" Text="Ver Evaluaciones" CssClass="btn btn-primary btneminlarge" Visible="False" />
                        <ajaxToolkit:ModalPopupExtender ID="mpeFormulario" runat="server" BackgroundCssClass="modalBackground"
                            TargetControlID="btnNuevoRegistro" PopupControlID="pFormulario" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pFormulario" runat="server" CssClass="modalPopup" Style="display: none">
                            <div class="header">
                                <p class="title">
                                    Ingreso de Formulario
                                </p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomFormulario" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomFormulario" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomFormulario" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgFormulario" ControlToValidate="tbNomFormulario"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescFormulario" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescFormulario" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescFormulario" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgFormulario" ControlToValidate="txtaDescFormulario"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnCerrarFormulario" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall" />
                                <asp:Button ID="btnGuardarFormulario" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall" CausesValidation="true" ValidationGroup="vgFormulario" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL FORMULARIOS =========================================================================== -->
                <!-- =========================================================================== MODAL EDITAR FORMULARIOS =========================================================================== -->
                <asp:UpdatePanel ID="upFormularioE" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pFormularioE" runat="server" CssClass="modalPopup" Style="display: none">
                            <asp:HiddenField ID="hfFormularioE" runat="server" />
                            <ajaxToolkit:ModalPopupExtender ID="mpeFormularioE" runat="server" BackgroundCssClass="modalBackground"
                                TargetControlID="hfFormularioE" PopupControlID="pFormularioE" DropShadow="true">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="header">
                                <p class="title">
                                    Edición de Formulario
                                </p>
                            </div>
                            <br />
                            <div class="body">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblNomFormularioE" runat="server" Text="* Nombre:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <asp:TextBox ID="tbNomFormularioE" runat="server" Width="100%" placeholder="Ingresar Nombre"></asp:TextBox>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvNomFormularioE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgFormularioE" ControlToValidate="tbNomFormularioE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%">
                                            <asp:Label ID="lblDescFormularioE" runat="server" Text="* Descripción:" Width="100%"></asp:Label>
                                        </td>
                                        <td style="width: 75%">
                                            <textarea id="txtaDescFormularioE" runat="server" cols="20" rows="2" style="width: 100%"
                                                placeholder="Ingresar Descripción" class="lock"></textarea>
                                        </td>
                                        <td style="width: 5%">
                                            <asp:RequiredFieldValidator ID="rfvDescFormularioE" runat="server" ErrorMessage="(*)"
                                                ValidationGroup="vgFormularioE" ControlToValidate="txtaDescFormularioE"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 100%">
                                            <asp:Label ID="lblObligatorioE" runat="server" Text="(*) Los campos son obligatorios."></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <div class="footer">
                                <asp:Button ID="btnCerrarFormularioE" runat="server" Text="Cerrar" CssClass="btn btn-default btneminsmall" />
                                <asp:Button ID="btnGuardarFormularioE" runat="server" Text="Guardar" CssClass="btn btn-primary btneminsmall" CausesValidation="true" ValidationGroup="vgFormularioE" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- =========================================================================== FIN MODAL EDITAR FORMULARIOS =========================================================================== -->
            </div>
        </div>
    </div>
</asp:Content>
