<%-- 
    Document   : orderslist
    Created on : 28 Mar, 2025, 3:35:05 PM
    Author     : RG
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="pojo.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
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
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="passivesellers.jsp" style="color: black; text-decoration: none;">
                <b>Sellers Pending Permission</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="customerlist.jsp" style="color: black; text-decoration: none;">
                <b>Customers</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="orderslist.jsp" style="color: yellow; text-decoration: none;">
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
                    ArrayList<Order> perm_pd=OrderDAO.allOrders();
                    if(perm_pd.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; text-align: center; color:yellow; justify-content: center;">
                    <tr>
                    <th style="background-color: yellow; color: black">ORDER ID</th>
                    <th style="background-color: yellow; color: black">CUSTOMER DETAILS</th>
                    <th style="background-color: yellow; color: black">SELLER DETAILS</th>
                    <th style="background-color: yellow; color: black">PRODUCT DETAILS</th>                    
                    <th style="background-color: yellow; color: black">PRODUCT DESCRIPTION</th>                    
                    </tr>
                <%
                    for(Order x: perm_pd) {
                        String o_id=String.valueOf(x.getId_order());
                        String c_name=x.getcust_name();
                        String c_id=String.valueOf(x.getId_customer());
                        String c_mail=x.getCust_mail();
                        String s_name=x.getseller_name();
                        String s_id=String.valueOf(x.getId_seller());
                        String s_mail=x.getSelr_mail();
                        String p_name=x.getproduct_name();
                        String p_id=String.valueOf(x.getId_product());
                        String p_desc=x.getproduct_desc();
                %>     
                            <tr>
                                <td><%=o_id%></td>
                                <td>ID-<%=c_id%><br><%=c_name%><br><%=c_mail%>
                                </td>
                                <td>ID-<%=s_id%><br><%=s_name%><br><%=s_mail%>
                                </td>
                                <td>ID-<%=p_id%><br><%=p_name%>
                                </td>
                                <td><%=p_desc%>
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
