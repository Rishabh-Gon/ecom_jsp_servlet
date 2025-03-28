<%-- 
    Document   : addpermprod
    Created on : 28 Mar, 2025, 7:56:10 PM
    Author     : RG
--%>

<%@page import="pojo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Requires Permission</title>
    </head>
        <%
        session = request.getSession();
        if ((String.valueOf(session.getAttribute("admin_name")).equals("admin_Gon"))==false) {
        response.sendRedirect("index.jsp");
        }        
        else{
            int sid;
            if(session.getAttribute("selrid")!=null){
               sid=Integer.parseInt(String.valueOf(session.getAttribute("selrid")));
            }
            else{
                sid=Integer.parseInt(request.getParameter("sellr_id"));
                session.setAttribute("selrid", sid);
            }
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
                <a href="adminhome.jsp"style="color: black; text-decoration: none;">
                    <b>Back</b>                    
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: #c0c0c0; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="seller_det.jsp" style="color: black; text-decoration: none;">
                <b>Selling Products</b>
                </a>
            </td>
            <td style="justify-content: center;text-align: justify;padding: 5px; background-color: black; 
                border-top-left-radius: 20px; border-top-right-radius: 20px; border: 1px solid black">
                <a href="addpermprod.jsp" style="color: yellow; text-decoration: none;">
                <b>Permission Pending</b>
                </a>
            </td>
            </table>
            <div style="margin-bottom: auto; justify-content: center;text-align: justify;padding: 5px;
                 background-color: black; color: yellow; width: 800px ">
                <%
                    ArrayList<Product> perm_pd=ProductDAO.requiresPerm(sid);                    
                    if(perm_pd.isEmpty()){
                %>
                    No objects present now
                <%
                    }else{
                %>
                <table style="border: 2px solid yellow; font-size: 48 px; border-radius: 5px; border-color: yellow; 
                             background-color: black; text-align: center; color:yellow; justify-content: center;">
                    <tr>
                    <th style="background-color: yellow; color: black">PRODUCT ID</th>
                    <th style="background-color: yellow; color: black">PRODUCT NAME</th>
                    <th style="background-color: yellow; color: black">PRODUCT PRICE</th>
                    <th style="background-color: yellow; color: black">PRODUCT DESCRIPTION</th>
                    <th style="background-color: yellow; color: black">PERMISSION</th>                    
                    </tr>
                <%                    
                    for(Product x: perm_pd) {
                        String p_name=x.getProd_name();
                        String p_id=String.valueOf(x.getId_prod());                        
                        String p_price=String.valueOf(x.getProd_price());
                        String p_pd=x.getProd_pd();                      
                %>     
                            <tr>
                                <td><%=p_id%></td>
                                <td><%=p_name%></td>
                                <td><%=p_price%></td>
                                <td><%=p_pd%></td>
                                <td>
                                    <form action="Addprodperm" method="post" style="font-size: 15px;">   
                                        <div style="align-items: center">                                            
                                            <input type="hidden" name="prod_id" value="<%=p_id%>">
                                            <input type="hidden" name="selr_id" value="<%=sid%>">
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
