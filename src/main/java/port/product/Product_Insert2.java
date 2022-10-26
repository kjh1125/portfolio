package port.product;

import java.sql.*;
import java.util.ArrayList;

import port.Database_Information;

public class Product_Insert2 {

	
	String msg = null;

	public Product_Insert2(ArrayList<String> ar) throws ClassNotFoundException, SQLException {
		setter(ar);
	}

	public void setter(ArrayList<String> ar) throws ClassNotFoundException, SQLException {

		Database_Information db = new Database_Information();
		Connection ct = db.cafe24();
		String sql = "insert into product_list values('0',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = ct.prepareStatement(sql);
    
		int w = 0;

		while(w<ar.size()) {
		ps.setString(w+1, ar.get(w));
		w++;
		}
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
