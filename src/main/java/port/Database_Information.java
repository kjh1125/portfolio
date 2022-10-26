package port;
import java.sql.*;

public class Database_Information {

	private static String dbdriver = "com.mysql.jdbc.Driver";
	static String dburl = null;
	static String dbuser = null;
	static String dbpass = null;

	public static Connection cafe24() throws ClassNotFoundException, SQLException {

		dburl = "jdbc:mysql://umj7-009.cafe24.com/kjhwinter1";
		//WAS로 테스트 시 
		
		//dburl = "jdbc:mysql://localhost/kjhwinter1"; 
		//war 파일로 실행 시 
		dbuser = "kjhwinter1";
		dbpass = "wjdgus1125";

		Class.forName(dbdriver);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
		return con;

	}
}