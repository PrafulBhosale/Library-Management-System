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
public class bookPayfines extends HttpServlet
{
    Connection con;
    CallableStatement stmt;
    public static int foundrows = -1 ;
     public static int ispaid = 0 ;
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
             response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
           
            
           
            int loanid = -1;
            String[] checkedLoanID;
            con = new Db_Connection().getConnection();
            
            if(request.getParameterValues("chkLoanid") != null)
            {
             checkedLoanID = request.getParameterValues("chkLoanid");
            
              foundrows =1;
                    for(String s: checkedLoanID)
                   {
                        loanid = Integer.parseInt(s);
                        stmt = con.prepareCall("{call spPayFines(?)}");


                        stmt.setInt(1,loanid);

                        ResultSet rst = stmt.executeQuery();
                        request.setAttribute("fineMsg", rst);

                        while(rst.next())
                            ispaid++;
                        rst.beforeFirst();

                   }
            
            }
         
         else
             foundrows = 0;
            
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fines.jsp");
	        dispatcher.forward(request,response);
            
        } catch (SQLException ex) {
            Logger.getLogger(bookSearch.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(bookSearch.class.getName()).log(Level.SEVERE, null, ex);
             ex.printStackTrace();
            
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
