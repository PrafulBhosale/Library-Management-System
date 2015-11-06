<%-- 
    Document   : checkout
    Created on : Oct 25, 2015, 2:35:43 AM
    Author     : praful
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
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
                <form action="bookCheckout"  method="post">
                    <table> 
                    <tr>
                   
                        <td><span style="color: red;font-size: 30px;">*</span><input type="text" id="bookID" name="bookID" class="searchBox" placeholder="Book ID" autofocus="true" required="true"/></td>
                   
                    <td><span style="color: red;font-size: 30px;">*</span><input type="text" id="cardID" name="cardID" class="searchBox" placeholder="Borrower's Card ID" autofocus="true" required="true"/></td>
                    
                    <td><span style="color: red;font-size: 30px;">*</span><input type="text" id="branchID"  name="branchID" class="searchBox" placeholder="Library Branch ID" autofocus="true" required="true"/></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;"><input type="submit" class="Btn" value="Checkout" autofocus="true"/></td>
                    </tr>
                    <tr>
                        
                    </tr>
                    </table>
                </form>
                    <div class="component" style="height:auto;">
                        <%
                            if((request.getAttribute("msgNo")!=null))
                                {
                                 Integer m = (Integer)request.getAttribute("msgNo");
                                 int msgNo = m.intValue();

                                 if(msgNo == -1)
                                     out.println("<h4 style='text-align: center;color: red;'>You have reached the limit for book checkout!!</h4>");
                                 else
                                     if(msgNo == -2)
                                       out.println("<h4 style='text-align: center;color: red;'>Book Not Available</h4>");
                                     else
                                         if(msgNo == 1)
                                     out.println("<h4 style='text-align: center;color: red;'>Checkout Successful!!</h4>");
                                }
                           
                            %>
                    </div>
            </div>
     </div>        
    </body>
</html>
