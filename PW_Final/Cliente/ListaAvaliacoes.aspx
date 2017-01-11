<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="ListaAvaliacoes.aspx.cs" Inherits="PW_Final.Cliente.ListaAvaliacoes" %>

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
                            <li><a href="/Cliente/Pedidos">Pendentes</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">As Minhas Avaliaçoes</a>  
                                
                    </li>
                </ul>
                
                 
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    <div class="row">
        <asp:Panel ID="pedidosPanel" CssClass="col-md-12" runat="server" Visible="true">
        
            <asp:GridView ID="pedidosGridView" CssClass="table table-bordered" runat="server" BorderStyle="None" AutoGenerateColumns="false" >
                <Columns >
                    
                    
                    <asp:BoundField DataField="NomeOficina" HeaderText="Oficina" />                                
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                    <asp:BoundField DataField="Avaliacao" HeaderText="Avaliacao" />
                    <asp:BoundField DataField="Comentario" HeaderText="Comentario" />                    
                    <asp:TemplateField HeaderText="Opções">
                        <ItemTemplate>
                            
                            
                            <asp:HiddenField ID="idPedido" runat="server" value='<%# Eval("idPedido") %>'/>   
                            <asp:HiddenField ID="idOficina" runat="server" value='<%# Eval("idOficina") %>'/> 
                            <asp:HiddenField ID="idAvaliacao" runat="server" value='<%# Eval("idAvaliacao") %>'/>                             
                            <asp:LinkButton runat="server" Text="Editar" OnClick="Editar" CssClass="btn btn-default" />

                        </ItemTemplate>
                       
                    </asp:TemplateField>
                    
                    
                    
                </Columns>
                
            </asp:GridView>
            
        
       </asp:Panel>
    </div>
</asp:Content>