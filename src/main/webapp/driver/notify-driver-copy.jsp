<%-- 
    Document   : notify-driver
    Created on : Aug 4, 2020, 10:08:43 AM
    Author     : Ahmed Rivaj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notify Drivers</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1>Incoming Call</h1>
        <h2>On call</h2>
        <h2>Customer Name: Kate Jackson</h2>
        <button type="button" class="btn btn-primary">Take ride</button>
        <button type="button" class="btn btn-primary">Reject</button>
        
        <h1>Notify Drivers</h1>
        ${ball}
        <h2>username</h2>
        ${UserName}
        
    
            <c:forEach items="${mouse}" var="item">
                ${item.userId}<br>
                ${item.name}<br>
            </c:forEach>
           
            

   
    </body>
</html>
