package BookServlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.*;
import java.sql.*;
import database.Db_Connection;
/**
 *
 * @author praful
 */
public class books 
{
    ArrayList<String> bookid = new ArrayList<String>();
    ArrayList<String> title = new ArrayList<String>();
    ArrayList<String> author = new ArrayList<String>();
    ArrayList<Integer> branchid = new ArrayList<Integer>();
    ArrayList<Integer> copies_available = new ArrayList<Integer>();
    Connection con;
    CallableStatement stmt;
    
    public void listAvailableBooks() throws SQLException, ClassNotFoundException
    {

        con = new Db_Connection().getConnection();
        
        stmt = con.prepareCall("{call spBookSearch(?,?,?,?)}");
        
        stmt.setString(1,"");
        stmt.setString(2,"");
        stmt.setString(3,"");
        stmt.setInt(4,3);
           
            ResultSet rs = stmt.executeQuery();
            
        }
}
    

