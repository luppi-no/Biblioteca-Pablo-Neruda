<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ficha.aspx.cs" Inherits="Proyecto.ficha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Ficha Personal"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StringConexionBD %>" DeleteCommand="DELETE FROM [Cargo] WHERE [IDtrabajo] = @IDtrabajo" InsertCommand="INSERT INTO [Cargo] ([area], [cargo], [especialidad], [certificacion], [expcargo], [expmineria], [expemin], [pretencion], [nombre], [apellido], [region], [ciudad], [numfijo], [nummovil], [mail], [licencia], [nivelestudio], [titulo], [rut], [fnac]) VALUES (@area, @cargo, @especialidad, @certificacion, @expcargo, @expmineria, @expemin, @pretencion, @nombre, @apellido, @region, @ciudad, @numfijo, @nummovil, @mail, @licencia, @nivelestudio, @titulo, @rut, @fnac)" SelectCommand="SELECT * FROM [Cargo]" UpdateCommand="UPDATE [Cargo] SET [area] = @area, [cargo] = @cargo, [especialidad] = @especialidad, [certificacion] = @certificacion, [expcargo] = @expcargo, [expmineria] = @expmineria, [expemin] = @expemin, [pretencion] = @pretencion, [nombre] = @nombre, [apellido] = @apellido, [region] = @region, [ciudad] = @ciudad, [numfijo] = @numfijo, [nummovil] = @nummovil, [mail] = @mail, [licencia] = @licencia, [nivelestudio] = @nivelestudio, [titulo] = @titulo, [rut] = @rut, [fnac] = @fnac WHERE [IDtrabajo] = @IDtrabajo">
                        <DeleteParameters>
                            <asp:Parameter Name="IDtrabajo" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="area" Type="String" />
                            <asp:Parameter Name="cargo" Type="String" />
                            <asp:Parameter Name="especialidad" Type="String" />
                            <asp:Parameter Name="certificacion" Type="String" />
                            <asp:Parameter Name="expcargo" Type="String" />
                            <asp:Parameter Name="expmineria" Type="String" />
                            <asp:Parameter Name="expemin" Type="String" />
                            <asp:Parameter Name="pretencion" Type="String" />
                            <asp:Parameter Name="nombre" Type="String" />
                            <asp:Parameter Name="apellido" Type="String" />
                            <asp:Parameter Name="region" Type="String" />
                            <asp:Parameter Name="ciudad" Type="String" />
                            <asp:Parameter Name="numfijo" Type="String" />
                            <asp:Parameter Name="nummovil" Type="String" />
                            <asp:Parameter Name="mail" Type="String" />
                            <asp:Parameter Name="licencia" Type="String" />
                            <asp:Parameter Name="nivelestudio" Type="String" />
                            <asp:Parameter Name="titulo" Type="String" />
                            <asp:Parameter Name="rut" Type="String" />
                            <asp:Parameter Name="fnac" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="area" Type="String" />
                            <asp:Parameter Name="cargo" Type="String" />
                            <asp:Parameter Name="especialidad" Type="String" />
                            <asp:Parameter Name="certificacion" Type="String" />
                            <asp:Parameter Name="expcargo" Type="String" />
                            <asp:Parameter Name="expmineria" Type="String" />
                            <asp:Parameter Name="expemin" Type="String" />
                            <asp:Parameter Name="pretencion" Type="String" />
                            <asp:Parameter Name="nombre" Type="String" />
                            <asp:Parameter Name="apellido" Type="String" />
                            <asp:Parameter Name="region" Type="String" />
                            <asp:Parameter Name="ciudad" Type="String" />
                            <asp:Parameter Name="numfijo" Type="String" />
                            <asp:Parameter Name="nummovil" Type="String" />
                            <asp:Parameter Name="mail" Type="String" />
                            <asp:Parameter Name="licencia" Type="String" />
                            <asp:Parameter Name="nivelestudio" Type="String" />
                            <asp:Parameter Name="titulo" Type="String" />
                            <asp:Parameter Name="rut" Type="String" />
                            <asp:Parameter Name="fnac" Type="String" />
                            <asp:Parameter Name="IDtrabajo" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDtrabajo" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="IDtrabajo" HeaderText="IDtrabajo" InsertVisible="False" ReadOnly="True" SortExpression="IDtrabajo" />
                            <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
                            <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo" />
                            <asp:BoundField DataField="especialidad" HeaderText="especialidad" SortExpression="especialidad" />
                            <asp:BoundField DataField="certificacion" HeaderText="certificacion" SortExpression="certificacion" />
                            <asp:BoundField DataField="expcargo" HeaderText="expcargo" SortExpression="expcargo" />
                            <asp:BoundField DataField="expmineria" HeaderText="expmineria" SortExpression="expmineria" />
                            <asp:BoundField DataField="expemin" HeaderText="expemin" SortExpression="expemin" />
                            <asp:BoundField DataField="pretencion" HeaderText="pretencion" SortExpression="pretencion" />
                            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                            <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                            <asp:BoundField DataField="region" HeaderText="region" SortExpression="region" />
                            <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad" />
                            <asp:BoundField DataField="numfijo" HeaderText="numfijo" SortExpression="numfijo" />
                            <asp:BoundField DataField="nummovil" HeaderText="nummovil" SortExpression="nummovil" />
                            <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                            <asp:BoundField DataField="licencia" HeaderText="licencia" SortExpression="licencia" />
                            <asp:BoundField DataField="nivelestudio" HeaderText="nivelestudio" SortExpression="nivelestudio" />
                            <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                            <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                            <asp:BoundField DataField="fnac" HeaderText="fnac" SortExpression="fnac" />
                        </Columns>
                    </asp:GridView>
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
    
    </div>
    </form>
</body>
</html>
