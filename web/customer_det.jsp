<%-- 
    Document   : customer_det
    Created on : 28 Mar, 2025, 6:18:27 PM
    Author     : RG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Details</title>
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
            <td style="justify-content: center; text-align: justify; padding: 5px; background-color: cyan; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="customerlist.jsp"style="color: black; text-decoration: none;">
                    <b>Back</b>                    
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="customer_det.jsp" style="color: yellow; text-decoration: none;">
                <b>Customer Orders</b>
                </a>
            </td>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <%
                    int custid=Integer.parseInt(request.getParameter("cust_id"));
                    ArrayList<Order> perm_pd=OrderDAO.getOrders(custid);                    
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
                    <th style="background-color: yellow; color: black">PRODUCT DETAILS</th>
                    <th style="background-color: yellow; color: black">PRODUCT PRICE</th>
                    <th style="background-color: yellow; color: black">PRODUCT DESCRIPTION</th>
                    <th style="background-color: yellow; color: black">SELLER DETAILS</th>                    
                    </tr>
                <%
                    for(Order x: perm_pd) {
                        String p_name=x.getproduct_name();
                        String p_id=String.valueOf(x.getId_product());
                        String o_id=String.valueOf(x.getId_order());
                        String p_price=x.getproduct_price();
                        String p_pd=x.getproduct_desc();
                        String s_name=x.getseller_name();
                        String s_id=String.valueOf(x.getId_seller());                        
                %>     
                            <tr>
                                <td><%=o_id%></td>
                                <td>ID-<%=p_id%><br><%=p_name%>
                                </td>
                                <td><%=p_price%></td>
                                <td><%=p_pd%></td>
                                <td>ID-<%=s_id%><br><%=s_name%>
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