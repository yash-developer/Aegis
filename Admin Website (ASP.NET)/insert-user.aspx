<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true"
    CodeBehind="insert-user.aspx.cs" Inherits="CityWarningSystem.insert_user" %>

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
                                <i class="fa fa-file-text-o"></i>Insert User
                            </div>
                            <div class="card-block m-t-35">
                                <div class="form-horizontal  login_validator" id="form_block_validator">
                                    <div class="form-group row">
                                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Aadhar Id *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtaadhar" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                First Name *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtfname" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Last Name *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtlname" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label11" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Gender *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:RadioButton ID="Male" runat="server" GroupName="gender" CssClass="custom-control-description"
                                                Text="Male" Checked="True" />
                                            <asp:RadioButton ID="Female" runat="server" GroupName="gender" CssClass="custom-control-description"
                                                Text="Female" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label4" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Email *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtemail" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label5" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Contact *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtcontact" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label6" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Select City *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="City" DataValueField="City_id" DataTextField="city" CssClass="form-control"
                                                runat="server" AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label7" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Select Area *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="Area" DataValueField="area" DataTextField="area" Cssclass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label8" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Password *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtpass" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label9" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Confirm Password *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtconfpass" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <asp:Label ID="Label10" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Address *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtaddress" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-actions form-group row">
                                        <div class="col-lg-4 push-lg-4">
                                            <asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-primary" 
                                                onclick="btnsave_Click" />
                                            <button type="reset" class="btn btn-danger">
                                                Reset</button>
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
