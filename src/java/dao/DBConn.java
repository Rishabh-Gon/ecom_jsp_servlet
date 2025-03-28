package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn{
	public static Connection getConnection() { 		
            Connection conn=null;
		try {	
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    System.out.println("Driver class loaded");
                    System.out.println("Conn is now null");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom?useSSL=false&allowPublicKeyRetrieval=true",
                            "root", "Rishabh@02");
                    System.out.println("JDBC Connection established successfully.");
                } catch (Exception ex) {
                    System.out.println("Connection failed...");
                    ex.printStackTrace();
                }
                return conn;
	}
}
