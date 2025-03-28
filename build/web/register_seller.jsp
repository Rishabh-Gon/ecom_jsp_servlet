<%-- 
    Document   : register_seller
    Created on : 19 Mar, 2025, 7:27:01 PM
    Author     : RG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Seller</title>
    </head>
    <body>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
             padding: 20px 40px; border-radius: 20px; background-color: white; flex-direction: column; 
                 margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: auto; width: 800px">
            <h2>Register Seller</h2>
            <form action="RegisterSeller" method="post">
            <div style="font-size: 15px">Name</div>
            <input type="text" name="seller_name" placeholder="Name" required 
            style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <div style="font-size: 15px">Email</div>
            <input type="text" name="seller_mail" placeholder="xyz@gmail.com" required 
            style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <div style="font-size: 15px">Password</div>
            <input type="password" name="seller_password" placeholder="Password" required 
            style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <div style="font-size: 15px">Confirm Password</div>
            <input type="password" name="seller_re_password" placeholder="Re-type Password" required 
            style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
            <button type="submit" style="width: 100%; padding: 10px; background: #28a745; color: white; border: none; 
                    border-radius: 5px; cursor: pointer;">Submit</button>
            <%
                String getm=String.valueOf(session.getAttribute("getmessage"));
            if(getm.equals("null")==false){
                if(getm.equals("Registered Succesfully. Login to your account")){
            %>
            <p style="font-family: Arial, sans-serif; color: green; font-size: 16px;"> 
                <%= session.getAttribute("getmessage") %> <a href="seller_login.jsp">Login</a>
            </p>
            <%
                }else{
            %>
            <p style="font-family: Arial, sans-serif; color: red; font-size: 16px;"> 
                <%= session.getAttribute("getmessage") %>
            </p>
            <%
                }
            }
            %>
        </form>         
        </div>
    </body>
</html>
