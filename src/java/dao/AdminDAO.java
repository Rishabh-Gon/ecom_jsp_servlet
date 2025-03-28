package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
    public static boolean ValidAdmin(String username, String password) {
        Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        String sql = "select * from admin where username = ? and password = ?";
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                    return true;
            }
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
        return false;
    }
}
