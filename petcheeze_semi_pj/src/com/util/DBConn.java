package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	private static Connection conn=null;
	
	private DBConn() {
		
	}
	
	public static Connection getConnection() {
		String url="jdbc:oracle:thin:@192.168.40.37:1521:xe";
		String user="pet";
		String pwd="java0321";
		
		if(conn==null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn=DriverManager.getConnection(url, user, pwd);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return conn;
	}
	
	public static void close() {
		if(conn!=null) {
			try {
				if(!conn.isClosed())
					conn.close();
			} catch (SQLException e) {
			}
		}
		conn=null;
	}

}
