package port;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Information_Revise extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pwr = null;
   
    public Information_Revise() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pwr = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw1");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel1")+request.getParameter("tel2")+request.getParameter("tel3");
		String depart = request.getParameter("depart");
		String position = request.getParameter("position");
		
		ArrayList<String> ar = new ArrayList<String>();
		ar.add(pw);
		ar.add(name);
		ar.add(email);
		ar.add(tel);
		ar.add(depart);
		ar.add(position);
		ar.add(id);

		
		try {
			Information_Revise2 re = new Information_Revise2(ar);
			String chk = re.insql().intern();
			if(chk=="ok") {
				pwr.print("<script>alert('수정완료');location.href='/portfolio/admin/admin_main.jsp';</script>");
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
