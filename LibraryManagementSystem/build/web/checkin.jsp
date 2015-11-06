<%-- 
    Document   : checkin
    Created on : Oct 25, 2015, 4:52:28 AM
    Author     : praful
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="BookServlets.bookCheckin" %>
    
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
                <form action="bookCheckinSearch"  method="post">
                    <table> 
                    <tr>
                   
                        <td><span style="color: red;font-size: 30px;">*</span><input type="text" id="bookID" name="bookID" class="searchBox" placeholder="Book ID" autofocus="true" required="true"/></td>
                    
                    <td><input type="text" id="Fname" name="Fname" class="searchBox" placeholder="First Name" autofocus="true"/></td>
                   
                    <td><input type="text" id="Lname" name="Lname" class="searchBox" placeholder="Last Name" autofocus="true"/></td>
                    
                    <td><input type="text" id="cardID"  name="cardID" class="searchBox" placeholder="Borrowers Card ID" autofocus="true"/></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;"><input type="submit" class="Btn" value="Search" autofocus="true"/></td>
                    </tr>
                    </table>
                </form>
            </div>
            <div class="component">
                <div class="component" style="height:auto;">
                        <%
                            if(bookCheckin.rowselect == 1)
                                {
                                    out.println("<h4 style='text-align: center;color: red;'>Check IN Successful!!</h4>");
                                    bookCheckin.rowselect = -1;
                                }
                            else if(bookCheckin.rowselect == 0)
                                {
                                    out.println("<h4 style='text-align: center;color: red;'>Please select atleast one record !!</h4>");
                                     bookCheckin.rowselect = -1;
                                }
                           
                            %>
                    </div>
                <%
                if((request.getAttribute("checkinresult")!= null))
                {
                    ResultSet rs= (ResultSet)request.getAttribute("checkinresult");
               
                
                %>
                <p>
              <form action="bookCheckin"  method="post">      
                <table>
                <thead>    
                <tr>
                <th></th>    
                <th>Book Id </th>
                <th>Date Out </th> 
                <th>Due Date </th>
                <th>Branch_id </th>
                <th>Fine($) </th>
                <th>First Name </th>
                <th>Last Name </th>
                </tr>
                </thead>
                <%
                while(rs.next())
                {
                %>
                <tbody>
                <tr>
                <td>
                    <input type="checkbox" name="chkBookID" value="<%=rs.getString("loan_id")%>" style="width: 25px">
    	  	</td>
                <td><%=rs.getString("book_id") %> </td>
                <td> <%=rs.getString("date_out") %></td>
                <td> <%=rs.getString("due_date")%></td>
                <td> <%=rs.getString("branch_id")%></td>
                <td> <%=rs.getString("fines")%></td>
                <td> <%=rs.getString("fname")%></td>
                <td> <%=rs.getString("lname")%></td>
                


                 </tr>

                <%
                }
                %>
                <tr>
                        <td colspan="7" style="text-align: center;"><input type="submit" class="Btn" value="Check IN" autofocus="true"/></td>
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
