package port2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Bottom_View {
	
	//회사소개
	@RequestMapping("/company.do")
	public String company()
	{
		
		return "bottom/company";
	}
	
	//이용약관
	@RequestMapping("/agreement.do")
	public String agreement()
	{
		
		return "bottom/agreement";
	}
	
	//개인정보 처리방침
	@RequestMapping("/privacy.do")
	public String privacy()
	{
		
		return "bottom/privacy";
	}
	
	//이용안내
	@RequestMapping("/guide.do")
	public String guide()
	{
		
		return "bottom/guide";
	}
	
	
}
