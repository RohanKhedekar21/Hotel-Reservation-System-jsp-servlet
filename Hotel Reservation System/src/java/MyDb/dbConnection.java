/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDb;

/**
 *
 * @author rohan
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class dbConnection {
    
    Connection con;
    public Connection getCon(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem?useSSL=false","root","root");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(dbConnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
    return con;
    }
    
}