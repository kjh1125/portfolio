<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="port.Database_Information"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");

Database_Information db = new Database_Information();
String sql = "select * from homeen as h left join defaulten as d on h.idx=d.idx left join payen as p on p.idx=h.idx order by h.idx desc" ;
PreparedStatement ps = null;
ResultSet rs = null;
ArrayList<Map<String,Object>> al = null;
Connection con = db.cafe24();
try{
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	al = new ArrayList();
	
	while(rs.next()){
		Map<String,Object> mp = new HashMap();
		mp.put("hometitle", rs.getString("h.title"));
		mp.put("homeemail", rs.getString("h.email"));
		mp.put("homepointuse", rs.getString("h.pointuse").intern());
		mp.put("homepoint", rs.getString("h.point"));
		mp.put("homelevel", rs.getString("h.level"));
		mp.put("defaultcomname", rs.getString("d.comname"));
		mp.put("defaultcomnum", rs.getString("d.comnum"));
		mp.put("defaultname", rs.getString("d.name"));
		mp.put("defaulttel", rs.getString("d.tel"));
		mp.put("defaultsalesnum", rs.getString("d.salesnum"));
		mp.put("defaultaddcomnum", rs.getString("d.addcomnum"));
		mp.put("defaultpostnum", rs.getString("d.postnum"));
		mp.put("defaultcomaddress", rs.getString("d.comaddress"));
		mp.put("defaultinfoname", rs.getString("d.infoname"));
		mp.put("defaultinfoemail", rs.getString("d.infoemail"));
		mp.put("paynobank", rs.getString("p.nobank"));
		mp.put("paybanknum", rs.getString("p.banknum"));
		mp.put("paycarduse", rs.getString("p.carduse").intern());
		mp.put("payphoneuse", rs.getString("p.phoneuse").intern());
		mp.put("paybookuse", rs.getString("p.bookuse").intern());
		mp.put("paypaymin", rs.getString("p.paymin"));
		mp.put("paypaymax", rs.getString("p.paymax"));
		mp.put("paycashuse", rs.getString("p.cashuse").intern());
		mp.put("paydelenm", rs.getString("p.delenm"));
		mp.put("paydeleprice", rs.getString("p.deleprice").intern());
		mp.put("paydeledate", rs.getString("p.deledate").intern());
		al.add(mp);
	}

	
}
catch(Exception e){
	
}
%>