package BookServlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import database.Db_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jk
 */
public class bookBorrowers extends HttpServlet
{
    Connection con,con1;
    CallableStatement stmt,stmt1;
    public static int rowcount = 0;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookSearch</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookSearch at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        try {
            
            String fname=null,lname=null,address=null,city=null,state=null,phone=null;
            
            
            if(!request.getParameter("Fname").equals(""))
		fname = request.getParameter("Fname");
		
            if(!request.getParameter("Lname").equals(""))
		lname = request.getParameter("Lname");
            
            if(!request.getParameter("Address").equals(""))
		address = request.getParameter("Address");
            
            if(!request.getParameter("City").equals(""))
		city = request.getParameter("City");
		
            if(!request.getParameter("State").equals(""))
		state = request.getParameter("State");
            
            if(!request.getParameter("Phone").equals(""))
		phone = request.getParameter("Phone");
            
                
            con = new Db_Connection().getConnection();
            con1 = new Db_Connection().getConnection();
            
            stmt1 = con.prepareCall("{call spCheckBorrower(?,?,?)}");
            
            stmt1.setString(1,fname);
            stmt1.setString(2,lname);
            stmt1.setString(3,address);
            
             ResultSet rs1 = stmt1.executeQuery();
             
                while(rs1.next())
            
                    rowcount++;
               // PrintWriter out = response.getWriter();
              //  out.println("<h2>"+rowcount+"</h2>");
            if(rowcount == 0)    
            {
            
            stmt = con.prepareCall("{call spAddBorrower(?,?,?,?,?,?)}");
            
            stmt.setString(1,fname);
            stmt.setString(2,lname);
            stmt.setString(3,address);
            stmt.setString(4,city);
            stmt.setString(5,state);
            stmt.setString(6,phone);
            
          
            ResultSet rs = stmt.executeQuery();
          
            
          
            request.setAttribute("flag", rs);
            rowcount = -1; 
            }
           
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/borrowers.jsp");
	    dispatcher.forward(request,response);
            
        } catch (SQLException ex) {
            Logger.getLogger(bookSearch.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(bookSearch.class.getName()).log(Level.SEVERE, null, ex);
             ex.printStackTrace();
             System.out.println("Exx");
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
