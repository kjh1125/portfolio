package port.manage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.mail.Multipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class Coupon_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pwr = null;
   
    public Coupon_Insert() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		pwr = response.getWriter();
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFile");
		
		MultipartRequest mr = new MultipartRequest(request, uploadPath, 1024*1024*2,"UTF-8", new DefaultFileRenamePolicy());
		
		String filename = "";
		String name = mr.getParameter("name");
		String type = mr.getParameter("type");
		String startdate = mr.getParameter("startdate")+" 00:00:00";
		String enddate = mr.getParameter("enddate")+" 00:00:00";
		String cptype = mr.getParameter("cptype");
		String discount = mr.getParameter("discount");
		String pricemin  = mr.getParameter("pricemin");
		filename = mr.getFilesystemName("file");
		
		ArrayList<String> ar = new ArrayList();
		ar.add(name);
		ar.add(type);
		ar.add(startdate);
		ar.add(enddate);
		ar.add(cptype);
		ar.add(discount);
		ar.add(pricemin);
		ar.add(filename);
		
		try {
			Coupon_Insert2 re = new Coupon_Insert2(ar);
			String chk = re.insql().intern();
			
			if(chk=="ok") {
				pwr.print("<script>alert('등록완료');location.href='/portfolio/admin/manage/admin_shopping.jsp';</script>");
			}
			else {
				pwr.print("<script>alert('DB에러');history.go(-1);</script>");
			}
			
			
		} catch (Exception e) {
			
		}
		finally {
			pwr.close();
		}
		
		
		
	}

}
