<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="OficinaHome.aspx.cs" Inherits="PW_Final.Oficina.OficinaHome" %>

<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

               <ul class="sidebar-nav">
                
                        <li>
                            <a href="/Oficina/OficinaHome">Dashboard</a>
                        </li>
                        <li>
                            <a href="/Oficina/ProcurarPedidos.aspx">Serviços</a>
                            <ul class="sub-menu">
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Mostrar Novos</a></li>
                                <li><a href="/Oficina/Historico.aspx">Mostrar Historico</a></li>
                                <li><a href="/Oficina/Pendentes.aspx">Pendentes</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/Oficina/MeusOrcamentos.aspx">Os Meus Orçamentos</a>  
                                
                        </li>
                        <li>
                            <a href="/Oficina/Relatorios.aspx">Os meus Relatórios</a>  
                                
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

                            


