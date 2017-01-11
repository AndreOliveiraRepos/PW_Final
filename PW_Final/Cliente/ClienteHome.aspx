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
                            <li><a href="/Cliente/ServicosCompletos">Pendentes</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/Cliente/ListaAvaliacoes">As Minhas Avaliaçoes</a>  
                                
                    </li>
                </ul>
                
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    <div class="row">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tipoDropDownList" CssClass="col-md-2 control-label">Tipo de Oficina</asp:Label>
            <div class="col-md-10">
                    <asp:DropDownList ID="tipoDropDownList" CssClass="form-control" OnSelectedIndexChanged="tipoDropDownList_SelectedIndexChanged" runat="server" AutoPostBack="true"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tipoDropDownList"
                    CssClass="text-danger" ErrorMessage="Escolha o tipo de Serviço." />
            </div>
        </div>
        <asp:GridView ID="pedidosGridView" CssClass="table table-bordered" runat="server" BorderStyle="None" AutoGenerateColumns="false" >
                <Columns >
                    
                    
                   <asp:BoundField DataField="Nome" HeaderText="Nome" />
                   <asp:BoundField DataField="Morada" HeaderText="Morada" />                                       
                   <asp:BoundField DataField="Telefone" HeaderText="Telefone" />
                   <asp:BoundField DataField="Avaliacao" HeaderText="Avaliação" /> 
                   <asp:BoundField DataField="TotalAvaliacao" HeaderText="Numero de Avaliações" />                    
                   
                    
                    
                    
                </Columns>
                
            </asp:GridView>

    </div>
</asp:Content>