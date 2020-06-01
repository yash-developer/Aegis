<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true"
    CodeBehind="AddArea.aspx.cs" Inherits="CityWarningSystem.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content" class="bg-container">
        <header class="head">
                    <div class="main-bar row">
                        <div class="col-sm-5 col-lg-6">
                            <h4 class="nav_top_align">
                                <i class="fa fa-pencil"></i>
                                ADD AREA</h4>
                        </div>
                        <div class="col-sm-7 col-lg-6">
                            <ol  class="breadcrumb float-xs-right nav_breadcrumb_top_align">
                                <li class="breadcrumb-item">
                                    <a href="index.html">
                                        <i class="fa fa-pencil" data-pack="default" data-tags=""></i>
                                        Add Area
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
                            <div class="card-block m-t-35">
                                <div class="form-horizontal  login_validator" id="form_block_validator">
                                    <div class="form-group row">
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                City *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="DropDownList1" DataValueField="City_id" DataTextField="city" class="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                 Area Name *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:Label ID="Label1" runat="server" Text="Label" class="form-control" Visible="false"></asp:Label>
                                            <asp:TextBox ID="txtArea" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-actions form-group row">
                                        <div class="col-lg-4 push-lg-4">
                                        <asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-primary" onclick="btnsave_Click"   /> 
                                          <button type="reset" class="btn btn-danger">Reset</button>
                                         

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
