<%-- 
    Document   : AllAvailableRooms
    Created on : Apr 2, 2020, 11:34:20 AM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MyDb.dbConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="Javascript/Javascript.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <title>Hotel Reservation System</title>
        <style>
            .btnadrmtype{
                border: 1px solid black;
                background: none;
                outline: none;
                width: 100px;
                height: 30px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div id="externaldiv">
            <div id="header">
                <%@include file="/header.jsp" %>
            </div>
            <div id="center">
                <div style="background-color: white;margin-top: 30px;">
                    <div style="width: 70%;margin-left: 10%;padding: 40px">
                
                        <h1 style="text-align: left;display: inline-block;">All Available Rooms</h1>
                        <hr style="height: 3px;background-color: #f1cd8f;border: none;"> 
                        <br>
                        <%
                            dbConnection db=new dbConnection();
                            Connection con =db.getCon();
                            Statement st=con.createStatement();   
                            String ses= (String) session.getAttribute("session_user_name");
                            String uid= (String) session.getAttribute("session_user_id");
                            String checkin=request.getParameter("checkin");
                            String checkout=request.getParameter("checkout");
                        %>
                        <form action="BookRoom" method="post" id="bookroom" onsubmit="return bookroomvalidate(<%=ses%>);">
                            <input type="hidden" value="<%=checkin%>" name="checkin"/>
                            <input type="hidden" value="<%=checkout%>" name="checkout"/>
                            <input type="hidden" value="<%=ses%>" name="ses"/>
                            <table>
                                <%
                                    ResultSet rs = st.executeQuery("select * from rooms;");
                                    while(rs.next()){
                                %>
                                <tr style="border-left: 1px solid black;">
                                    <td style="padding: 10px;padding-right: 70px;border-bottom: 1px solid;">
                                        <input type="hidden" value="<%=rs.getString("room_name")%>" name="roomname"/>
                                        <p><b><%=rs.getString("room_name")%></b><br><hr></p>
                                        <p>Room Type:<%=rs.getString("room_type")%></p>
                                        <p>Number of child:<%=rs.getString("numberofchild")%></p>
                                        <p>Number of Adult:<%=rs.getString("numberofadult")%></p>
                                        <p>Room Price:<%=rs.getString("room_price")%></p>
                                    </td>
                                    <td style="padding-left: 80px;border-left: 1px solid;border-bottom: 1px solid;">
                                        <button class="btnadrmtype" type="submit">Book Room</button>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>  
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <div id="footer">
                
            </div>
        </div>
    </body>
</html>
