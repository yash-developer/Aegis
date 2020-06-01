<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="CityWarningSystem.AddUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add User</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="img/logo1.ico"/>
    <!-- Global styles -->
    <link type="text/css" rel="stylesheet" href="css/components.css"/>
    <link type="text/css" rel="stylesheet" href="css/custom.css"/>
    <!--End of Global styles -->
    <!--Plugin styles-->
    <link type="text/css" rel="stylesheet" href="vendors/datepicker/css/bootstrap-datepicker.min.css">
    <link type="text/css" rel="stylesheet" href="vendors/select2/css/select2.min.css"/>
    <link type="text/css" rel="stylesheet" href="vendors/bootstrapvalidator/css/bootstrapValidator.min.css"/>
    <link type="text/css" rel="stylesheet" href="vendors/wow/css/animate.css"/>
    <!--End of Plugin styles-->
    <!--Page level styles-->
    <link type="text/css" rel="stylesheet" href="css/pages/login.css"/>

</head>
<body>
    <form id="form1" runat="server">
    
   <div class="preloader" style=" position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 100000;
  backface-visibility: hidden;
  background: #ffffff;">
    <div class="preloader_img" style="width: 200px;
  height: 200px;
  position: absolute;
  left: 48%;
  top: 48%;
  background-position: center;
z-index: 999999">
        <img src="img/loader.gif" style=" width: 40px;" alt="loading...">
    </div>
</div>
<div class="container wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="row login_top_bottom">
        <div class="col-lg-10 push-lg-1 col-sm-10 push-sm-1">
            <div class="row">
                <div class="col-lg-6 push-lg-3 col-sm-10 push-sm-1">
                    <div class="login_logo login_border_radius1">
                        <h3 class="text-xs-center">
                            <img src="img/logow.png" alt="josh logo" class="admire_logo"><span class="text-white"> ADMIRE<br/>
                                Sign Up</span>
                        </h3>
                    </div>
                    <div class="bg-white login_content login_border_radius">
                       <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="aadharid" class="form-control-label">Aadhar Number *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon"> <i class="fa fa-user text-primary"></i>
                                    </span>
                                        <asp:TextBox ID="AadharId" runat="server" CssClass="form-control"   
                                            name="aadharid" placeholder="Aadhar Number"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="AadharId" ErrorMessage="Please Enter Aadhar Number" 
                                    Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="FirstName" class="form-control-label">FirstName *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon"> <i class="fa fa-user text-primary"></i>
                                    </span>
                                        <asp:TextBox ID="FirstName" runat="server" CssClass="form-control" name="FirstName" placeholder="Username"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="FirstName" ErrorMessage="Enter First Name" 
                                            Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="LastName" class="form-control-label">LastName *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon"> <i class="fa fa-user text-primary"></i>
                                    </span>
                                        <asp:TextBox ID="LastName" runat="server"  CssClass="form-control" name="LastName"  placeholder="Last name"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="LastName" ErrorMessage="Enter Last Name" Font-Size="Medium" 
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="Email" class="form-control-label">Email *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope text-primary"></i>
                                    </span>
                                        <asp:TextBox ID="Email" runat="server" placeholder="Email Address"  
                                            name="Email"  CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="Email" ErrorMessage="Enter Email ID" Font-Size="Medium" 
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="Email" ErrorMessage="Enter Valid Email ID" 
                                            Font-Size="Medium" ForeColor="Red" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="phone" class="form-control-label">Phone *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-phone text-primary"></i>
                                    </span>
                                        <asp:TextBox ID="MobileNo" runat="server"  placeholder="Phone Number" name="phone" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="MobileNo" ErrorMessage="Enter Phone No" Font-Size="Medium" 
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                    runat="server" ControlToValidate="MobileNo" ErrorMessage="Range Must be 10" 
                                    Font-Size="Medium" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </div>
                           <div class="form-group row">
                                <div class="col-sm-12">
                                
                                    </div> <label for="City" class="form-control-label">Select City *</label>
                                    <div class="input-group">
                                        <asp:DropDownList ID="City" DataValueField="City_id" DataTextField="city" 
                                            Cssclass="form-control" runat="server" AutoPostBack="True" 
                                          ></asp:DropDownList>
                                       
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="City" ErrorMessage="Select City" Font-Size="Medium" 
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="Area" class="form-control-label">Select Area *</label>
                                    <div class="input-group">
                                       <asp:DropDownList ID="Area" DataValueField="area" DataTextField="area" Cssclass="form-control"
                                         runat="server"></asp:DropDownList>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="password" class="form-control-label text-sm-right">Password *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-key text-primary"></i>
                                    </span>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="password" name="password" CssClass="form-control"/>
                                        
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="Enter Password" Font-Size="Medium" 
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="confirmpassword" class="form-control-label">Confirm Password *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-key text-primary"></i>
                                    </span>
                                        <asp:TextBox ID="Password2" runat="server" TextMode="password" placeholder="Confirm Password" name="confirmpassword"  CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="Password2" ErrorMessage="Enter Confirmation Password" 
                                            Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="Password2" ControlToValidate="Password" 
                                    ErrorMessage="Password Donot Match" Font-Size="Medium" ForeColor="Red"></asp:CompareValidator>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label for="Address" class="form-control-label">Address *</label>
                                    <div class="input-group">
                                    <span class="input-group-addon"> <i class="fa fa-user-info"></i>
                                    </span>
                                        <asp:TextBox ID="Address" runat="server"  CssClass="form-control" name="Address"  placeholder="Address"></asp:TextBox>
                                       
                                    </div>
                                </div>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                            ControlToValidate="Address" ErrorMessage="Enter Address" Font-Size="Medium" 
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                <label class="form-control-label">Gender: </label>
                                <div>
                                    <asp:RadioButton ID="Male" runat="server" GroupName="gender" 
                                        CssClass="custom-control-description" Text="Male" Checked="True" />
                                 <asp:RadioButton ID="Female" runat="server" GroupName="gender" CssClass="custom-control-description" Text="Female" />   
                                 </div>
                                    </div>
                            </div>
                         <!--   <div class="form-group row">
                                <div class="col-sm-9">
                                    <label class="custom-control custom-checkbox">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Send Me Latest News and Updates" CssClass="custom-control-description" />
                                   </label>
                                </div>
                            </div>-->
                            <div class="form-group row">
                                <div class="col-sm-9">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" 
                                        Text="Submit" onclick="Button1_Click" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Reset" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-9">
                                    <label class="form-control-label">Already have an account?</label> <a href="login.aspx" class="text-primary login_hover"><b>Log In</b></a>
                                </div>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</form>
<!-- global js -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/tether.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- end of global js-->
<!--Plugin js-->
<script type="text/javascript" src="vendors/datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="vendors/select2/js/select2.js"></script>
<script type="text/javascript" src="vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="vendors/wow/js/wow.min.js"></script>
<!--End of plugin js-->
<!--Page level js-->
<script type="text/javascript" src="js/pages/register.js"></script>

</body>
</html>
