package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pojo.Order;
import pojo.Product;

/**
 *
 * @author RG
 */
public class OrderDAO {
    public static void addOrder(int seller_id, int cust_id, int product_id) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="INSERT INTO orders (seller_id, customer_id, product_id) VALUES (?, ?, ?)";
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, seller_id);
            ps.setInt(2, cust_id);
            ps.setInt(3, product_id);
            ps.executeUpdate();
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
    }
    
    public static ArrayList<Order> getOrders(int cid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;        
        String sql="select * from orders where customer_id = ? ORDER BY order_id DESC";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            rs = ps.executeQuery();            
            if (rs!=null) {
                ArrayList<Order> pds=new ArrayList<>();
                while(rs.next()){                
                    pds.add(new Order(rs.getInt("order_id"),rs.getInt("customer_id"),rs.getInt("seller_id"),rs.getInt("product_id")));                    
                }
                return pds;
            }
            else{
                return null;
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }
    
    public static String getSellerName(int sid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select seller_name from seller where idseller = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            rs = ps.executeQuery();            
            if (rs!=null) {
                rs.next();
                return rs.getString("seller_name");
            }
            else{
                return null;
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }
    
    public static String getProductName(int pid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select product_name from products where product_id = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            rs = ps.executeQuery();            
            if (rs!=null) {
                rs.next();
                return rs.getString("product_name");
            }
            else{
                return null;
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }
    
    public static String getProductDesc(int pid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select product_pd from products where product_id = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            rs = ps.executeQuery();            
            if (rs!=null) {
                rs.next();
                return rs.getString("product_pd");
            }
            else{
                return null;
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }
    
    public static String getProductPrice(int pid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select product_price from products where product_id = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            rs = ps.executeQuery();            
            if (rs!=null) {
                rs.next();
                return String.valueOf(rs.getDouble("product_price"));
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }
    
    public static ArrayList<Order> allOrders() {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;        
        String sql="select * from orders ORDER BY order_id DESC";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);            
            rs = ps.executeQuery();            
            if (rs!=null) {
                ArrayList<Order> pds=new ArrayList<>();
                while(rs.next()){                
                    pds.add(new Order(rs.getInt("order_id"),rs.getInt("customer_id"),rs.getInt("seller_id"),rs.getInt("product_id")));                    
                }
                return pds;
            }
            else{
                return null;
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }
    
    public static String getCustName(int cid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select cust_name from cust where id_cust = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            rs = ps.executeQuery();            
            if (rs!=null) {
                rs.next();
                return rs.getString("cust_name");
            }
            else{
                return null;
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }    
    
    public static String getCustMail(int cid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select cust_mail from cust where id_cust = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            rs = ps.executeQuery();            
            if (rs!=null) {
                rs.next();
                return rs.getString("cust_mail");
            }
            else{
                return null;
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }    
    
    public static String getSelrMail(int sid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select seller_mail from seller where idseller = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            rs = ps.executeQuery();            
            if (rs!=null) {
                rs.next();
                return rs.getString("seller_mail");
            }
            else{
                return null;
            }
        }
        catch (SQLException e) {
                System.out.println("SQL exception due to : " + e.getMessage());
                e.printStackTrace();
        } finally {
            if (ps != null){
                try {
                        ps.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the prepared statement.");
                        ex.printStackTrace();
                }
            }
            if (rs != null){
                try {
                        rs.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the result set.");
                        ex.printStackTrace();
                }
            }
            if (conn != null){
                try {
                        conn.close();
                } catch (Exception ex) {
                        System.out.println("Error occured while closing the connection.");
                        ex.printStackTrace();
                }
            }
        }
        return null;
    }        
    
}