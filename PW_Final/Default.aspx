<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PW_Final._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   
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
