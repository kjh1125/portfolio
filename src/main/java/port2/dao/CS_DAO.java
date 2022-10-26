package port2.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import port2.dto.CS_FAQ_DTO;
import port2.dto.CS_Notice_DTO;

@Service
public class CS_DAO implements CS_Mapper {

	@Autowired
	private CS_Mapper cs_Mapper;
	// private CS_Repository cs_Repository;

	@Override
	public List<CS_FAQ_DTO> getLimit() {

		return cs_Mapper.getLimit();
	}

	@Override
	public List<CS_FAQ_DTO> getCategory(String cate) {

		return cs_Mapper.getCategory(cate);
	}

	@Override
	public Integer allct() {

		return cs_Mapper.allct();
	}

	@Override
	public Integer allctsearch(String search) {
		// TODO Auto-generated method stub
		return cs_Mapper.allctsearch(search);
	}

	@Override
	public Integer ctno() {
		// TODO Auto-generated method stub
		return cs_Mapper.ctno();
	}

	@Override
	public Integer ctnosearch(String search) {
		// TODO Auto-generated method stub
		return cs_Mapper.ctnosearch(search);
	}

	@Override
	public Integer cton() {
		// TODO Auto-generated method stub
		return cs_Mapper.cton();
	}

	@Override
	public Integer ctonsearch(String search) {
		// TODO Auto-generated method stub
		return cs_Mapper.ctonsearch(search);
	}

	@Override
	public List<CS_Notice_DTO> noticeno(int startpage, int pageview) {
		
		return cs_Mapper.noticeno(startpage,pageview);
	}

	@Override
	public List<CS_Notice_DTO> noticenosearch(String search, int startpage, int pageview) {
		// TODO Auto-generated method stub
		return cs_Mapper.noticenosearch(search,startpage,pageview);
	}

	@Override
	public List<CS_Notice_DTO> noticeon(int startpage, int pageview) {
		// TODO Auto-generated method stub
		return cs_Mapper.noticeon(startpage,pageview);
	}

	@Override
	public List<CS_Notice_DTO> noticeonsearch(String search, int startpage, int pageview) {
		// TODO Auto-generated method stub
		return cs_Mapper.noticeonsearch(search,startpage,pageview);
	}

	@Override
	public List<CS_Notice_DTO> noticeall(int startpage, int pageview) {
		// TODO Auto-generated method stub
		return cs_Mapper.noticeall(startpage,pageview);
	}

	@Override
	public List<CS_Notice_DTO> noticeallsearch(String search, int startpage, int pageview) {
		// TODO Auto-generated method stub
		return cs_Mapper.noticeallsearch(search,startpage,pageview);
	}

}
