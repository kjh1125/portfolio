package port.product;

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

public class Product_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pwr = null;

	public Product_Insert() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		pwr = response.getWriter();

		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFile/");

		MultipartRequest mr = new MultipartRequest(request, uploadPath, 1024 * 1024 * 2, "UTF-8", new DefaultFileRenamePolicy());
		String upload[] = uploadPath.split("wtpwebapps");
		
		String file1 = upload[1]+"\\"+mr.getFilesystemName("file1");
		String file2 = upload[1]+"\\"+mr.getFilesystemName("file2");
		String file3 = upload[1]+"\\"+mr.getFilesystemName("file3");
		
	
		String code = mr.getParameter("bcode")+mr.getParameter("scode");
		String bcode = mr.getParameter("bcode");
		String scode = mr.getParameter("scode");
		String pcode = mr.getParameter("pcode");
		String pnm = mr.getParameter("pnm");
		String psub = mr.getParameter("psub");
		String price = mr.getParameter("price");
		String sale = mr.getParameter("sale");
		String saleprice = mr.getParameter("saleprice");
		String saleea = mr.getParameter("saleea");
		String saleuse = mr.getParameter("saleuse");
		String earlysoldout = mr.getParameter("earlysoldout");
		String productdetail = mr.getParameter("productdetail");
	
		
		 ArrayList<String> ar = new ArrayList(); 
		 ar.add(code); 
		 ar.add(bcode);
		 ar.add(scode);
		 ar.add(pcode); 
		 ar.add(pnm);
		 ar.add(psub); 
		 ar.add(price);
		 ar.add(sale); 
		 ar.add(saleprice); 
		 ar.add(saleea); 
		 ar.add(saleuse);
		 ar.add(earlysoldout); 
		 ar.add(file1); 
		 ar.add(file2);
		 ar.add(file3); 
		 ar.add(productdetail);
		  
		 try { 
			 Product_Insert2 re = new Product_Insert2(ar); 
			 String chk = re.insql().intern();
		  
		 if(chk=="ok") { 
			 pwr.print("<script>alert('등록완료');location.href='/portfolio/admin/product/admin_product.jsp';</script>"); 
			 } 
		 else 
			 { 
			pwr.print("<script>alert('DB에러');history.go(-1);</script>"); 
			}
		  
		  
		  } catch (Exception e) {
		  
		  } finally { 
			 pwr.close(); 
		}
		 

	}

}
