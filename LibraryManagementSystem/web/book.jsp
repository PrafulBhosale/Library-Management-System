<%-- 
    Document   : book
    Created on : Oct 24, 2015, 5:43:15 PM
    Author     : praful
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="BookServlets.bookSearch" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Search</title>
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
                <form action="bookSearch"  method="post">
                    <table> 
                    <tr>
                   
                        <td><span style="color: red;font-size: 30px;">*</span><input type="text" id="bookID" name="bookID" class="searchBox" placeholder="Book ID" autofocus="true" required="true"/></td>
                    
                    <td><input type="text" id="title" name="title" class="searchBox" placeholder="Book Title" autofocus="true"/></td>
                   
                    <td><input type="text" id="author" name="author" class="searchBox" placeholder="Book Author" autofocus="true"/></td>
                    
                    <td><input type="text" id="branchID"  name="branchID" class="searchBox" placeholder="Library Branch ID" autofocus="true"/></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;"><input type="submit" class="Btn" value="Search" autofocus="true"/></td>
                    </tr>
                    </table>
                </form>
            </div>
            <div class="component">
                <%
                if((request.getAttribute("result")!=null))
                {
                ResultSet rs= (ResultSet)request.getAttribute("result");
                //out.println("rowcount ="+bookSearch.no_of_records);
                
                if(bookSearch.no_of_records > 0)
                {
                    
                %>
                
                <table>
                <thead>    
                <tr>
                    
                <th>Book Id </th>
                <th>Title </th> 
                <th>Author </th>
                <th>Branch_id </th>
                <th>No of available copies </th>
                </tr>
                </thead>
                
                <%
                
                   
                while(rs.next())
                {
                %>
                <tbody>
                <tr>
                
                <td><%=rs.getString("book_id") %> </td>
                <td> <%=rs.getString("title") %></td>
                <td> <%=rs.getString("author")%></td>
                <td> <%=rs.getString("branch_id")%></td>
                <td> <%=rs.getString("no_of_copies")%></td>
                


                 </tr>

                <%
                }
                }
                }
                bookSearch.no_of_records = 0;
                %>
                
                 </tbody>
                </table>
               
            </div>
        </div>
    </body>
</html>
