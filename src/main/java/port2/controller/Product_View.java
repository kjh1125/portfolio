package port2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import port2.dao.Product_Mapper;
import port2.dto.Product_DTO;

@Controller
public class Product_View {
	String code = "";
	List<Product_DTO> list = null;
	
	@Autowired Product_Mapper mainMapper;
	
	@RequestMapping("index.do")
	public String main_view (HttpServletRequest request, Model m) {
		this.code = request.getParameter("code")==null?"":request.getParameter("code").intern(); // Nullpoint Exception error를 예방.
		
		
		if(this.code=="") {
			this.list=mainMapper.getCode("0103");
		}
		else {
			this.list=mainMapper.getCode(this.code);
		}
		
	
		m.addAttribute("list",this.list);
		m.addAttribute("code",this.code);
		
		return "main/index";
	}
	
	@RequestMapping("/item.do") //구매화면
	public String item_view (HttpServletRequest request, Model m) {
		
		String item = request.getParameter("item")==null?"":request.getParameter("item").intern();
		
		this.list=mainMapper.getItem(item);
	
		m.addAttribute("list",this.list);
		
		return "item/item";
	}
	
	@RequestMapping("/order.do") //구매
	public String order(HttpServletRequest request, Model m){
		
		String item = request.getParameter("item")==null?"":request.getParameter("item").intern();
		
		this.list=mainMapper.getItem(item);
	
		m.addAttribute("list",this.list);
		
		return "item/order";
	}
	
	
	
	@RequestMapping("/complet.do") //결제API
	public String complet_view (HttpServletRequest request, Model m) {
		
		String item = request.getParameter("item")==null?"":request.getParameter("item").intern();
		
		this.list=mainMapper.getItem(item);
	
		m.addAttribute("list",this.list);
		
		
		return "item/complet";
	}
	
	//이니시스 returnUrl
	@RequestMapping("/INIstdpay_pc_return.do") 
	public String INIstdpay () {
		

		return "item/INIstdpay_pc_return";
	}
	//이니시스 closeUrl
	@RequestMapping("/close.do") //결제API
	public String close () {
		
		
		return "item/close";
	}
	
	
}
