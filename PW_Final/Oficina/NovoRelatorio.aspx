<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="NovoRelatorio.aspx.cs" Inherits="PW_Final.Oficina.NovoRelatorio" %>


<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

               <ul class="sidebar-nav">
                
                        <li>
                            <a href="/Oficina/OficinaHome">Dashboard</a>
                        </li>
                        <li>
                            <a href="/Oficina/ProcurarPedidos.aspx">Serviços</a>
                            <ul class="sub-menu">
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Mostrar Novos</a></li>
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Mostrar Historico</a></li>
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Os Meus Pendentes</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/Oficina/Respostas.aspx">Os Meus Orçamentos</a>  
                                
                        </li>
                        <li>
                            <a href="/Oficina/Respostas.aspx">Os meus Relatórios</a>  
                                
                        </li>
                    </ul>
                
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    <!--Inserir caixa de mensagem aqui-->
    <div class="row">
        <div class="col-md-12">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Novo Relatório de Serviço.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="false">
                    <p>
                        Relatório adicionado
                    </p>
                </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Descritivo" CssClass="col-md-2 control-label">Descritivo</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Descritivo" CssClass="form-control" TextMode="MultiLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Descritivo"
                                CssClass="text-danger" ErrorMessage="Escreva um Descritivo." />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-2">
                           <asp:Button runat="server" Text="Enviar" OnClick="Enviar" CssClass="btn btn-default" />

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