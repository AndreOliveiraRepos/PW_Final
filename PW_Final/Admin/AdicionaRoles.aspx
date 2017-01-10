<%@ Page Title="Adiciona uma nova role" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="AdicionaRoles.aspx.cs" Inherits="PW_Final.Admin.AdicionaRoles" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="DashContent">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
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
                        <asp:Label runat="server" AssociatedControlID="Nome" CssClass="col-md-2 control-label">Nome</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Nome" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Nome"
                                CssClass="text-danger" ErrorMessage="Escreva o nome da Role." />
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
<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">
                <asp:HyperLink ID="homeHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Admin/AdminHome">Home</asp:HyperLink>
                <asp:HyperLink ID="manageRolesHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Admin/ListaRoles.aspx">Gerir Roles</asp:HyperLink>
                <asp:HyperLink ID="manageRepairHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Admin/ListaTipoOficina.aspx">Gerir Tipos Reparação</asp:HyperLink>
                            
</asp:Content>