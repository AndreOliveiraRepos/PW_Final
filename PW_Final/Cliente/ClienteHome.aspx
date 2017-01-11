<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="ClienteHome.aspx.cs" Inherits="PW_Final.Cliente.ClientHome" %>

<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">
         <ul class="sidebar-nav">
                
                <li>
                    <a href="/Cliente/ClienteHome">Dashboard</a>
                </li>
                <li>
                    <a href="/Cliente/Pedidos">Os meus pedidos</a>
                    <ul class="sub-menu">
                        <li><a href="/Cliente/NovoPedido">Novo Pedido</a></li>
                        <li><a href="/Cliente/Pedidos">Meus Pedidos</a></li>
                        <li><a href="/Cliente/Pedidos">Em Serviço</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">As Minhas Avaliaçoes</a>  
                                
                </li>
            </ul>
                
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    
</asp:Content>