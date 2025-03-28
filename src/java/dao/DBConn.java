package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn{
	public static Connection getConnection() {
		Connection conn=null;
		String db_user="root";
		String db_password="Rishabh@02";
		String db_name="ecom";
		String hostname="jdbc:mysql://localhost:3306/";
		try {	
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    System.out.println("Driver class loaded");
                    System.out.println("Conn is now null");
                    conn = DriverManager.getConnection(hostname+db_name+"?useSSL=false&allowPublicKeyRetrieval=true",
                            db_user, db_password);
                    System.out.println("JDBC Connection established successfully.");
                } catch (Exception ex) {
                    System.out.println("Connection failed...");
                    ex.printStackTrace();
                }
                return conn;
	}
}
