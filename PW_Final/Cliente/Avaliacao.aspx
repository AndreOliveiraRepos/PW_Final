<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Avaliacao.aspx.cs" Inherits="PW_Final.Cliente.Avaliacao" %>

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
    <!--Inserir caixa de mensagem aqui-->
    <div class="row">
        <div class="col-md-12">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Nova Avaliação.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="false">
                    <p>
                        Avaliação adicionada
                    </p>
                </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Comentario" CssClass="col-md-2 control-label">Breve Comentário</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Comentario" CssClass="form-control" TextMode="MultiLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Comentario"
                                CssClass="text-danger" ErrorMessage="Escreva um comentário." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="avalicaoDropDownList" CssClass="col-md-2 control-label">Pontuação</asp:Label>
                        <div class="col-md-2">
                             <asp:DropDownList ID="avalicaoDropDownList" CssClass="form-control" runat="server">
                                 <asp:ListItem>1</asp:ListItem>
                                 <asp:ListItem>2</asp:ListItem>
                                 <asp:ListItem>3</asp:ListItem>
                                 <asp:ListItem>4</asp:ListItem>
                                 <asp:ListItem>5</asp:ListItem>
                             </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="avalicaoDropDownList" CssClass="text-danger" ErrorMessage="Escolha uma pontuação" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2">
                           <asp:Button runat="server" Text="Adicionar" OnClick="Avalia" CssClass="btn btn-default" />

                        </div>
                        <div class="col-md-2">
                           <asp:Button runat="server" Text="Cancelar" CssClass="btn btn-default" />

                        </div>
                    </div>
                        
                </div>
                
            </section>
        </div>

    
    </div>
</asp:Content>