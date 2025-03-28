<%-- 
    Document   : orderhist
    Created on : 27 Mar, 2025, 10:59:15 PM
    Author     : RG
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="pojo.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
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
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="orderhist.jsp" style="color: yellow; text-decoration: none;">
                <b>Order History</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="logout_customer.jsp" style="color: black; text-decoration: none;">
                <b>Logout</b>
                </a>
            </td>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <%
                    ArrayList<Order> ord=OrderDAO.getOrders(custid);
                    if(ord.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; color:yellow; justify-content: center; text-align: center">
                    <tr>
                    <th style="background-color: yellow; color: black">PRODUCT</th>
                    <th style="background-color: yellow; color: black">PRICE</th>
                    <th style="background-color: yellow; color: black">PRODUCT DESCRIPTION</th>
                    <th style="background-color: yellow; color: black">SELLER</th>
                    </tr>
                <%
                    for(Order x: ord) {
                        int pd=x.getId_product();
                        int sd=x.getId_seller();
                        String p_name=x.getproduct_name();
                        String p_pd=x.getproduct_desc();
                        String p_price=x.getproduct_price();
                        String s_name=x.getseller_name();
                %>     
                <tr>
                    <td><%=p_name%></td>
                    <td><%=p_price%></td>
                    <td><%=p_pd%></td>
                    <td><%=s_name%></td>                    
                </tr>
                        </div>                
                <%
                        }
                    }
                %>
                </table>
            </div>
        </div>
        </body>
</html>
