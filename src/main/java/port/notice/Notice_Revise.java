package port.notice;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class Notice_Revise extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pwr = null;
   
    public Notice_Revise() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		pwr = response.getWriter();

		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String downpath = uploadPath + "uploadFile/";
		
		File uploadFilePath = new File(downpath);
		 
		if(!uploadFilePath.isDirectory())
	 
		{	 
			uploadFilePath.mkdir();
	 	
	 
		}
		
		MultipartRequest mr = new MultipartRequest(request, uploadPath, 1024 * 1024 * 2, "UTF-8",new DefaultFileRenamePolicy());

		String check = mr.getParameter("chk");
		String title = mr.getParameter("title");
		String file = mr.getFilesystemName("file");
		String memo = mr.getParameter("memo");
		String idx = mr.getParameter("idx");
		
		
		if (check == null || check == "") {
			check = "no";
		};
		
		ArrayList<String> ar = new ArrayList<String>();
		ar.add(check);
		ar.add(title);
		ar.add(file);
		ar.add(memo);
		ar.add(idx);

		try {
			Notice_Revise2 re = new Notice_Revise2(ar);
			String chk = re.insql().intern();
			System.out.println(chk);
			if(chk=="ok") {
				pwr.print("<script>alert('수정완료');location.href='/portfolio/admin/notice/admin_notice.jsp';</script>");
			}
			else {
				pwr.print("<script>alert('DB에러');history.go(-1);</script>");
			}
			
			pwr.close();
		} catch (Exception e) {
			
		}
		finally {
			
		}
		
		
	}

}
