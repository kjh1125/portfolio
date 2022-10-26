package port.config;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Admin_Configuration_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pwr = null;
    
    public Admin_Configuration_Insert() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		pwr = response.getWriter();
		
		
		String hometitle = request.getParameter("hometitle");
		String homeemail = request.getParameter("homeemail");
		String homepointuse = request.getParameter("homepointuse");
		String homepoint = request.getParameter("homepoint");
		String homelevel = request.getParameter("homelevel");
		ArrayList<String> home = new ArrayList<String>();
		home.add(hometitle);
		home.add(homeemail);
		home.add(homepointuse);
		home.add(homepoint);
		home.add(homelevel);
		
		String defaultcomname = request.getParameter("defaultcomname");
		String defaultcomnum = request.getParameter("defaultcomnum");
		String defaultname = request.getParameter("defaultname");
		String defaulttel = request.getParameter("defaulttel");
		String defaultsalesnum = request.getParameter("defaultsalesnum");
		String defaultaddcomnum = request.getParameter("defaultaddcomnum");
		String defaultpostnum = request.getParameter("defaultpostnum");
		String defaultcomaddress = request.getParameter("defaultcomaddress");
		String defaultinfoname = request.getParameter("defaultinfoname");
		String defaultinfoemail = request.getParameter("defaultinfoemail");
		ArrayList<String> defaultcom = new ArrayList<String>();
		defaultcom.add(defaultcomname);
		defaultcom.add(defaultcomnum);
		defaultcom.add(defaultname);
		defaultcom.add(defaulttel);
		defaultcom.add(defaultsalesnum);
		defaultcom.add(defaultaddcomnum);
		defaultcom.add(defaultpostnum);
		defaultcom.add(defaultcomaddress);
		defaultcom.add(defaultinfoname);
		defaultcom.add(defaultinfoemail);
		
		String paynobank = request.getParameter("paynobank");
		String paybanknum = request.getParameter("paybanknum");
		String paycarduse = request.getParameter("paycarduse");
		String payphoneuse  = request.getParameter("payphoneuse");
		String paybookuse  = request.getParameter("paybookuse");
		String paypaymin  = request.getParameter("paypaymin");
		String paypaymax  = request.getParameter("paypaymax");
		String paycashuse  = request.getParameter("paycashuse");
		String paydelenm  = request.getParameter("paydelenm");
		String paydeleprice  = request.getParameter("paydeleprice");
		String paydeledate  = request.getParameter("paydeledate");
		ArrayList<String> pay = new ArrayList<String>();
		pay.add(paynobank);
		pay.add(paybanknum);
		pay.add(paycarduse);
		pay.add(payphoneuse);
		pay.add(paybookuse);
		pay.add(paypaymin);
		pay.add(paypaymax);
		pay.add(paycashuse);
		pay.add(paydelenm);
		pay.add(paydeleprice);
		pay.add(paydeledate);
		
		Admin_Configuration_Insert2 ad = new Admin_Configuration_Insert2();
		ad.getter(home, defaultcom, pay);
		String a = ad.insql().intern();
		
		if(a=="ok") {
			pwr.print("<script>alert('저장완료');location.href='./admin/config/admin_config.jsp';</script>");
		}
		else {
			pwr.print("<script>alert('에러');history.go(-1);</script>");
		}
	}

}
