<%-- 
    Document   : admin
    Created on : Apr 1, 2020, 10:40:14 AM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/Css.css" rel="stylesheet" type="text/css"/>
        <script src="Javascript/Javascript.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <title>Admin-Hotel Reservation System</title>
    </head>
    <body>
        <div id="externaldiv">
            <div id="header">
                <%@include file="/AdminHeader.jsp" %>
            </div>
            <div id="center">
                <div style="background-color: white;margin-top: 30px;">
                    <div style="max-height: 10%;margin: auto;padding: 40px">
                        <div style="margin: auto;max-width: 52%;">
                            <img src="images/admin.jfif" alt="Hotel Reservation System"/>
                        </div>
                    </div>
                </div>
            </div>
            <div id="footer">
                
            </div>
        </div>
    </body>
</html>
