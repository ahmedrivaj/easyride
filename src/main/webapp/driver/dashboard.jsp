<%-- 
    Document   : dashboard
    Created on : Aug 1, 2020, 2:28:42 AM
    Author     : Ahmed Rivaj
--%>
<%@page import="com.easyride.dao.RideDao"%>
<%@page import="com.easyride.models.Ride"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.easyride.models.User"%>
<%@page import="com.easyride.utils.EasyCabSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <%
        EasyCabSession appSession = (EasyCabSession) session.getAttribute(EasyCabSession.ATTR_NAME);
        User user = appSession.getUser();
    %> 
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <style>
            
            .sidebar {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 16px;
}

.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 0px;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}

            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #container{
                padding-top: 10px;
                box-sizing: border-box;
                padding-bottom: 10px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            #content{
                width: 100%;
                display: flex;
                justify-content: space-around;
                margin-top: 5px;
            }
            #map {
                height: 100%;
                float: left;
                width: 63%;
                height: 500px;
            }
            #alerts {
                width: 60%;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
  <a href=""><i class="fa fa-fw fa-home"></i> Dashboard</a>
  <a href="./notify-driver.jsp"><i class="fa fa-fw fa-wrench"></i> Pick Customer</a>
</div>
        <div class="main">
            
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark d-flex">
            <div class="d-flex flex-grow-1">
                <span class="w-100 d-lg-none d-block"></span>
                <a class="navbar-brand d-none d-lg-inline-block" href="#">
                    EasyRide
                </a>
            </div>
            <div class="collapse navbar-collapse text-right align-items-end flex-column">
                <div class="d-flex">
                    <span class="navbar-text pr-2">
                        Logged in as <%=user.getName()%>
                    </span>

                    <form class="form-inline my-2 my-lg-0" method="POST" action="/logout">
                        <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
                    </form>
                </div>

            </div> 
        </nav>
                    
            <div class="container">

        <h1>Driver Dashboard</h1>
                <div>${user.getDriverStatus().toString()}</div>
        <c:if test="${user.getDriverStatus() == User.DriverStatus.Enroute } ">
            <%
                Ride ride = RideDao.getActiveRideForDriver(user);

            %>
            <div

                <h3>Currently Assigned Task</h3>
                <div>Fare: <span>${ride.getFare()}</span></div>
                <div id="map"></div>
                <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkt9Sm5I1Rp2bGMWUN995nsQ3DFfNDc3U&callback=initMap">
                </script>
                <script type="javascript">
                    var origin = { lat: ${ride.getPickupLocationLatitude()}, lng: ride.getPickupLocationLongitude() };
                    var dest = { lat: ${ride.getDestinationLatitude()}, lng: ${ride.getDestinationLongitude()} };
                    function initMap(){
                        var map = new google.maps.Map(document.getElementById("map"), {
                                zoom: 16,
                                center: { lat, lng }
                        });
                        var directionsService = new google.maps.DirectionsService();
                        var directionsRenderer = new google.maps.DirectionsRenderer({
                                draggable: true,
                                map: map
                        });
                        directionsService.route(
                        {
                                origin: origin,
                                destination: dest,
                                waypoints: [],
                                travelMode: "DRIVING",
                                avoidTolls: true
                        },
                        function(response, status) {
                                if (status === "OK") {
                                        display.setDirections(response);
                                } else {
                                        alert("Could not display directions due to: " + status);
                                }
                        }
                        );
                    }
                </script>
            </div>
        </c:if>
        <form action="/driver/setstatus" method="POST">
            <span>Status:</span>
            <select name="driverStatus" id="driverStatus">
                <option value="Busy">Busy</option>
                <option value="Available">Available</option>
            </select>

            <input type="submit" value="Submit"/>
        </form> 
            </div>
            <!-- End of div container -->
            
        </div>
        

    </body>
</html>
