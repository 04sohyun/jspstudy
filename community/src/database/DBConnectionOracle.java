package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnectionOracle {
	public static Connection getConnection() throws SQLException,ClassNotFoundException {
		Connection conn=null;
		Context init;
		try {
			init=new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/communityOracle");
			conn=ds.getConnection();
		}catch(Exception e) {
			System.out.println("에러:"+e.getMessage());
		}
		return conn;
	}
}
