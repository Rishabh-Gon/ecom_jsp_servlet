<%-- 
    Document   : logout_customer
    Created on : 27 Mar, 2025, 6:59:16 PM
    Author     : RG
--%>

<%@page import="pojo.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Customer</title>
    </head>
    <%
    session = request.getSession();
    if (session == null) {
    response.sendRedirect("index.jsp");
    }
    Customer c=(Customer)session.getAttribute("customer");
    int custid=c.getId_cust();
    String custname=c.getCust_name();
    %>
    <body style="background-image: url(images/shop.jpg)">         
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 810px">
            <h1>Welcome <%=custname%></h1>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 810px">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <td style="justify-content: center; text-align: justify; padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="customerhome.jsp"style="color: black; text-decoration: none;">
                    <b>Products</b>                    
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="orderhist.jsp" style="color: black; text-decoration: none;">
                <b>Order History</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="logout_customer.jsp" style="color: yellow; text-decoration: none;">
                <b>Logout</b>
                </a>
            </td>
            </table>
            <div style="margin-bottom: auto; justify-content: center; padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <form action="Logout" method="post" 
                      style="font-size: 15px;">   
                    <div style="align-items: center; margin-left: 250px">                       
                        <button type="submit" style="width: 200px; padding: 10px; background: yellow; color: black;
                                border: none; border-radius: 5px;"><b>Logout</b></button><br>                                           
                    </div>
                    </form>
            </div>
        </div>
    </body>
</html>
