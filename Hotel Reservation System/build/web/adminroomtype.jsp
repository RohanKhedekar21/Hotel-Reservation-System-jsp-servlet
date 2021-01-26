<%-- 
    Document   : adminroomtype
    Created on : Apr 1, 2020, 4:10:14 PM
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
                
                <h1 style="text-align: left;display: inline-block;">List Room Type</h1>
                <hr style="height: 3px;background-color: #f1cd8f;border: none;"> 
                <br>
                <form action="DeleteRoomType" method="post">
                    <div class="roomtable">
                        <table >
                            <tr>
                                <th>No.</th>
                                <th></th>
                                <th>Room Type</th>
                            </tr>
                            <%
                                ResultSet rs = st.executeQuery("select * from roomtype;");
                                while(rs.next()){
                            %>
                            <tr>
                                <td class="counterCell"></td>
                                <td><input type="checkbox" name="roomtypeid" value="<%=rs.getString("roomtypeid")%>"/></td>
                                <td><%=rs.getString("roomtype")%></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                    <button class='btnadrmtype' type="button" onclick="newroomtype()">New</button>
                    <button class='btnadrmtype'type="submit">Delete</button>
                </form>
            </div>       
        </div>
    </body>
</html>
