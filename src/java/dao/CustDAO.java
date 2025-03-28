package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pojo.Customer;

public class CustDAO {
    public static String ValidCust(String name, String email, String password, String confpassword) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        if(password.equals(confpassword)!=true){
            return "Passwords don't match";
        }
        String sql = "select * from cust where cust_mail = ?";
        String sql1="INSERT INTO cust (cust_name, cust_mail, cust_pswd) VALUES (?, ?, ?)";
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                    return "Email already exists. Try logging in.";
            }
            ps=conn.prepareStatement(sql1);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
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
    
    public static Customer isCustomer(String email, String password) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select * from cust where cust_mail = ? and cust_pswd = ?";
        System.out.println("Here we made sql statement");
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt("id_cust"), rs.getString("cust_name"), rs.getString("cust_mail"), rs.getString("cust_pswd"));                
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

    public static ArrayList<Customer> allCust() {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql="select * from cust";        
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();            
            if (rs!=null) {
                ArrayList<Customer> pds=new ArrayList<>();
                while(rs.next()){                
                    pds.add(new Customer(rs.getInt("id_cust"),rs.getString("cust_name"),rs.getString("cust_mail"),rs.getString("cust_pswd")));                    
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
}
