package port2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import port2.dao.Customer_Mapper;
import port2.dto.Customer_Login_DTO;


@Controller
public class Top_View {
	
	PrintWriter pwr = null;
	private int authNumber;
	HttpSession se = null;
	
	
	@RequestMapping("/mainlogout.do")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		pwr = response.getWriter();
		se = request.getSession();
		se.invalidate();
		pwr.write("<script>alert('로그아웃 하였습니다.');location.href='/portfolio/index.do';</script>");
		
	}
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder; //spring에서 제공하는 암호화 // 복호화 불가
	
	@Autowired 
	private Customer_Mapper customer_Mapper;
	
	@RequestMapping("/member_login.do") //로그인
	public String login(Customer_Login_DTO customer, HttpServletRequest request, HttpServletResponse response){
		
		try {
			
			if(customer.getId()!=null&&customer.getPw()!=null) {
				response.setContentType("text/html; charset=utf-8");
				pwr = response.getWriter();
				
				String pass1 = customer.getPw(); //입력한 비밀번호
				String pass2 = customer_Mapper.login(customer.getId()); //저장된 암호화된 비밀번호
				
				//Bcrypt로 암호화 된 파일과 입력한 비밀번호 matches로 결과 확인 (true, false)
				Boolean result = passwordEncoder.matches(pass1, pass2);
				
				if(result==true) {
					se = request.getSession();
					se.setAttribute("mainid", customer.getId());
					pwr.write("<script>alert('로그인 성공');location.href='/portfolio/index.do';</script>");
				}
				
				else {
					pwr.write("<script>alert('아이디와 비밀번호를 다시 확인해주세요');location.href='./member_login.do';</script>");
				}
				pwr.flush();
				
			}
		} catch (Exception e) {
			
		}

		return "top/member_login";
	}

	@RequestMapping("/member.do") //회원가입
	public String member(Customer_Login_DTO customer, HttpServletResponse response) throws IOException{
		
		
		
		try {
			
			
			if(customer.getId()!=null) {
				response.setContentType("text/html; charset=utf-8");
				pwr = response.getWriter();
				//Bcrypt로 비밀번호 암호화
				String pass1 = passwordEncoder.encode(customer.getPw());
				customer.setPw(pass1);
				//System.out.println(pass1);
				
				customer_Mapper.signup(customer);
				pwr.write("<script>alert('회원가입 완료');location.href='./member_login.do';</script>");
				pwr.flush();
			}
		} catch (Exception e) {
			
		}
		
		return "top/member";
	}
	
	@RequestMapping("/cart.do") //장바구니
	public String cart(){
		
		
		return "top/ordercart";
	}
	@RequestMapping("/basket.do") //장바구니
	@ResponseBody
	public void basket(String item, HttpServletRequest request){
		this.se=request.getSession();
		
		
	}
	


	@Autowired
	private JavaMailSender mailSender;
    
	//mailSend 코드
	@ResponseBody
	@RequestMapping("/mailcheck.do")
	public int mailSend(HttpServletRequest request,String email) {
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		makeRandomNumber();
		 try { 
			 MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true,"UTF-8");
		
		messageHelper.setFrom("kjhwinter@gmail.com"); // 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨 
		messageHelper.setTo(email); // 받는사람 이메일
		messageHelper.setSubject("인증번호 확인"); // 메일제목 messageHelper.setText("test"); // 메일 내용
		messageHelper.setText("인증번호는:"+this.authNumber+"입니다");
		
		 } 
		 catch (Exception e) { 
			 e.printStackTrace(); }
		try {
			mailSender.send(mimeMessage);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return this.authNumber;
	}
	//mail 인증번호 생성
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		//System.out.println("인증번호 : " + checkNum);
		this.authNumber = checkNum;
	}
	
	
}
