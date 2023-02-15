package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static void initConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loading Success");
		} catch (ClassNotFoundException e) {			
			System.out.println("DB Driver를 찾지 못했습니다");
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		Connection conn = null;		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "1234");
			System.out.println("Connection Success");			
		} catch (SQLException e) {			
			System.out.println("db을 연결하지 못했습니다");
			e.printStackTrace();
		}	
		return conn;
	}
}
