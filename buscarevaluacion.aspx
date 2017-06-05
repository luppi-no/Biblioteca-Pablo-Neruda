<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="buscarevaluacion.aspx.cs" Inherits="Proyecto.buscarevaluacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style type="text/css">
        .auto-style10 {
            display: inline-block;
            display: block;
            max-width: 100%;
            padding: 4px;
            line-height: 1.428571429;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 4px;
            -webkit-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="text-left">
                <asp:Button ID="Especialidad0" runat="server" CssClass="btn btn-default btneminlarge" OnClick="Especialidad_Click" Text="Buscar Persona" />
                <asp:Button ID="Button1" runat="server" Text="Buscar Especialidades" CssClass="btn btn-primary btneminlarge" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td>
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:XmlDataSource ID="especialidad" runat="server" DataFile="~/xml/buscaespecialidad.xml"></asp:XmlDataSource>
            </td>
            <td>
                <asp:TextBox ID="tb_nombre" runat="server" CssClass="auto-style10" placeholder="RUT EJ:12345678-9" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="thumbnail" DataSourceID="especialidad" DataTextField="name" DataValueField="name" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <div class="text-left">
                </div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT rut, nombre, apellido FROM trabajador  WHERE (rut LIKE '%' + @rut + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tb_nombre" Name="rut" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <div class="text-left">
    </div>
    <div class="text-left">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="rut" HeaderText="RUT" SortExpression="rut" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
    </div>
    &nbsp;&nbsp;&nbsp;
    <table style="width: 100%;">
        <tr>
            <td>
                <div class="text-left">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDpsicolaboral" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="False" Width="100%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="fechaev" HeaderText="Fecha" SortExpression="fechaev" />
                            <asp:BoundField DataField="resaler" HeaderText="Test Alerta" SortExpression="resaler" />
                            <asp:BoundField DataField="resot" HeaderText="OTIS" SortExpression="resot" />
                            <asp:BoundField DataField="resperllu" HeaderText="P. B. Lluvia" SortExpression="resperllu" />
                            <asp:BoundField DataField="reslu" HeaderText="Luscher" SortExpression="reslu" />
                            <asp:BoundField DataField="resent" HeaderText="Teorica" SortExpression="resent" />
                            <asp:BoundField DataField="resglo" HeaderText="Resultado" SortExpression="resglo" />
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
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT psicolaboral.* FROM psicolaboral"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <div class="text-left">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDgeo" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Visible="False" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                            <asp:BoundField DataField="eqeval" HeaderText="E. Evaluado" SortExpression="eqeval" />
                            <asp:BoundField DataField="eqmarca" HeaderText="Marca" SortExpression="eqmarca" />
                            <asp:BoundField DataField="eqmodelo" HeaderText="Modelo" SortExpression="eqmodelo" />
                            <asp:BoundField DataField="suev" HeaderText="Superficie" SortExpression="suev" />
                            <asp:BoundField DataField="resevteo" HeaderText="Teorica" SortExpression="resevteo" />
                            <asp:BoundField DataField="resevpra" HeaderText="Practica" SortExpression="resevpra" />
                            <asp:BoundField DataField="resglo" HeaderText="Global" SortExpression="resglo" />
                            <asp:BoundField DataField="nota" HeaderText="Nota" SortExpression="nota" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT geosinteticos.* FROM geosinteticos  WHERE (rut LIKE '%' + @rut + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tb_nombre" Name="rut" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <div class="text-left">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDmaquinaria" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Visible="False" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                            <asp:BoundField DataField="especialidad" HeaderText="Especialidad" SortExpression="especialidad" />
                            <asp:BoundField DataField="eqeva" HeaderText="E. Evaluado" SortExpression="eqeva" />
                            <asp:BoundField DataField="maeq" HeaderText="Marca" SortExpression="maeq" />
                            <asp:BoundField DataField="moeq" HeaderText="Modelo" SortExpression="moeq" />
                            <asp:BoundField DataField="categoria" HeaderText="Categoria" SortExpression="categoria" />
                            <asp:BoundField DataField="revateo" HeaderText="Teorico" SortExpression="revateo" />
                            <asp:BoundField DataField="revapra" HeaderText="Practico" SortExpression="revapra" />
                            <asp:BoundField DataField="resultado" HeaderText="Resultado" SortExpression="resultado" />
                            <asp:BoundField DataField="nota" HeaderText="nota" SortExpression="nota" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT maquinaria.* FROM maquinaria  WHERE (rut LIKE '%' + @rut + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tb_nombre" Name="rut" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>
