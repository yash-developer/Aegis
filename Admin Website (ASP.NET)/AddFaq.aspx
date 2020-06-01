<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="AddFaq.aspx.cs" Inherits="CityWarningSystem.AddFaq" %>
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
                                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Add Question *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtQuestion" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                            <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <div class="col-lg-4  text-lg-right">
                                            <label for="required2" class="form-control-label">
                                                Add Answer *</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtAnswer" runat="server" class="form-control" required></asp:TextBox>
                                        </div>
                                    </div>
                                   

                                    <div class="form-actions form-group row">
                                        <div class="col-lg-4 push-lg-4">
                                            <asp:Button ID="btnfaq" OnClick="btn_click" runat="server" Text="ADD FAQs" />
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
