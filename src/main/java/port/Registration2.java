package port;

import java.sql.*;
import java.util.ArrayList;

public class Registration2 {

	
	String msg = null;

	public Registration2(ArrayList<String> ar) throws ClassNotFoundException, SQLException {
		
		setter(ar);
	}

	public void setter(ArrayList<String> ar) throws ClassNotFoundException, SQLException {
		Date_Time dtt = new Date_Time();
		String dt = dtt.now_datetime();
		Database_Information db = new Database_Information();
		//System.out.println(ar);
		String sql = "insert into admin values('0',?,?,?,?,?,?,?,?,?)";
		Connection ct = db.cafe24();
		PreparedStatement ps = ct.prepareStatement(sql);

		ps.setString(1, ar.get(0));
		ps.setString(2, ar.get(1));
		ps.setString(3, ar.get(2));
		ps.setString(4, ar.get(3));
		ps.setString(5, ar.get(4));
		ps.setString(6, ar.get(5));
		ps.setString(7, ar.get(6));
		ps.setString(8, dt);
		ps.setString(9, "N");
		

		int n = 0;

		n = ps.executeUpdate();

		if (n > 0) {
			this.msg = "ok";

		} else {
			this.msg = "no";
		}
	}

	public String insql() {

		return msg;
	}

}
