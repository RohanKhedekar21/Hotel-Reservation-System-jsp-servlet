<%-- 
    Document   : adminroom
    Created on : Apr 1, 2020, 4:09:43 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MyDb.dbConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/Css.css" rel="stylesheet" type="text/css"/>
        <script src="Javascript/Javascript.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <title>Admin-Hotel Reservation System</title>
        <style>
            .btnadrmtype{
                border: 1px solid black;
                background: none;
                outline: none;
                width: 74px;
                height: 27px;
                cursor: pointer;
            }
            .counterCell:before {              
                content: counter(tableCount); 
                counter-increment: tableCount; 
            }
            .roomtable{
                max-height: 350px;
                overflow: auto;
            }
            
        </style>
    </head>
    <body>
        <%
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();                
        %>
        <div style="background-color: white;margin-top: 30px;">
            <div style="width: 70%;margin-left: 15%;padding: 40px">
                
                <h1 style="text-align: left;display: inline-block;">List Rooms</h1>
                <hr style="height: 3px;background-color: #f1cd8f;border: none;"> 
                <br>
                
                <form action="DeleteRoom" method="post">
                    <div class="roomtable">
                        <table >
                            <tr>
                                <th>No.</th>
                                <th></th>
                                <th>Room Name</th>
                                <th>Room Type</th>
                                <th>Number of Adult</th>
                                <th>Number of Child</th>
                                <th>Price</th>
                                <th>Capacity</th>
                            </tr>
                            <%
                                ResultSet rs = st.executeQuery("select * from rooms;");
                                while(rs.next()){
                            %>
                            <tr>
                                <td class="counterCell"></td>
                                <td><input type="checkbox" name="roomid" value="<%=rs.getString("roomid")%>"/></td>
                                <td><%=rs.getString("room_name")%></td>
                                <td><%=rs.getString("room_type")%></td>
                                <td><%=rs.getString("numberofadult")%></td>
                                <td><%=rs.getString("numberofchild")%></td>
                                <td><%=rs.getString("room_price")%></td>
                                <td><%=rs.getString("room_capacity")%></td>
                            </tr>
                            <%
                                }
                            %>  
                        </table>
                        <br><br>
                    </div>
                    <button class='btnadrmtype' type="button" onclick="newroom()">New</button>
                    <button class='btnadrmtype' type="submit">Delete</button>
                </form>
            </div>
        </div>
    </body>
</html>
