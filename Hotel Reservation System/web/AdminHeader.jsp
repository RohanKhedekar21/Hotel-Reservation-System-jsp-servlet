<%-- 
    Document   : AdminHeader
    Created on : Apr 1, 2020, 1:58:27 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Hotel Reservation System</title>
    </head>
    <body>
        <div style="background-color: brown;">
            <h1>Hotel Reservation System</h1>
        </div>
        <div style="text-align: center;margin-top: 20px;background-color: white;">
            <button class="btnmenu" onclick="adminhome()">HOME</button>
            <button class="btnmenu" onclick="adminrooms()">Rooms</button>
            <button class="btnmenu" onclick="adminroomtype()">Room Types</button>
            <button class="btnmenu" onclick="adminreport()">Report</button>
            <button class="btnmenu" onclick="adminlogout()">Logout</button>
        </div>
    </body>
</html>
