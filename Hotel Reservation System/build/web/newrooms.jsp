<%-- 
    Document   : newrooms
    Created on : Apr 1, 2020, 8:16:17 PM
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
        <title>Hotel Reservation System</title>
        <style>
            .btnadd{
                border: none;
                outline: none;
                background: none;
                background-color: maroon;
                color: white;
                border: 1px solid black;
                border-radius: 30px;
                height: 28px;
                width: 62px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();                
        %>
        <div id="externaldiv">
            <div id="header">
                <%@include file="/AdminHeader.jsp" %>
            </div>
            <div id="center">
                <div style="background-color: white;margin-top: 30px;">
                    <div style="width: 70%;margin-left: 15%;padding: 40px">
                
                        <h1 style="text-align: left;display: inline-block;">Adding New Room Type</h1>
                        <hr style="height: 3px;background-color: #f1cd8f;border: none;">
                        <br><br>
                        
                        <form action="NewRoom" method="post">
                            
                            <label for="RoomName">Enter Room Name:</label>
                            <input type="text" id="roomtype" name="roomname"  required/>
                            
                            <br><br>
                            <label for="Roomtype">Select Room Type:</label>
                            <select id="roomtype" name="roomtype">
                                <%
                                    ResultSet rs = st.executeQuery("select * from roomtype;");
                                    while(rs.next()){
                                %>
                                <option value="<%=rs.getString("roomtype")%>"><%=rs.getString("roomtype")%></option>
                                <%
                                    }
                                %>
                            </select>
                            
                            <br><br>
                            <label for="price">Price:</label>
                            
                            <input type="number" min="1" id="price" name="price" required/>
                            
                            <br><br>
                            <label for="price">Number of Adult:</label>
                            <input type="number" min="1" id="adult" name="adult" required/>
                            
                            <br><br>
                            <label for="price">Number of Child:</label>
                            <input type="number" min="1" id="child" name="child" required/>
                            
                            <br><br>
                            <label for="capacity">Capacity</label>
                            <input type="number" min="0" id="capacity" name="capacity" required/>
                            
                            <br><br>
                            <button class="btnadd" type="submit">Add</button>
                            
                        </form>
                        
                    </div>
                </div>
            </div>
            <div id="footer">
                
            </div>
        </div>
    </body>
</html>
