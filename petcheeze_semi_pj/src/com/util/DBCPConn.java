package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn {
	private static DataSource ds=null;
	
	private DBCPConn() {
		
	}
	
	public static Connection getConnection() {
		Connection conn=null;
		try {
			if(ds==null) {
				
				Context ctx=new InitialContext();
				Context context=(Context)ctx.lookup("java:/comp/env");
				ds=(DataSource)context.lookup("jdbc/myoracle");
			}
			
			conn=ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		return conn;
	}
	
	public static void close(Connection conn) {
		if(conn==null)
			return;
		try {
			if(! conn.isClosed())
				conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
