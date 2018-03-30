package common;

import java.io.FileReader;
import java.sql.*;
import java.util.Properties;

import javax.naming.*;
import javax.sql.*;

public class JDBCTemplate {
	
	/*public static Connection getConnection() {
		
		Connection con = null;		
		
		try {			
			
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "student";
			String pwd = "student";
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			con.setAutoCommit(false);
			
		} catch (Exception e) {			
			e.printStackTrace();
		}		
		return con;		
	}*/
	
	//DB Connection Pooling 기법을 이용
//	public static Connection getConnection() {
//		
//		Connection con = null;
//		
//		try {
//			Context initContext = new InitialContext();
//			DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/oraDB");
//			con = ds.getConnection();
//			con.setAutoCommit(false);
//		} catch (Exception e) {
//			e.printStackTrace();
//			/*System.out.println("JDBCTemplate.getConnection() : "
//								+e.getMessage());*/
//		}
//		
//		return con;
//	}
	public static Connection getConnection() {
		Connection con=null;
		Properties prop=new Properties();
		String fileName=JDBCTemplate.class.getResource("/dbresources/drive.propertices").getPath();
		System.out.println("fileName="+fileName);
		System.out.println("url="+JDBCTemplate.class.getResource("/dbresources/drive.propertices"));
		try {
			prop.load(new FileReader(fileName));
			Class.forName(prop.getProperty("driver"));
			con=DriverManager.getConnection(
					prop.getProperty("url"),
					prop.getProperty("user"),
					prop.getProperty("passwd")				
					);
					
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return con;
	}
	
	public static void commit (Connection con) {
		
		try {
			if(con != null && !con.isClosed()) {				
				con.commit();				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public static void rollback (Connection con) {
		
		try {
			if(con != null && !con.isClosed()) {				
				con.rollback();				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public static void close (Connection con) {
		
		try {
			if(con != null && !con.isClosed()) {				
				con.close();				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public static void close (Statement stmt) {
				
		try {
			if(stmt != null && !stmt.isClosed()) {				
				stmt.close();				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public static void close (ResultSet rset) {
		
		try {
			if(rset != null && !rset.isClosed()) {				
				rset.close();				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}
