package db;


import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB2 {
	public static Connection connect() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
	        String user = "mini";
	        String passwd = "mini";
			conn = DriverManager.getConnection(jdbcUrl, user, passwd);	
		} catch (Exception e) {
			System.out.println("DB접속오류 발생!!");
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
