<%-- 
    Document   : book
    Created on : Oct 24, 2015, 5:43:15 PM
    Author     : praful
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="BookServlets.bookBorrowers" %>

    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrower Management</title>
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
                <form action="bookBorrowers"  method="post">
                    <table> 
                    <tr>
                    <td><label id="lblFname"> First Name :</label><span style="color: red;font-size: 30px;">*</span></td>
                    <td><input type="text" id="Fname" name="Fname" class="searchBox"  autofocus="true" required="true"/></td>
                    </tr>
                    <tr>
                         <td><label id="lblLname"> Last Name :</label><span style="color: red;font-size: 30px;">*</span></td>
                    <td><input type="text" id="Lname" name="Lname" class="searchBox"  autofocus="true" required="true"/></td>
                   </tr>
                   <tr>
                         <td><label id="lblFname"> Phone :</label><span style="color: red;font-size: 30px;">*</span></td>
                         <td><input type="text" id="Phone"  name="Phone" class="searchBox" autofocus="true" placeholder="1-xxx-xxx-xxxx" required="true" pattern="1-[0-9]{3}-[0-9]{3}-[0-9]{4}"/></td>
                    </tr>
                    <tr>
                         <td><label id="lblAddress"> Street Address :</label><span style="color: red;font-size: 30px;">*</span></td>
                    <td><input type="text" id="Address" name="Address" class="searchBox"  autofocus="true" required="true"/></td>
                    </tr>
                    <tr>
                         <td><label id="lblCity"> City :</label><span style="color: red;font-size: 30px;">*</span></td>
                    <td><input type="text" id="City"  name="City" class="searchBox"  autofocus="true" required="true"/></td>
                    </tr>
                    <tr>
                         <td><label id="lblState"> State :</label><span style="color: red;font-size: 30px;">*</span></td>
                    <td>
                        <select name="State" required="true">
                                    <option value="AL">Alabama</option>
                                    <option value="AK">Alaska</option>
                                    <option value="AZ">Arizona</option>
                                    <option value="AR">Arkansas</option>
                                    <option value="CA">California</option>
                                    <option value="IL">Illinois</option>
                                    <option value="IN">Indiana</option>
                                    <option value="IA">Iowa</option>
                                    <option value="KS">Kansas</option>
                                    <option value="KY">Kentucky</option>
                                    <option value="LA">Louisiana</option>
                                    <option value="ME">Maine</option>
                                    <option value="MD">Maryland</option>
                                    <option value="MA">Massachusetts</option>
                                    <option value="MI">Michigan</option>
                                    <option value="MN">Minnesota</option>
                                    <option value="MS">Mississippi</option>
                                    <option value="MO">Missouri</option>
                                    <option value="NH">New Hampshire</option>
                                    <option value="NJ">New Jersey</option>
                                    <option value="NM">New Mexico</option>
                                    <option value="NY">New York</option>
                                    <option value="NC">North Carolina</option>
                                    <option value="ND">North Dakota</option>
                                    <option value="OH">Ohio</option>
                                    <option value="OK">Oklahoma</option>
                                    <option value="OR">Oregon</option>
                                    <option value="PA">Pennsylvania</option>
                                    <option value="RI">Rhode Island</option>
                                    <option value="SC">South Carolina</option>
                                    <option value="SD">South Dakota</option>
                                    <option value="TN">Tennessee</option>
                                    <option value="TX">Texas</option>
                                    <option value="UT">Utah</option>
                                    <option value="VT">Vermont</option>
                                    <option value="VA">Virginia</option>
                                    <option value="WA">Washington</option>
                                    <option value="WV">West Virginia</option>
                                    <option value="WI">Wisconsin</option>
                                    <option value="WY">Wyoming</option>
                            </select>				
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%
                           if(bookBorrowers.rowcount == -1)
                             {
                                  bookBorrowers.rowcount = 0;
                                     out.println("<h4 style='text-align: center;color: red;'>Borrower is added successfully!!</h4>");
                             }
                           else
                               if(bookBorrowers.rowcount > 0)
                             {
                                  bookBorrowers.rowcount = 0;
                                     out.println("<h4 style='text-align: center;color: red;'>Borrower is already exist!!</h4>");
                             }
                            %>
                            
                            
                          </td>
                    </tr>        
                    <tr>
                        <td colspan="2" style="text-align: center;"><input type="submit" class="Btn" value="Add Borrower" autofocus="true"/></td>
                    </tr>
                    </table>
                </form>
            </div>
           
        </div>
    </body>
</html>
