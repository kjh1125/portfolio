package port.notice;

import java.sql.*;
import java.util.ArrayList;

import port.Date_Time;
import port.Database_Information;

public class Admin_Notice_Registration2 {

	String msg = null;

	public Admin_Notice_Registration2(ArrayList<String> ar) throws ClassNotFoundException, SQLException {
		setter(ar);
	}

	public void setter(ArrayList<String> ar) throws ClassNotFoundException, SQLException {
		
		Database_Information db = new Database_Information();
		Date_Time dt = new Date_Time();
		String nowdt = dt.now_date();
		
		Connection ct = db.cafe24();
		String sql = "insert into notice values('0',?,?,?,?,'0',?)";
		PreparedStatement ps = ct.prepareStatement(sql);

		int w =0;
		while(w<ar.size()) {
		ps.setString(w+1, ar.get(w));
		w++;
		}
		ps.setString(w+1, nowdt);

		int n = 0;

		n = ps.executeUpdate();

		if (n > 0) {
			this.msg = "ok";

		} else {
			this.msg = "no";
		}
		ct.close();
	}

	public String insql() {

		return msg;
	}

}
