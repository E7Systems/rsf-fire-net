<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RSFFire._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" 
    runat="server">
        <div role="tabpanel">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#projects" aria-controls="projects" role="tab" data-toggle="tab">Projects</a></li>
            <li role="presentation"><a href="#parcels" aria-controls="parcels" role="tab" data-toggle="tab">Parcels</a></li>
            <li role="presentation"><a href="#customers" aria-controls="customers" role="tab" data-toggle="tab">Customers</a></li>
            <li role="presentation"><a href="#payment" aria-controls="payment" role="tab" data-toggle="tab">Payment</a></li>
            <li role="presentation" class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">Admin <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li>...</li>
                </ul>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="projects">
                <asp:GridView ID="GridView1" runat="server"
                    ItemType="RSFFireData.Models.Project"
                    SelectMethod="GetProjects" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Street" HeaderText="Street" />
                        <asp:BoundField DataField="APN" HeaderText="APN" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="PlanCheckNumber" HeaderText="Plan Check Number" />
                        <asp:BoundField DataField="Notes" HeaderText="Notes" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Data available
                    </EmptyDataTemplate>
                    
                </asp:GridView>

                <asp:EntityDataSource ID="RSFFireEntities" runat="server">
                </asp:EntityDataSource>


            </div>
            <div role="tabpanel" class="tab-pane" id="parcels">
                <p>Parcels</p>
            </div>
            <div role="tabpanel" class="tab-pane" id="customers">
                <p>Customers</p>
            </div>
            <div role="tabpanel" class="tab-pane" id="payment">
                <p>Payments</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            
        </div>
        <div class="col-md-4">

        </div>
    </div>

</asp:Content>
