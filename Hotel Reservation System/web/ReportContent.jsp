<%-- 
    Document   : ReportContent
    Created on : Apr 3, 2020, 12:12:39 AM
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
    </head>
    <body>
        <%
            String checkin=request.getParameter("checkin");
            String checkout=request.getParameter("checkout");
            
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();   
            
        %>
        <table>
            <tr>
                <th>User</th>
                <th>Room Name</th>
                <th>Check-In</th>
                <th>Check-Out</th>
            </tr>
            <%
                if(!checkin.isEmpty() && !checkout.isEmpty()){
                    ResultSet rs = st.executeQuery("select * from roombook where checkin >= '"+checkin+"' AND checkout <= '"+checkout+"'; ");
                    while(rs.next()){
            %>
            <tr>
                <td>
                    <%
                        int uid=rs.getInt("userid");
                        Connection con2 =db.getCon();
                        Statement st2=con2.createStatement();   
                        ResultSet rs2 = st2.executeQuery("select UserName from user where Userid='"+uid+"';");
                        if(rs2.next()){
                            out.print(rs2.getString("UserName"));
                        }
                    %>
                </td>
                <td><%=rs.getString("roomname")%></td>
                <td><%=rs.getString("checkin")%></td>
                <td><%=rs.getString("checkout")%></td>
            </tr>
            <%
                }
            }
            if(!checkin.isEmpty() && checkout.isEmpty()){
                ResultSet rs = st.executeQuery("select * from roombook where checkin >= '"+checkin+"'; ");
                while(rs.next()){
            %>
            <tr>
                <td>
                    <%
                        int uid=rs.getInt("userid");
                        Connection con2 =db.getCon();
                        Statement st2=con2.createStatement();   
                        ResultSet rs2 = st2.executeQuery("select UserName from user where Userid='"+uid+"';");
                        if(rs2.next()){
                            out.print(rs2.getString("UserName"));
                        }
                    %>
                </td>
                <td><%=rs.getString("roomname")%></td>
                <td><%=rs.getString("checkin")%></td>
                <td><%=rs.getString("checkout")%></td>
            </tr>
            <%    
                }
            }
            if(checkin.isEmpty() && !checkout.isEmpty()){
                ResultSet rs = st.executeQuery("select * from roombook where checkout <= '"+checkout+"'; ");
                while(rs.next()){
            %>
            <tr>
                <td>
                    <%
                        int uid=rs.getInt("userid");
                        Connection con2 =db.getCon();
                        Statement st2=con2.createStatement();   
                        ResultSet rs2 = st2.executeQuery("select UserName from user where Userid='"+uid+"';");
                        if(rs2.next()){
                            out.print(rs2.getString("UserName"));
                        }
                    %>
                </td>
                <td><%=rs.getString("roomname")%></td>
                <td><%=rs.getString("checkin")%></td>
                <td><%=rs.getString("checkout")%></td>
            </tr>
            <%
                }
            }
            %>
        </table>
        
    </body>
</html>
