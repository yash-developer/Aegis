<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verifyemail.aspx.cs" Inherits="CityWarningSystem.verifyemail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Login | AEGIS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="img/logo1.ico"/>
    <!--Global styles -->
    <link type="text/css" rel="stylesheet" href="css/components.css"/>
    <link type="text/css" rel="stylesheet" href="css/custom.css"/>
    <!--End of Global styles -->
    <!--Plugin styles-->
    <link type="text/css" rel="stylesheet" href="vendors/bootstrapvalidator/css/bootstrapValidator.min.css"/>
    <link type="text/css" rel="stylesheet" href="vendors/wow/css/animate.css"/>
    <!--End of Plugin styles-->
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
<div class="container wow fadeInDown" data-wow-delay="0.5s" data-wow-duration="2s">
    <div class="row">
        <div class="col-lg-8 push-lg-2 col-md-10 push-md-1 col-sm-10 push-sm-1 login_top_bottom">
            <div class="row">
                <div class="col-lg-8 push-lg-2 col-md-10 push-md-1 col-sm-12">
                    <div class="login_logo login_border_radius1">
                        <h3 class="text-xs-center">
                            <img src="img/logow.png" alt="josh logo" class="admire_logo"><span class="text-white"> AEGIS &nbsp;<br/>
                                Log In</span>
                        </h3>
                    </div>
                    <div class="bg-white login_content login_border_radius">
                            <div class="form-group">
                                <label for="lblmail" class="form-control-label"> E-mail</label>
                                <div class="input-group">
                                    <span class="input-group-addon input_email"><i
                                            class="fa fa-envelope text-primary"></i></span>
                                    <asp:TextBox ID="txtmail" runat="server" CssClass="form-control form-control-md"  name="password" placeholder="E-mail"></asp:TextBox>
                                </div>
                            </div>
                            <!--</h3>-->
                            <div class="form-group">
                                <label for="lblotp" class="form-control-label">otp</label>
                                <div class="input-group">
                                    <span class="input-group-addon addon_password"><i
                                            class="fa fa-lock text-primary"></i></span>
                                    <asp:TextBox ID="txtotp" runat="server" CssClass="form-control form-control-md"    name="password" placeholder="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                </div>
                            </div>
                     
                        <div class="form-group">
                            <div class="row">
                                   <div class="col-lg-12">
                                        <asp:Button ID="verifybutton" runat="server" Text="Verify"  
                                            CssClass="btn btn-primary btn-block login_button" 
                                            onclick="verifybutton_Click"/>
                                    </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">Don't you have an Account? </label>
                            <a href='register.aspx'><b>Sign Up</b></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- global js -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/tether.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- end of global js-->
<!--Plugin js-->
<script type="text/javascript" src="vendors/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="vendors/wow/js/wow.min.js"></script>
<!--End of plugin js-->
<script type="text/javascript" src="js/pages/login.js"></script>
    </form>
</body>
</html>