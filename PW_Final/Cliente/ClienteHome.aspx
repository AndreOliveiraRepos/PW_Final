<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="ClienteHome.aspx.cs" Inherits="PW_Final.Cliente.ClientHome" %>

<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

                <asp:HyperLink ID="homeHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Cliente/ClientHome">Home</asp:HyperLink>
                <asp:HyperLink ID="managePedidosHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Cliente/Pedidos">Gerir Meus Pedidos</asp:HyperLink>
                
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    
</asp:Content>