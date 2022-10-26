package port.config;

import java.sql.*;
import java.util.ArrayList;

import port.Database_Information;

public class Admin_Configuration_Insert2 {

	String msg = null;
	ArrayList<String> home = null;
	ArrayList<String> defaultcom = null;
	ArrayList<String> pay = null;

	public void getter(ArrayList<String> home, ArrayList<String> defaultcom, ArrayList<String> pay) {
		this.home = home;
		this.defaultcom = defaultcom;
		this.pay = pay;
		try {
			setter();

		} catch (Exception e) {

		}
	}

	public void setter() throws ClassNotFoundException, SQLException {

		Database_Information db = new Database_Information();
		Connection ct = db.cafe24();
		String sql = "insert into homeen values('0',?,?,?,?,?)";
		PreparedStatement ps = ct.prepareStatement(sql);

		ps.setString(1, this.home.get(0));
		ps.setString(2, this.home.get(1));
		ps.setString(3, this.home.get(2));
		ps.setString(4, this.home.get(3));
		ps.setString(5, this.home.get(4));

		int n = 0;

		n = ps.executeUpdate();

		if (n > 0) {
			n = 0;
			sql = "insert into defaulten values('0',?,?,?,?,?,?,?,?,?,?)";
			ps = ct.prepareStatement(sql);
			ps.setString(1, this.defaultcom.get(0));
			ps.setString(2, this.defaultcom.get(1));
			ps.setString(3, this.defaultcom.get(2));
			ps.setString(4, this.defaultcom.get(3));
			ps.setString(5, this.defaultcom.get(4));
			ps.setString(6, this.defaultcom.get(5));
			ps.setString(7, this.defaultcom.get(6));
			ps.setString(8, this.defaultcom.get(7));
			ps.setString(9, this.defaultcom.get(8));
			ps.setString(10, this.defaultcom.get(9));

			n = ps.executeUpdate();

			if (n > 0) {

				n = 0;
				sql = "insert into payen values('0',?,?,?,?,?,?,?,?,?,?,?)";
				ps = ct.prepareStatement(sql);
				ps.setString(1, this.pay.get(0));
				ps.setString(2, this.pay.get(1));
				ps.setString(3, this.pay.get(2));
				ps.setString(4, this.pay.get(3));
				ps.setString(5, this.pay.get(4));
				ps.setString(6, this.pay.get(5));
				ps.setString(7, this.pay.get(6));
				ps.setString(8, this.pay.get(7));
				ps.setString(9, this.pay.get(8));
				ps.setString(10, this.pay.get(9));
				ps.setString(11, this.pay.get(10));

				n = ps.executeUpdate();
				
				if (n > 0) {
					this.msg = "ok";

				} else {
					this.msg = "no3";
				}
			} else {
				this.msg = "no2";
			}
		} else {
			this.msg = "no1";
		}

	}

	public String insql() {

		return msg;
	}

}
