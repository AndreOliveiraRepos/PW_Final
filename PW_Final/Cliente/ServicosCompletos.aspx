<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="ServicosCompletos.aspx.cs" Inherits="PW_Final.Cliente.ServicosCompletos" %>

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

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="PageControllers">
   <!--Inserir caixa de mensagem aqui-->
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    <!--Inserir caixa de mensagem aqui-->
    <div class="row">
        <asp:Panel ID="pedidosPanel" CssClass="col-md-12" runat="server" Visible="true">
        
            <asp:GridView ID="pedidosGridView" CssClass="table table-bordered" runat="server" BorderStyle="None" AutoGenerateColumns="false" >
                <Columns >
                    
                    
                    <asp:BoundField DataField="Descricao" HeaderText="Descrição" />
                    <asp:BoundField DataField="Data" HeaderText="Data" />                    
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                    <asp:BoundField DataField="Orcamentos" HeaderText="Orçamentos" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />                    
                   <asp:TemplateField HeaderText="Opções">
                        <ItemTemplate>
                            
                            
                            <asp:HiddenField ID="idPedido" runat="server" value='<%# Eval("idPedido") %>'/>   
                            <asp:HiddenField ID="idOficina" runat="server" value='<%# Eval("idOficina") %>'/>                            
                            <asp:LinkButton runat="server" Text="Avaliar" OnClick="Avaliar" CssClass="btn btn-default" />

                        </ItemTemplate>
                       
                    </asp:TemplateField>
                    
                    
                    
                </Columns>
                
            </asp:GridView>
            
        
       </asp:Panel>
    </div>
    

    
</asp:Content>