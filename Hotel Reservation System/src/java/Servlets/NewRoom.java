/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import MyDb.dbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rohan
 */
@WebServlet(name = "NewRoom", urlPatterns = {"/NewRoom"})
public class NewRoom extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String roomname = request.getParameter("roomname");
            String roomtype = request.getParameter("roomtype");
            String adult = request.getParameter("adult");
            String child = request.getParameter("child");
            String price = request.getParameter("price");
            String capacity = request.getParameter("capacity");
            
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            
            ResultSet rs = st.executeQuery("select room_name,room_type from rooms where room_name='"+roomname+"' and room_type='"+roomtype+"';");
            if(rs.next()){  
                out.println("<script type=\"text/javascript\">");
                out.println("location.replace(document.referrer);");
                out.println("alert('Enter Room Type has alredy Register please enter another Room Type');");
                out.println("</script>");
            }else{
                int r = st.executeUpdate("insert into rooms(room_name,room_type,room_price,room_capacity,numberofchild,numberofadult) values('"+roomname+"','"+roomtype+"','"+price+"','"+capacity+"','"+child+"','"+adult+"')");
                if(r!=0){
                    response.sendRedirect("newrooms.jsp");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
