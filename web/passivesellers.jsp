<%-- 
    Document   : passivesellers
    Created on : 28 Mar, 2025, 6:25:18 AM
    Author     : RG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.SellerDAO"%>
<%@page import="pojo.Seller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Passive Sellers</title>
    </head>
        <%
        session = request.getSession();
        if ((String.valueOf(session.getAttribute("admin_name")).equals("admin_Gon"))==false) {
        response.sendRedirect("index.jsp");
        }
        else{
        %>
        <body style="background-image: url(images/shop.jpg)">         
        <div style="display: flex; justify-content: center; align-items: center; font-size: 32px; 
            border-top-left-radius: 20px; background-color: white; flex-direction: column; 
            border-top-right-radius: 20px; margin-left: auto; margin-right: auto; margin-bottom: auto; width: 810px">
            <h1>Welcome Admin</h1>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; font-size: 22px; 
             background-color: white; flex-direction: column; 
             margin-left: auto; margin-right: auto; margin-bottom: auto; width: 810px">
            <table style="margin-right: auto; margin-top: auto; border-spacing: 0px">
            <td style="justify-content: center; text-align: justify; padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="adminhome.jsp"style="color: black; text-decoration: none;">
                    <b>Active Sellers</b>                    
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="passivesellers.jsp" style="color: yellow; text-decoration: none;">
                <b>Sellers Pending Permission</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="customerlist.jsp" style="color: black; text-decoration: none;">
                <b>Customers</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="orderslist.jsp" style="color: black; text-decoration: none;">
                <b>Orders</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="logoutadmin.jsp" style="color: black; text-decoration: none;">
                <b>Logout</b>
                </a>
            </td>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <%
                    ArrayList<Seller> perm_pd=SellerDAO.allnonPermSeller();
                    if(perm_pd.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; text-align: center; color:yellow; justify-content: center;">
                    <tr>
                    <th style="background-color: yellow; color: black">SELLER ID</th>
                    <th style="background-color: yellow; color: black">SELLER NAME</th>
                    <th style="background-color: yellow; color: black">SELLER MAIL</th>                    
                    <th style="background-color: yellow; color: black">PERMISSION</th>
                    </tr>
                <%
                    for(Seller x: perm_pd) {
                        String p_name=x.getseller_name();
                        String p_id=String.valueOf(x.getId_seller());
                        String p_mail=x.getseller_mail();
                %>     
                            <tr>
                                <td><%=p_id%></td>
                                <td><%=p_name%></td>
                                <td><%=p_mail%></td>                                
                                <td>
                                    <form action="Givsellerperm" method="post" style="font-size: 15px;">   
                                        <div style="align-items: center">                                            
                                            <input type="hidden" name="sellr_id" value="<%=p_id%>">
                                            <button type="submit"                                         
                                                    style="padding: 10px; background: yellow; color: black;
                                                    border: none; border-radius: 5px;">
                                                <b>Give permission</b>
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
        <%
        }
        %>
</html>
