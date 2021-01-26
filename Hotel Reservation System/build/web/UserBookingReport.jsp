<%-- 
    Document   : UserBookingReport
    Created on : Apr 3, 2020, 6:49:25 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MyDb.dbConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Reservation System</title>
    </head>
    <body>
        <div style="background-color: white;margin-top: 30px;">
            <div style="width: 70%;margin-left: 10%;padding: 40px">
                <h1 style="text-align: left;display: inline-block;">Book Rooms</h1>
                <hr style="height: 3px;background-color: #f1cd8f;border: none;"> 
                <br>
                <%
                    String uid= (String) session.getAttribute("session_user_id");
                    dbConnection db=new dbConnection();
                    Connection con =db.getCon();
                    Statement st=con.createStatement();
                %>
                <table>
                    <tr>
                        <th>Room Name</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                    </tr>
                    <%
                        ResultSet rs = st.executeQuery("select * from roombook where userid='"+uid+"';");
                        while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString("RoomName")%></td>
                        <td><%=rs.getString("checkin")%></td>
                        <td><%=rs.getString("checkout")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                
            </div>
        </div>
    </body>
</html>
