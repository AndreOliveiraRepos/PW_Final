<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="NovoPedido.aspx.cs" Inherits="PW_Final.Cliente.NovoPedido" %>

<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

                <asp:HyperLink ID="homeHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Cliente/ClientHome">Home</asp:HyperLink>
                <asp:HyperLink ID="managePedidosHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Cliente/Pedidos">Gerir Meus Pedidos</asp:HyperLink>
                
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    <div class="row">
        <div class="col-md-12">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Definir uma nova role.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="false">
                    <p>
                        Novo Role Adicionado
                    </p>
                </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Descricao" CssClass="col-md-2 control-label">Descreva o problema</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Descricao" CssClass="form-control" TextMode="MultiLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Descricao"
                                CssClass="text-danger" ErrorMessage="Descreva o seu problema." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="tipoDropDownList" CssClass="col-md-2 control-label">Tipo de Oficina</asp:Label>
                        <div class="col-md-10">
                             <asp:DropDownList ID="tipoDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tipoDropDownList"
                                CssClass="text-danger" ErrorMessage="Escolha o tipo de Oficina." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" OnClick="AddNew" Text="Adicionar" CssClass="btn btn-default" />
                        </div>
                    </div>
                        
                </div>
                
            </section>
        </div>

    
    </div>
</asp:Content>