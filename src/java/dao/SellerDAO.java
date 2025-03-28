package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pojo.Seller;

public class SellerDAO {
    public static String ValidSeller(String name, String email, String password, String confpassword) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        if(password.equals(confpassword)!=true){
            return "Passwords don't match";
        }
        String sql = "select * from seller where seller_mail = ?";
        String sql1="INSERT INTO seller (seller_name, seller_mail, seller_password, seller_perm) VALUES (?, ?, ?, ?)";
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                    return "Email already exists. Try logging in.";
            }
            System.out.println("Seller does not exist. Ready to register.");
            ps=conn.prepareStatement(sql1);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, "NO");
            ps.executeUpdate();
            return "Registered Succesfully. Login to your account";
        } catch (SQLException e) {
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
    
    public static Seller isSeller(String email, String password) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select * from seller where seller_mail = ? and seller_password = ?";
        System.out.println("Here we made sql statement");
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Seller(rs.getInt("idseller"), rs.getString("seller_name"), rs.getString("seller_mail"), rs.getString("seller_password"), rs.getString("seller_perm"));                
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
    
    public static ArrayList<Seller> allPermSeller() {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select * from seller where seller_perm = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "YES");
            rs = ps.executeQuery();            
            if (rs!=null) {
                ArrayList<Seller> pds=new ArrayList<>();
                while(rs.next()){                
                    pds.add(new Seller(rs.getInt("idseller"),rs.getString("seller_name"),rs.getString("seller_mail"),rs.getString("seller_password"),rs.getString("seller_perm")));                    
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
    
    public static ArrayList<Seller> allnonPermSeller() {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select * from seller where seller_perm = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "NO");
            rs = ps.executeQuery();            
            if (rs!=null) {
                ArrayList<Seller> pds=new ArrayList<>();
                while(rs.next()){                
                    pds.add(new Seller(rs.getInt("idseller"),rs.getString("seller_name"),rs.getString("seller_mail"),rs.getString("seller_password"),rs.getString("seller_perm")));                    
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
    
    public static void givePermSeller(int id) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="UPDATE seller SET seller_perm = ? WHERE idseller = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "YES");
            ps.setInt(2, id);
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
    
        public static void remPermSeller(int id) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="UPDATE seller SET seller_perm = ? WHERE idseller = ?";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "NO");
            ps.setInt(2, id);
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
