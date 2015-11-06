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
public class bookCheckout extends HttpServlet 
{
     public static int msgNo = -1;
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
            out.println("<title>Servlet bookCheckout</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookCheckout at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
            Connection con = new Db_Connection().getConnection();
            CallableStatement stmt;
            String bookid ="";
            int cardid = -1;
            int branchid = -1;
            
            if(!request.getParameter("bookID").equals(""))
                bookid = request.getParameter("bookID");
            
              if(!request.getParameter("cardID").equals(""))
		cardid = Integer.parseInt(request.getParameter("cardID"));
            
            if(!request.getParameter("branchID").equals(""))
                branchid = Integer.parseInt(request.getParameter("branchID")); 
            
            stmt = con.prepareCall("{call spBookCheckout(?,?,?,?)}");
            
            stmt.setString(1,bookid);
            stmt.setInt(2,branchid);
            stmt.setInt(3,cardid);
            stmt.registerOutParameter(4, java.sql.Types.INTEGER);
            
            stmt.execute();
            int msg = Integer.parseInt(stmt.getString(4));
            
            Integer i = new Integer(msg);
            
            
            request.setAttribute("msgNo", i);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/checkout.jsp");
	    dispatcher.forward(request,response);
                
        } catch (SQLException ex) {
            Logger.getLogger(bookCheckout.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(bookCheckout.class.getName()).log(Level.SEVERE, null, ex);
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
