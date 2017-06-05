<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Buscar.aspx.cs" Inherits="Proyecto.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style type="text/css">
        
        .auto-style10 {
            height: 35px;
        }

        .auto-style11 {
            height: 35px;
            text-align: left;
            width: 576px;
        }

        .auto-style12 {
            height: 42px;
        }

        .auto-style14 {
            height: 35px;
            text-align: left;
        }

        .auto-style15 {
            width: 100%;
            background-color: #5D7B9D;
            color: White;
            font-size: x-large;
            font-weight: bold;
            text-align: center;
            border-radius: 15px;
            height: 37px;
            padding-top: 5px;
            font-family: arial, Helvetica, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table class="nav-justified">
        <tr>
            <td class="auto-style11">

                <asp:Button ID="Button1" runat="server" Text="Buscar Persona" CssClass="btn btn-primary btneminlarge" />

                <asp:Button ID="Especialidad" runat="server" CssClass="btn btn-default btneminlarge" OnClick="Especialidad_Click" Text="Buscar Especialidades" />
            </td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style10"></td>
        </tr>
    </table>
    <td>
        <p class="auto-style15">
            Criterios de Busqueda</p>
    </td>
    <table style="width: 100%;">
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style12">
                <br />
                <br />
            </td>

        </tr>
        <tr>
            <td>
                <asp:TextBox ID="tb_buscar" runat="server" OnTextChanged="tb_buscar_TextChanged" placeholder="Nombre" CssClass="thumbnail" AutoPostBack="True"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="tb_apellido" runat="server" OnTextChanged="tb_apellido_TextChanged" placeholder="Apellido" CssClass="thumbnail" AutoPostBack="True"></asp:TextBox>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="XmlDataSource1" DataTextField="name" DataValueField="name" CssClass="thumbnail" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" CssClass="thumbnail" Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/xml/Cargos.xml"></asp:XmlDataSource>
            </td>
        </tr>
    </table>
    <div class="text-left">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDpersona" DataSourceID="SqlDataSource1" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="rut" HeaderText="RUT" SortExpression="rut" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                <asp:BoundField DataField="region" HeaderText="Region" SortExpression="region" />
                <asp:BoundField DataField="ciudad" HeaderText="Ciudad" SortExpression="ciudad" />
                <asp:BoundField DataField="nfijo" HeaderText="Nª Fijo" SortExpression="nfijo" />
                <asp:BoundField DataField="nmovil" HeaderText="Nª Movil" SortExpression="nmovil" />
                <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Imagenes/Iconos/impresora.png" ShowSelectButton="True">
                    <ControlStyle Height="20px" Width="20px" />
                </asp:CommandField>
                <asp:ButtonField ButtonType="Image" ImageUrl="~/Imagenes/Iconos/imprimir-icono-5119-48.png" Text="Botón">
                    <ControlStyle Height="20px" Width="20px" />
                </asp:ButtonField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT IDpersona, nombre, apellido, region, ciudad, nfijo, nmovil, cargo, foto, rut FROM trabajador WHERE (nombre LIKE '%' + @nombre + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="tb_buscar" Name="nombre" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="text-left">
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="rut" HeaderText="RUT" SortExpression="rut" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                <asp:BoundField DataField="region" HeaderText="Region" SortExpression="region" />
                <asp:BoundField DataField="ciudad" HeaderText="Ciudad" SortExpression="ciudad" />
                <asp:BoundField DataField="nfijo" HeaderText="Nª Fijo" SortExpression="nfijo" />
                <asp:BoundField DataField="nmovil" HeaderText="Nª Movil" SortExpression="nmovil" />
                <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Imagenes/Iconos/impresora.png" ShowSelectButton="True">
                    <ControlStyle Height="20px" Width="20px" />
                </asp:CommandField>
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
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT rut, nombre, apellido, region, ciudad, nfijo, nmovil, foto, cargo FROM trabajador WHERE (apellido LIKE '%' + @apellido + '%')" UpdateCommand="UPDATE Cargo SET apellido = @apellido, nombre = @nombre, region = @region, ciudad = @ciudad, numfijo = @numfijo, nummovil = @nummovil WHERE (IDtrabajo = @IDtranajo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="tb_apellido" Name="apellido" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="apellido" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="region" />
            <asp:Parameter Name="ciudad" />
            <asp:Parameter Name="numfijo" />
            <asp:Parameter Name="nummovil" />
            <asp:Parameter Name="IDtranajo" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="text-left">
        <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="rut" HeaderText="RUT" SortExpression="rut" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                <asp:BoundField DataField="region" HeaderText="Region" SortExpression="region" />
                <asp:BoundField DataField="ciudad" HeaderText="Ciudad" SortExpression="ciudad" />
                <asp:BoundField DataField="nfijo" HeaderText="Nª Fijo" SortExpression="nfijo" />
                <asp:BoundField DataField="nmovil" HeaderText="Nª Movil" SortExpression="nmovil" />
                <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Imagenes/Iconos/impresora.png" ShowSelectButton="True">
                    <ControlStyle Height="20px" Width="20px" />
                </asp:CommandField>
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
    </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT rut, nombre, apellido, region, ciudad, nfijo, nmovil, foto, cargo FROM trabajador WHERE (cargo LIKE '%' + @cargo + '%')" UpdateCommand="UPDATE Cargo SET apellido = @apellido, nombre = @nombre, region = @region, ciudad = @ciudad, numfijo = @numfijo, nummovil = @nummovil WHERE (IDtrabajo = @IDtranajo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="cargo" PropertyName="SelectedValue" DefaultValue="0" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="apellido" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="region" />
            <asp:Parameter Name="ciudad" />
            <asp:Parameter Name="numfijo" />
            <asp:Parameter Name="nummovil" />
            <asp:Parameter Name="IDtranajo" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
</asp:Content>
