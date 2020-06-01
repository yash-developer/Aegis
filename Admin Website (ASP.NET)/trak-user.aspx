<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true"
    CodeBehind="trak-user.aspx.cs" Inherits="CityWarningSystem.trak_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    #map
    {
        width:100%;
        height:400px;
    }
</style>
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
                                    <div id="map">
                                    </div>
                                     <asp:HiddenField ID="hnlat" Value="23.037771" runat="server" />
                                          <asp:HiddenField ID="hnlong" Value="72.512072"  runat="server" />
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
    <script>
        function initMap() {
            var latvalue = document.getElementById("ContentPlaceHolder1_hnlat").value;
            var longvalue = document.getElementById("ContentPlaceHolder1_hnlong").value;
//            var latvalue = "23.037771";
//            var longvalue = "72.512072";
            var myLatLng = new google.maps.LatLng(latvalue, longvalue);
            // Create a map object and specify the DOM element for display.
            var map = new google.maps.Map(document.getElementById('map'), {
                center: myLatLng,
                zoom: 15
            });
            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                animation:google.maps.Animation.BOUNCE,
                title: 'Hello World!',
                icon: "img/marker.png"
            });
        }
                setInterval(initMap, 10000);

    </script>
     <script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3_b7zC3Gx6jQdGqKF3XFbfBYRcx26lZ8&callback=initMap">
    </script>
   
</asp:Content>
