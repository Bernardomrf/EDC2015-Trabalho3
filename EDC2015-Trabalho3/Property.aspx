<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Property.aspx.cs" Inherits="EDC2015_Trabalho3.Properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" GridLines="None" CssClass="table table-strip table-hover" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="land_register" HeaderText="Land Register" SortExpression="land_register" DataFormatString="{0}"  />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
            <asp:BoundField DataField="port_number" HeaderText="Port Number" SortExpression="port_number" />
            <asp:BoundField DataField="value" HeaderText="Value" SortExpression="value" DataFormatString="{0:C2}" />
        </Columns>

        <PagerStyle runat="server" CssClass="pagination-ys" />
    </asp:GridView>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/imoveis.xml" TransformFile="~/App_Data/properties.xsl"></asp:XmlDataSource>
</asp:Content>
