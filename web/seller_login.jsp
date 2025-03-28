<%-- 
    Document   : customer_login
    Created on : 19 Mar, 2025, 7:15:35 PM
    Author     : RG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seller Login</title>
    </head>
    <body style="background-image: url(images/shop.jpg)">
        <h1 style="text-align: center; margin-top: 0; margin-bottom: 0; color: yellow; background: black">
            Welcome to Our E-commerce Store
        </h1>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
             padding: 20px 40px; border-radius: 20px; background-color: white; flex-direction: column; 
                 margin-left: auto; margin-right: auto; margin-top: 71px; margin-bottom: auto; width: 800px">
            <h2>Seller Login</h2>
            <form action="LoginSeller" method="post">
            <div style="font-size: 15px">Email</div>
            <input type="text" name="seller_mail" placeholder="E-mail" required 
                   style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <div style="font-size: 15px">Password</div>
            <input type="password" name="seller_password" placeholder="Password" required 
                   style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <button type="submit" style="width: 100%; padding: 10px; background: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer;">Login</button>
            <%
            if(session.getAttribute("error")!=null){
            %>
            <p style="font-family: Arial, sans-serif; color: red; font-size: 16px;"> 
                Wrong email or password
            </p>
            <%
            }
            %>
        </form>
        <p style="font-size: 15px;">
            If you are not already registered. <a href="register_seller.jsp">Register Here</a>
        </p>
        </div>
    </body>
</html>
