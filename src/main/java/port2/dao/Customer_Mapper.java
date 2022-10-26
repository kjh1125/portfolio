package port2.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.stereotype.Repository;

import port2.dto.Customer_Login_DTO;

@Repository
public interface Customer_Mapper {
	
	@Insert("insert into customer (idx,id,pw,name,email,tel,postcode,address1,address2,dt) values('0',#{id},#{pw},#{name},#{email},#{tel},#{postcode},#{address1},#{address2},#{dt})")
	public void signup(Customer_Login_DTO customer);
	
	@Select("select pw from customer where id=#{id}")
	public String login(String id);
	
	
}
