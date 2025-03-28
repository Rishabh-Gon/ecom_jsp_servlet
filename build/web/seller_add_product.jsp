<%-- 
    Document   : seller_add_product
    Created on : 24 Mar, 2025, 8:03:24 PM
    Author     : RG
--%>

<%@page import="pojo.Seller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seller Add Product</title>
    </head>
    <%
        session = request.getSession();
        if (session == null) {
        response.sendRedirect("index.jsp");
        }
        Seller c=(Seller)session.getAttribute("seller");
        int seller_id=c.getId_seller();
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
        <div style="display: flex; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 810px">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <td style="justify-content: center; text-align: justify; padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="sellerhome.jsp"style="color: black; text-decoration: none;">
                    <b>Products You sell</b>                    
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_permission_pending.jsp" style="color:black; text-decoration: none;">
                <b>Products Pending permission</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px;">
                <a href="seller_add_product.jsp" style="color: yellow; text-decoration: none;">
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
            <div style="margin-bottom: auto; justify-content: center; padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <form action="RegisterProduct" method="post" 
                      style="font-size: 15px;">   
                    <div style="align-items: center; margin-left: 250px">
                        <br>
                        Product Name<br>
                        <input type="text" name="prod_name" placeholder="Product Name" required 
                        style="width: 200px; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;"><br>
                        Product Price(in Rs.)<br>
                        <input type="text" name="product_price" placeholder="100.00 (enter price of your product)" required 
                        style="width: 200px; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;"><br>
                        Product Description<br>
                        <textarea placeholder="Describe your product&#10;in 300-500 characters" 
                                  style="width: 200px;" name="product_pd"></textarea><br>
                        <button type="submit" style="width: 200px; padding: 10px; background: yellow; color: black;
                        border: none; border-radius: 5px;">Submit</button><br>
                        
                        <%
                            String getm=String.valueOf(request.getAttribute("addProd_sellr_message"));
                            System.out.println("addProd_sellr_message gives "+getm);
                            if(getm.equals("Added"))
                            {                                
                        %>
                            <p> 
                             Added the new product   
                            </p>
                        <%
                                }
                                else if(getm.equals("null")){}
                                else{
                        %>
                            <p style="font-family: Arial, sans-serif; color: red; font-size: 16px;"> 
                                <%= getm %>
                            </p>
                        <%                                
                            }
                        %>
                        
                    </div>
                    </form>
            </div>
        </div>
        </body>
        <%
        }
        %>
</html>
