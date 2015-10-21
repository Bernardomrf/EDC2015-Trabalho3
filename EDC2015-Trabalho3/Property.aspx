<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Property.aspx.cs" Inherits="EDC2015_Trabalho3.Properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" GridLines="None" CssClass="table table-strip table-hover" AllowPaging="True" OnRowUpdated="Unnamed1_RowUpdated">
        <Columns>
            <asp:HyperLinkField DataTextField="land_register" DataNavigateUrlFields="land_register" DataNavigateUrlFormatString="Property.aspx?ID={0}" HeaderText="Land Register"  />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
            <asp:BoundField DataField="port_number" HeaderText="Port Number" SortExpression="port_number" />
            <asp:BoundField DataField="value" HeaderText="Value" SortExpression="value" DataFormatString="{0:C2}" />
            <asp:CommandField ShowEditButton="true" />
        </Columns>

        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                <h4>Atenção!</h4>
                <p>Não há imoveis desse tipo nessa instituição!</p>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/imoveis.xml" TransformFile="~/App_Data/properties.xsl" EnableCaching="false"></asp:XmlDataSource>
</asp:Content>
