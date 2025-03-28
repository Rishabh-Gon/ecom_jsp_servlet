<%-- 
    Document   : customerhome
    Created on : 21 Mar, 2025, 4:33:24 PM
    Author     : RG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page import="pojo.Product"%>
<%@page import="pojo.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Home</title>
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
            <td style="justify-content: center; text-align: justify; padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px;">
                <a href="customerhome.jsp"style="color: yellow; text-decoration: none;">
                    <b>Products</b>                    
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="orderhist.jsp" style="color: black; text-decoration: none;">
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
                    ArrayList<Product> perm_pd=ProductDAO.custProds();
                    if(perm_pd.isEmpty()){
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
                    <th style="background-color: yellow; color: black">BUY</th>
                    </tr>
                <%
                    for(Product x: perm_pd) {
                        int pd=x.getId_prod();
                        int sd=x.getProdseller_id();
                        String p_name=x.getProd_name();
                        String p_pd=x.getProd_pd();
                        Double p_price=x.getProd_price();
                        String s_name=ProductDAO.getSname(x);
                %>     
                <tr>
                    <td><%=p_name%></td>
                    <td><%=p_price%></td>
                    <td><%=p_pd%></td>
                    <td><%=s_name%></td>
                    <td>
                        <form action="Buynow" method="post" style="font-size: 15px;">   
                            <div style="align-items: center">
                                <input type="hidden" name="product_id" value="<%=pd%>">
                                <input type="hidden" name="sellr_id" value="<%=sd%>">
                                <button type="submit"                                         
                                        style="width: 50px; padding: 10px; background: yellow; color: black;
                                        border: none; border-radius: 5px;">
                                    <b>Buy Now</b>
                                </button>                                           
                            </div>
                        </form>
                    </td>
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