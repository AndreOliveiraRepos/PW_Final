<%@ Page Title="Os tipos de oficina" MasterPageFile="~/Dashboard.Master" Language="C#" AutoEventWireup="true" CodeBehind="ListaTipoOficina.aspx.cs" Inherits="PW_Final.Admin.ListaTipoOficina" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="DashContent">
    <h2><%: Title %>.</h2>
    <asp:GridView ID="tiposGridView" runat="server" Width="374px">
        <Columns>
            
        </Columns>
        
    </asp:GridView>
    <div>
        
    </div>
</asp:Content>

<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">
                <asp:HyperLink ID="homeHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Admin/AdminHome">Home</asp:HyperLink>
                <asp:HyperLink ID="manageRolesHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Admin/ListaRoles.aspx">Gerir Roles</asp:HyperLink>
                <asp:HyperLink ID="manageRepairHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Admin/ListaTipoOficina.aspx">Gerir Tipos Reparação</asp:HyperLink>
                            
</asp:Content>