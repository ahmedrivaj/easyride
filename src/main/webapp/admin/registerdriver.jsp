<%-- 
    Document   : dashboard
    Created on : Aug 1, 2020, 2:28:42 AM
    Author     : Ahmed Rivaj
--%>
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
  <a href="./dashboard.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
  <a href="./registerdriver.jsp"><i class="fa fa-fw fa-wrench"></i> Register Driver</a>
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
                <h1>Register Driver</h1>
               
                <c:if test="${errors != null && errors.size() > 0}">
            <c:forEach var="error" items="${errors}" >
                <div> Error: ${error}</div>
            </c:forEach>

        </c:if>
        <c:if test="${messages != null && messages.size() > 0}">
            <c:forEach var="message" items="${messages}" >
                <div> ${message}</div>
            </c:forEach>

        </c:if>
               
                
        <form method="POST" action="/admin/registerdriver">
                <h4 class="card-title mt-3 text-center">Register new Driver</h4>

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="name" class="form-control" placeholder="Full name" type="text">
                </div> <!-- form-group// -->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                    </div>
                    <input name="email" class="form-control" placeholder="Email address" type="email">
                    
                </div> <!-- form-group// -->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                    </div>
                    <input name="contactNumber" class="form-control" placeholder="Contact Number" type="text">
                    
                </div> <!-- form-group// -->
                
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-car"></i> </span>
                    </div>
                    <input name="vehicalRegistrationNumber" class="form-control" placeholder="Vehicle Registration Number" type="text">
                    
                </div> <!-- form-group// -->
                
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-address-card"></i> </span>
                    </div>
                    <input name="licenseNumber" class="form-control" placeholder="License Number" type="text">
                </div> <!-- form-group// -->

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                    </div>
                    <input name="password" class="form-control" placeholder="Password" type="password">
                </div> <!-- form-group// -->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                    </div>
                    <input name="passwordAgain" class="form-control" placeholder="Repeat password" type="password">
                </div> <!-- form-group// -->                                      
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
                </div> <!-- form-group// -->      
                <p class="text-center">Have an account? <a href="/public/login.jsp">Log In</a> </p>                                                                 
            </form>
    
                
            </div>
            
        </div>
        

    </body>
</html>
