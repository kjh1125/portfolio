package port.notice;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Admin_Notice_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pwr = null;

	public Admin_Notice_Registration() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		pwr = response.getWriter();
		
		//String uploadPath = request.getContextPath(); // /portfolio로 출력됨.

		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String downpath = uploadPath + "uploadFile/";
		//C:\\Users\\tjoeun\\Desktop\\portpolio1011\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\portfolio\\uploadFile 출력됨

	
		File uploadFilePath = new File(downpath);
	 
		if(!uploadFilePath.isDirectory())
	 
		{	 
			uploadFilePath.mkdir();
	 	
	 
		}
		 
	
		MultipartRequest mr = new MultipartRequest(request, downpath, 1024 * 1024 * 2, "UTF-8",new DefaultFileRenamePolicy());
		
		try {
			
			String check = mr.getParameter("check");
			String title = mr.getParameter("title");
			String memo = mr.getParameter("memo");
			String filename = mr.getFilesystemName("file");

			if (check == null || check == "") {
				check = "no";
			};

			ArrayList<String> ar = new ArrayList<String>();
			ar.add(check);
			ar.add(title);
			ar.add(filename);
			ar.add(memo);
			
			Admin_Notice_Registration2 an = new Admin_Notice_Registration2(ar);
			String chk = an.insql().intern();
			System.out.println(chk);

			if (chk == "ok") {
				pwr.print("<script>alert('등록완료');location.href='/portfolio/admin/notice/admin_notice.jsp';</script>");
			} else {
				pwr.print("<script>alert('DB에러');history.go(-1);</script>");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
