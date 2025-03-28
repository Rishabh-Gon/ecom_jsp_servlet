<%-- 
    Document   : seller_permission_pending
    Created on : 24 Mar, 2025, 7:13:25 PM
    Author     : RG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page import="pojo.Product"%>
<%@page import="pojo.Seller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Permission Pending</title>
    </head>
    <%
        session = request.getSession();
        if (session == null) {
        response.sendRedirect("index.jsp");
        }
        Seller c=(Seller)session.getAttribute("seller");
        int sellrid=c.getId_seller();
        String sellrname=c.getseller_name();
        String sellrperm=c.getseller_perm();
        if(sellrperm.equals("NO")){
        %>
        <body>  
        <h1>Welcome <%=sellrname%></h1>
        <h2>Your request to do business is being evaluated. Contact with admin.</h2>
        <form action="Logout" method="post" style="font-size: 15px;">   
            <div style="align-items: center; margin-left: 250px">                       
                <button type="submit" style="padding: 10px; background: yellow; color: black;
                        border: none; border-radius: 5px;"><b>Logout</b></button><br>                                           
            </div>
        </form>
        </body>
        <%
        }else{
        %>
        <body style="background-image: url(images/shop.jpg)">
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 810px">
            <h1>Welcome <%=sellrname%></h1>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 22px; width: 810px;
        background-color: white; flex-direction: column; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <td style="justify-content: center; text-align: justify; padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="sellerhome.jsp"style="color: black; text-decoration: none;">
                    <b>Products You sell</b>                    
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px;">
                <a href="seller_permission_pending.jsp" style="color: yellow; text-decoration: none;">
                <b>Products Pending permission</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_add_product.jsp" style="color: black; text-decoration: none;">
                <b>Add product</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="logout_seller.jsp" style="color: black; text-decoration: none;">
                <b>Logout</b>
                </a>
            </td>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <%
                    ArrayList<Product> perm_pd=ProductDAO.requiresPerm(sellrid);
                    if(perm_pd.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; color:yellow; justify-content: center;">
                    <tr>
                    <th style="background-color: yellow; color: black">PRODUCT</th>
                    <th style="background-color: yellow; color: black">PRICE</th>
                    <th style="background-color: yellow; color: black">PRODUCT DESCRIPTION</th>
                    </tr>
                <%
                    for(Product x: perm_pd) {
                        String p_name=x.getProd_name();
                        String p_pd=x.getProd_pd();
                        Double p_price=x.getProd_price();
                %>     
                            <tr>
                                <td><%=p_name%></td>
                                <td><%=p_price%></td>
                                <td><%=p_pd%></td>
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
        <%
        }
        %>
</html>
