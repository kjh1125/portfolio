package port2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import port2.dto.Product_DTO;

@Repository
public interface Product_Mapper {
	@Select("select * from product_list")
	public List<Product_DTO> getAll();
	
	@Select("select * from product_list where code = #{code}")
	public List<Product_DTO> getCode(String code);
	
	@Select("select * from product_list where idx = #{item}")
	public List<Product_DTO> getItem(String item);
	
}
