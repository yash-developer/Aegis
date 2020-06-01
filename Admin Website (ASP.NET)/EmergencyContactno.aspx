<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="EmergencyContactno.aspx.cs" Inherits="CityWarningSystem.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content" class="bg-container">
        <header class="head">
                    <div class="main-bar row">
                        <div class="col-sm-5 col-lg-6">
                            <h4 class="nav_top_align">
                                <i class="fa fa-pencil"></i>
                                ADD CITY</h4>
                        </div>
                        <div class="col-sm-7 col-lg-6">
                            <ol  class="breadcrumb float-xs-right nav_breadcrumb_top_align">
                                <li class="breadcrumb-item">
                                    <a href="index.html">
                                        <i class="fa fa-pencil" data-pack="default" data-tags=""></i>
                                        Add City
                                    </a>
                                </li>
                           <!--     <li class="breadcrumb-item">
                                    <a href="#">Forms</a>
                                </li>
                                <li class="active breadcrumb-item">Registration</li>-->
                            </ol>
                        </div>
                    </div>
                </header>
        <div class="outer">
            <div class="inner bg-container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-header bg-white">
                                <i class="fa fa-file-text-o"></i>add city
                            </div>
                            <div class="card-block m-t-35">
                                <div class="form-horizontal  login_validator" id="form_block_validator">

                                 <div class="form-group row">
                                            <asp:Label ID="lblstation" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                               Station Name *</label>
                                        </div>
                                       <div class="col-lg-4">
                                            <asp:TextBox ID="txtstation" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>


                               <!--     <div class="form-group row">
                                            <asp:Label ID="lblemergencyName" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Name *</label>
                                        </div>
                                       <div class="col-lg-4">
                                            <asp:TextBox ID="txtemergencyname" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div> -->

                                    <div class="form-group row">
                                            <asp:Label ID="lblemergencyemail" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Email *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtemergencycontactemail" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                   
                                   <div class="form-group row">
                                            <asp:Label ID="lblemergencycontactno" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Contact No *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtemergencycontactnumber" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>

                                        <div class="form-group row">
                                            <asp:Label ID="lblcity" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                City *</label>
                                        </div>
                                        <div class="col-lg-4">
                                           
                                            <asp:DropDownList ID="city" DataValueField="City_id" DataTextField="city" 
                                            Cssclass="form-control" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="City_SelectedIndexChanged"></asp:DropDownList>
                                           </div>
                                    </div>

                                     <div class="form-group row">
                                            <asp:Label ID="lblarea" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Area *</label>
                                        </div>
                                        <div class="col-lg-4">
                                           
                                            <asp:DropDownList ID="area" DataValueField="area" DataTextField="area" 
                                            Cssclass="form-control" runat="server" AutoPostBack="True" 
                                            ></asp:DropDownList>
                                           </div>
                                    </div>




                                      <div class="form-group row">
                                            <asp:Label ID="lblzip" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Zip Code *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtzip" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-actions form-group row">
                                        <div class="col-lg-4 push-lg-4">
                                            <asp:Button ID="btnemergencycontact" OnClick="btn_click" runat="server" Text="ADD Emergency Contact" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                        <!-- /.row -->
                    </div>
                    <!-- /.inner -->
                </div>
                <!-- /.outer -->
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScipt" runat="server">
</asp:Content>
