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
@WebServlet(name = "Userlogin", urlPatterns = {"/Userlogin"})
public class Userlogin extends HttpServlet {

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
            String mobile = request.getParameter("number");
            String password = request.getParameter("password");
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            
            ResultSet rs=st.executeQuery("select Userid,UserName from user where UserMobile='"+mobile+"' and UserPassword='"+password+"'");
            if(rs.next()){
                String sessionname=rs.getString("UserName");
                String sessionid=rs.getString("Userid");
                HttpSession session=request.getSession();
                session.setAttribute("session_user_name",sessionname);
                session.setAttribute("session_user_id", sessionid);
                
                response.sendRedirect("index.jsp");
            }
            else{
                //out.println("<h1>Please check the Username and Password</h1>");
                out.println("<script type=\"text/javascript\">");
                out.println("location='index.jsp';");
                out.println("alert('Username or password incorrect');");
                out.println("</script>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Userlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
