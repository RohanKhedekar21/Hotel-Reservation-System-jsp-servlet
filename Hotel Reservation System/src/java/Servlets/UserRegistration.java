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
@WebServlet(name = "UserRegistration", urlPatterns = {"/UserRegistration"})
public class UserRegistration extends HttpServlet {

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
            String name = request.getParameter("Name");
            String email = request.getParameter("Email");
            String mobile = request.getParameter("number");
            String password = request.getParameter("confirmpass");
            
            dbConnection db=new dbConnection();
            Connection con =db.getCon();
            Statement st=con.createStatement();
            
            ResultSet rs = st.executeQuery("select UserEmail from user where UserEmail='"+email+"';");
            if(rs.next()){
                out.println("<script type=\"text/javascript\">");
                out.println("location.replace(document.referrer);");
                out.println("alert('Enter Email or Mobile has alredy Register please enter another Email Id OR Mobile Number');");
                out.println("</script>");
            }else{
                int r = st.executeUpdate("insert into User(UserName,UserEmail,UserMobile,UserPassword) values('"+name+"','"+email+"','"+mobile+"','"+password+"')");
                if(r!=0){
                    Connection con2 =db.getCon();
                    Statement st2=con2.createStatement();
                    ResultSet rs2=st2.executeQuery("select Userid,UserName from user where UserMobile='"+mobile+"' and UserPassword='"+password+"'");
                    rs2.next();
                    String sessionname=rs2.getString("UserName");
                    String sessionid=rs2.getString("Userid");
                    HttpSession session=request.getSession();
                    session.setAttribute("session_user_name", sessionname);
                    session.setAttribute("session_user_id", sessionid);
                    
                    response.sendRedirect("index.jsp");
                }
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserRegistration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
