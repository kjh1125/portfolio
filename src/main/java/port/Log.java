package port;

import java.sql.*;
import java.util.ArrayList;
//접속 로그를 남기는 부분
public class Log {


	public Log(String id) throws ClassNotFoundException, SQLException {
		setter(id);
	}

	public void setter(String id) throws ClassNotFoundException, SQLException {
		Date_Time dtt = new Date_Time();
		String dt = dtt.now_datetime();

		Database_Information db = new Database_Information();
		Connection ct = db.cafe24();
		String sql = "insert into adminlog values('0',?,?)";
		PreparedStatement ps = ct.prepareStatement(sql);

		ps.setString(1, id);
		ps.setString(2, dt);

		ps.executeUpdate();
		
		ct.close();
		ps.close();
		

	}

}
