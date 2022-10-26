package port2.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import port2.dto.CS_FAQ_DTO;
import port2.dto.CS_Notice_DTO;

@Repository
public interface CS_Mapper {
	
	@Select("select * from faq limit 0,5")
	public List<CS_FAQ_DTO> getLimit();
	
	@Select("select * from faq where cate = #{cate}")
	public List<CS_FAQ_DTO> getCategory(String cate);
	
	@Select("select count(*) from notice")
	public Integer allct();
	
	@Select("select count(*) from notice where title like CONCAT('%',#{search},'%')")
	public Integer allctsearch(String search);
	
	@Select("select count(*) from notice where chk='no'")
	public Integer ctno();
	
	@Select("select count(*) from notice where chk='no' and title like CONCAT('%',#{search},'%')")
	public Integer ctnosearch(String search);
	
	@Select("select count(*) from notice where chk='on'")
	public Integer cton();
	
	@Select("select count(*) from notice where chk='on' and title like CONCAT('%',#{search},'%')")
	public Integer ctonsearch(String search);
	
	
	
	@Select("select * from notice where chk='no' order by idx desc limit #{startpage} , #{pageview}")
	public List<CS_Notice_DTO> noticeno(@Param("startpage") int startpage, @Param("pageview") int pageview);
	
	@Select("select * from notice where chk='no' and title like CONCAT('%',#{search},'%') order by idx desc limit #{startpage} , #{pageview}")
	public List<CS_Notice_DTO> noticenosearch(@Param("search") String search,@Param("startpage") int startpage, @Param("pageview") int pageview);
	
	@Select("select * from notice where chk='on' order by idx desc limit #{startpage} , #{pageview}")
	public List<CS_Notice_DTO> noticeon(@Param("startpage") int startpage, @Param("pageview") int pageview);
	
	@Select("select * from notice where chk='on' and title like CONCAT('%',#{search},'%') order by idx desc limit #{startpage} , #{pageview}")
	public List<CS_Notice_DTO> noticeonsearch(@Param("search") String search,@Param("startpage") int startpage, @Param("pageview") int pageview);
	
	@Select("select * from notice order by idx desc limit #{startpage} , #{pageview}")
	public List<CS_Notice_DTO> noticeall(@Param("startpage") int startpage, @Param("pageview") int pageview);
	
	@Select("select * from notice where title like CONCAT('%',#{search},'%') order by idx desc limit #{startpage} , #{pageview}")
	public List<CS_Notice_DTO> noticeallsearch(@Param("search") String search,@Param("startpage") int startpage, @Param("pageview") int pageview);
	
	
}
