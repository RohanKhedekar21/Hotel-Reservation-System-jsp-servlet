/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import MyDb.dbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author rohan
 */
@WebServlet(name = "BookRoom", urlPatterns = {"/BookRoom"})
public class BookRoom extends HttpServlet {

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
            //String user = request.getParameter("ses");
            HttpSession session  = request.getSession();
            //String ses= (String) session.getAttribute("session_user_name");
            String uid= (String) session.getAttribute("session_user_id");
            String roomname = request.getParameter("roomname");
            String checkin = request.getParameter("checkin");
            String checkout = request.getParameter("checkout");
            
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            
            int r = st.executeUpdate("insert into roombook(userid,roomname,checkin,checkout) values('"+uid+"','"+roomname+"','"+checkin+"','"+checkout+"')");
            if(r!=0){
                response.sendRedirect("index.jsp");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BookRoom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
