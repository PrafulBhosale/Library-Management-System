<%-- 
    Document   : checkin
    Created on : Oct 25, 2015, 4:52:28 AM
    Author     : praful
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="BookServlets.bookPayfines" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="Css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="Css/text.css"/>
        <link rel="stylesheet" type="text/css" href="Css/960_16.css"/>
       

        <link rel="stylesheet" type="text/css" href="Css/styles.css"/>
        
        
        <link rel="stylesheet" type="text/css" href="Css/demo.css" />
        <link rel="stylesheet" type="text/css" href="Css/component.css" />

    </head>
    <body>
        <%@include file="IncludePages/_navigationBar.jsp"%>
        <div class="container" id="loadSearches" >
            <div class="component" style="height:auto;">
                <form action="bookFines"  method="post">
                    <table> 
                    <tr>
                        
                    <td colspan="2"><input type="text" id="cardID"  name="cardID" class="searchBox" placeholder="Borrowers Card ID" autofocus="true"/></td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <td colspan="2" style="text-align: center;width: 15px;">Paid:&nbsp;<input type="checkbox" name="chkPaid" value="1" autofocus="true"/></td>
                    
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;"><input type="submit" class="Btn" value="Calculate Fines" autofocus="true"/></td>
                       <!-- <td colspan="2" style="text-align: center;"><input type="submit" class="Btn" value="Display Fines" autofocus="true"/></td> -->
                    </tr>
                    </table>
                </form>
            </div>
            <div class="component">
                <div class="component" style="height:auto;">
                        <%
                            if(bookPayfines.foundrows == 1)
                                {
                                    if(bookPayfines.ispaid > 0)
                                   // if((request.getAttribute("fineMsg")!= null))
                                   {
                                        //ResultSet rt = (ResultSet)request.getAttribute("fineMsg");
                                        //out.println("<h4 style='text-align: center;color: red;'>"+rt.getInt(1)+"</h4>");
                                   // }
                                    out.println("<h4 style='text-align: center;color: red;'>Fine paid Successfully!!</h4>");
                                    bookPayfines.ispaid = 0;
                                    }
                                   else
                                    
                                       out.println("<h4 style='text-align: center;color: red;'>Book is not Checked IN</h4>");
                                    
                                    
                                    bookPayfines.foundrows = -1;
                                }
                            else if(bookPayfines.foundrows == 0)
                                {
                                    out.println("<h4 style='text-align: center;color: red;'>Please select atleast one row!!</h4>");
                                     bookPayfines.foundrows = -1;
                                }
                           
                            %>
                    </div>
                <%
                if((request.getAttribute("fineresult")!= null))
                {
                    ResultSet rs= (ResultSet)request.getAttribute("fineresult");
               
                
                %>
                
                <p></p>
              <form action="bookPayfines"  method="post">      
                <table>
                <thead>    
                <tr>
                <th></th>    
               
                <th>Borrowers Card Number </th> 
                <th>Fine Amount($) </th>
                
                </tr>
                </thead>
                <%
                while(rs.next())
                {
                %>
                <tbody>
                <tr>
                <td>
                    <input type="checkbox" name="chkLoanid" value="<%=rs.getString("loan_id")%>" style="width: 25px">
                </td>
               
                <td><%=rs.getString("card_no") %> </td>
                <td> <%=rs.getString("Fine") %></td>
                
                 </tr>

                <%
                }
                %>
                <tr>
                <td colspan="4" style="text-align: center;"><input type="submit" class="Btn" value="Pay Fines" autofocus="true"/></td>
                </tr>
                <%
                
                }
                %>
                 
                 </tbody>
                </table>
              </form>
            </div>
        </div>
    </body>
</html>
