package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pojo.Product;

/**
 *
 * @author RG
 */
public class ProductDAO {
    public static String addProduct(int seller_id, String name, String price, String desc) {
        System.out.println("We are trying to add product for permission");
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="INSERT INTO products (seller_id, product_name, product_price, product_pd, product_perm) VALUES (?, ?, ?, ?, ?)";
        try {
            
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, seller_id);
            ps.setString(2, name);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setString(4, desc);
            ps.setString(5, "NO");
            ps.executeUpdate();            
            return "Added";
        }
        catch(NumberFormatException e){
            return "Wrong Product Details. Recheck and enter details correctly";
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
    
    public static ArrayList<Product> requiresPerm(int sid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        int elmnt=0;
        String sql="select * from products where seller_id = ? and product_perm = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            ps.setString(2, "NO");
            rs = ps.executeQuery();            
            if (rs!=null) {
                ArrayList<Product> pds=new ArrayList<>();
                while(rs.next()){                
                    pds.add(new Product(rs.getInt("product_id"),rs.getInt("seller_id"),rs.getString("product_name"),rs.getDouble("product_price"),rs.getString("product_pd"),rs.getString("product_perm")));                    
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
    
    public static ArrayList<Product> userPermProds(int sid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        int elmnt=0;
        String sql="select * from products where seller_id = ? and product_perm = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            ps.setString(2, "YES");
            rs = ps.executeQuery();            
            if (rs!=null) {
                ArrayList<Product> pds=new ArrayList<>();
                while(rs.next()){                
                    pds.add(new Product(rs.getInt("product_id"),rs.getInt("seller_id"),rs.getString("product_name"),rs.getDouble("product_price"),rs.getString("product_pd"),rs.getString("product_perm")));                    
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
    
    public static ArrayList<Product> custProds() {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;        
        String sql="select p.* from products p join seller s on p.seller_id=s.idseller where p.product_perm = ? and s.seller_perm = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "YES");
            ps.setString(2, "YES");
            rs = ps.executeQuery();            
            if (rs!=null) {
                ArrayList<Product> pds=new ArrayList<>();
                while(rs.next()){                
                    pds.add(new Product(rs.getInt("product_id"),rs.getInt("seller_id"),rs.getString("product_name"),rs.getDouble("product_price"),rs.getString("product_pd"),rs.getString("product_perm")));                    
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
    
    public static String getSname(Product p) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        int sid=p.getProdseller_id();
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
    
    public static void remPermProd(int sid,int pid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="UPDATE products SET product_perm = ? WHERE seller_id = ? AND product_id = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "NO");
            ps.setInt(2, sid);
            ps.setInt(3, pid);
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
    
    public static void givePermProd(int sid,int pid) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="UPDATE products SET product_perm = ? WHERE seller_id = ? AND product_id = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "YES");
            ps.setInt(2, sid);
            ps.setInt(3, pid);
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
}