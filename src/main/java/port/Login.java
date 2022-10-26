package port;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pwr = null;
	String msg1 = null;
	String id = null;
	String pw = null;
	public Login() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		pwr = response.getWriter();
		
		this.id = request.getParameter("id");
		this.pw = request.getParameter("pw");
		
		if (this.id == "" || this.pw == "") {
			pwr.write("<script>alert('아이디와 비밀번호를 입력하세요');history.go(-1);</script>");
		} else {
			
			try {
				
				Log re = new Log(this.id);
				
				login12(this.id, this.pw);
				
				if (this.msg1!=null && this.msg1!=""&&this.msg1!="N") {
					HttpSession se = request.getSession();
					se.setAttribute("nm", this.msg1);
					se.setAttribute("id", this.id);
					pwr.write("<script>alert('로그인 성공');location.href='/portfolio/admin/admin_main.jsp';</script>");
				} 
				else if(this.msg1=="N") {
					pwr.write("<script>alert('관리자에게 승인요청을 해주세요');history.go(-1);</script>");
				}
				else{
					pwr.write("<script>alert('아이디와 비밀번호를 재확인해주세요');history.go(-1);</script>");
				}
			} catch (Exception e) {
				System.out.println("error");
			} finally {
				pwr.close();
			}
		}


	}

	public String login12(String id, String pw) {
		try {
			Login_Ok lok = new Login_Ok(id, pw);

			this.msg1 = lok.insql().intern();

		} catch (Exception e) {

		}
		return msg1;
	}

}
