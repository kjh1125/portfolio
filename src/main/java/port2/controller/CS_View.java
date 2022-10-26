package port2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import port2.dao.CS_Mapper;
import port2.dto.CS_FAQ_DTO;
import port2.dto.CS_Notice_DTO;


@Controller
public class CS_View {
	
	
	List<CS_FAQ_DTO> faqlist = null;
	List<CS_Notice_DTO> noticelist = null;
	
	@Autowired CS_Mapper cs_Mapper;
	
	@RequestMapping("/cs.do/{cate}")
	public String main(@PathVariable String cate ,Model m) {
		
		if(cate.equals("0")||cate.equals(null)) {
			this.faqlist = cs_Mapper.getLimit();
		}
		else {
			this.faqlist = cs_Mapper.getCategory(cate);
		}
		
		m.addAttribute("list", this.faqlist);
		
		return "cs/cs";
	}
	
	private String pgno = "";
	private String search = "";
	private String type = "";
	
	@RequestMapping("/noticelist.do")
	public String notice(Model m, HttpServletRequest request) {
		
		int pageview = 10; // 한페이지당 보여주는 데이터 갯수
		int startpage = 0; // 시작페이지 값
		int pagenumber = 1; // 페이징 갯수
		Integer total = 0;
		
		this.pgno = request.getParameter("page")==null?"":request.getParameter("page").intern();
		this.type = request.getParameter("type")==null?"":request.getParameter("type").intern();
		this.search = request.getParameter("search")==null?"":request.getParameter("search").intern();
		
		
		if (this.type == "공지") {
			if (this.search == "") {
				total = cs_Mapper.ctno();
			} else {
				total = cs_Mapper.ctnosearch(this.search);
			}
		} else if (this.type == "긴급공지") {
			if (this.search == "") {
				total = cs_Mapper.cton();
			} else {
				total = cs_Mapper.ctonsearch(this.search);
			}
		} else {
			if (this.search == "") {
				total = cs_Mapper.allct();
			} else {
				total = cs_Mapper.allctsearch(this.search);
			}
		}
		
		if (this.pgno.equals("undefined") || this.pgno == "") {
			startpage = 0;
		} else {
			startpage = (Integer.parseInt(this.pgno) - 1) * pageview;
		}

		if (total % pageview == 0) {
			pagenumber = total / pageview;
		} else {
			pagenumber = (total / pageview) + 1;
		}
		
		
		if(this.type=="공지") {
			if(this.search=="") {
				noticelist = cs_Mapper.noticeno(startpage, pageview);
				}
			else {
				noticelist = cs_Mapper.noticenosearch(this.search, startpage, pageview);
				}
			
			}
			else if(this.type=="긴급공지") {
				if(this.search=="") {
					noticelist = cs_Mapper.noticeon(startpage, pageview);
					}
				else {
					noticelist = cs_Mapper.noticeonsearch(this.search,startpage, pageview);
					}
			}
			else {
				if(this.search=="") {
					noticelist = cs_Mapper.noticeall(startpage, pageview);
					}
				else {
					noticelist = cs_Mapper.noticeallsearch(this.search,startpage, pageview);
					}
			}
		
		
		
		
		
		m.addAttribute("data",noticelist);
		m.addAttribute("pagenumber",pagenumber);
		m.addAttribute("startpage",startpage);
		m.addAttribute("total",total);
		m.addAttribute("type",type);
		m.addAttribute("search",search);
		
		
		return "cs/notice";
	}
	
	
}
