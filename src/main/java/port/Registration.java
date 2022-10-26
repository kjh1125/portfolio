package port;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> ar = null;
   
    public Registration() {
        
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
		String email = request.getParameter("em");
		String tel = request.getParameter("tel1")+request.getParameter("tel2")+request.getParameter("tel3");
		String depart = request.getParameter("depart");
		String position = request.getParameter("position");
		
		
		ar = new ArrayList<String>();
		ar.add(id);
		ar.add(pw);
		ar.add(name);
		ar.add(email);
		ar.add(tel);
		ar.add(depart);
		ar.add(position);
		try {
			Registration2 re = new Registration2(ar);
			String chk = re.insql().intern();
			//System.out.println(chk);
			if(chk=="ok") {
				pwr.print("<script>alert('등록완료');location.href='/portfolio/admin/index.jsp';</script>");
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
