/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;
/*
 *
 * @author praful
 */
public class Db_Connection {

    private String database="Library_Management", username = "root", password = "12345";
    private Connection con;
    
    public Connection getConnection() throws SQLException, ClassNotFoundException  {
        Class.forName("com.mysql.jdbc.Driver"); 
      //  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Library_Management"+database+"",""+username+"",""+password+""); 
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Library_Management",username,password); 
       // stm=con.createStatement(); 
        return con;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
