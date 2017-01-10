<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="PW_Final.Cliente.Pedidos" %>


<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

                <asp:HyperLink ID="homeHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Cliente/ClienteHome">Home</asp:HyperLink>
                <asp:HyperLink ID="managePedidosHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Cliente/Pedidos">Gerir Meus Pedidos</asp:HyperLink>
                
                 <div class="col-md-2">
            <asp:Button runat="server" OnClick="AddNew" Text="Adicionar" CssClass="btn btn-default" />
        </div>
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    <!--Inserir caixa de mensagem aqui-->
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="pedidosGridView" CssClass="table table-bordered" runat="server" BorderStyle="None" AutoGenerateColumns="false" >
                <Columns >
                    
                    
                    <asp:BoundField DataField="Descricao" HeaderText="Descrição" />
                    <asp:BoundField DataField="Data" HeaderText="Data" />
                    <asp:BoundField DataField="Avaliacao" HeaderText="Avaliação" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                    <asp:BoundField DataField="Respostas" HeaderText="Respostas" />
                    
                   <asp:TemplateField HeaderText="Opções">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Remover" OnClick="Delete" CssClass="btn btn-default" />
                            <asp:HiddenField ID="idPedido" runat="server" value='<%# Eval("idPedido") %>'/>
                            <asp:LinkButton runat="server" Text="Respostas" OnClick="Respostas" CssClass="btn btn-default" />
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                    
                    
                    
                </Columns>
                
            </asp:GridView>
            
        </div>
       
    </div>
</asp:Content>