<%-- 
    Document   : Admin
    Created on : 3 Mar, 2025, 12:46:31 PM
    Author     : RG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body style="background-image: url(images/shop.jpg)">
        <h1 style="text-align: center; margin-top: 0; margin-bottom: 0; color: yellow; background: black">
            Welcome to Our E-commerce Store
        </h1>
        <table style="margin-left: auto; margin-top: 0; margin-bottom: 0">
            <td style="align-content: center; background-color: black; border: 1px solid black; border-radius: 20px">
                <a href="index.html" style="color: white; text-decoration: none;">
                    <b>Home</b>                    
                </a>
            </td>
            <td style="align-content: center; background-color: black; border: 1px solid black; border-radius: 20px">
                <a href="aboutus.html" style="color: white; text-decoration: none;">
                <b>About Us</b>
                </a>
            </td>
            <td style="align-content: center; background-color: black; border: 1px solid black; border-radius: 20px">
                <a href="contactus.html" style="color: white; text-decoration: none;">
                <b>Contact Us</b>
                </a>
            </td>
            <td style="align-content: center; background-color: black; border: 1px solid black; border-radius: 20px">
                <a href="Admin.jsp" style="color: yellow; text-decoration: none;">
                <b>Admin</b>
                </a>
            </td>
        </table>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
             padding: 20px 40px; border-radius: 20px; background-color: white; flex-direction: column; 
                 margin-left: auto; margin-right: auto; margin-top: 71px; margin-bottom: auto; width: 800px">
            <h2>Admin Login</h2>
            <form action="LoginAdmin" method="post">
            <input type="text" name="admin_name" placeholder="Username" required 
                   style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <input type="password" name="admin_password" placeholder="Password" required 
                   style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <button type="submit" style="width: 100%; padding: 10px; background: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer;">Login</button>
            <%
            if(session.getAttribute("error")!=null){
            %>
            <p style="font-family: Arial, sans-serif; color: red; font-size: 16px;"> 
                Wrong username or password
            </p>
            <%
            }
            %>
        </form>         
        </div>
    </body>        
</html>
