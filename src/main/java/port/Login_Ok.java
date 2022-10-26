package port;

import java.sql.*;


public class Login_Ok {

	
	String msg = "";

	public Login_Ok(String id,String pw) throws ClassNotFoundException, SQLException {
		setter(id,pw);
	}

	public void setter(String id,String pw) throws ClassNotFoundException, SQLException {

		Database_Information db = new Database_Information();
		Connection ct = db.cafe24();
		String sql = "select * from admin";
		PreparedStatement ps = ct.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		
		while(rs.next()) {
			String a = rs.getString("id");
			String b = rs.getString("pw");
			String c = rs.getString("name");
			String d = rs.getString("approve");
			if(a.equals(id)&&b.equals(pw)&&d.equals("Y")) {
				this.msg=c;
			}
			else if(a.equals(id)&&b.equals(pw)&&d.equals("N")){
				this.msg="N";
				
			}
		}
		
		
	}

	public String insql() {

		return msg;
	}

}
