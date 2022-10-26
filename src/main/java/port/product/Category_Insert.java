package port.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Category_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pwr = null;
   
    public Category_Insert() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pwr = response.getWriter();
		
		String code = request.getParameter("code");
		String bcode = request.getParameter("bcode");
		String bcodenm = request.getParameter("bcodenm");
		String scode = request.getParameter("scode");
		String scodenm = request.getParameter("scodenm");
		String cuse = request.getParameter("cuse");
	
		
		ArrayList<String> ar = new ArrayList<String>();
		ar.add(code);
		ar.add(bcode);
		ar.add(bcodenm);
		ar.add(scode);
		ar.add(scodenm);
		ar.add(cuse);
	
		try {
			Category_Insert2 re = new Category_Insert2(ar);
			String chk = re.insql().intern();
			System.out.println(chk);
			if(chk=="ok") {
				pwr.print("<script>alert('등록완료');location.href='/portfolio/admin/product/admin_category.jsp';</script>");
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
