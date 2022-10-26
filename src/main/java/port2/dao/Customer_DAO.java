package port2.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import port2.dto.Customer_Login_DTO;

@Service
public class Customer_DAO implements Customer_Mapper  {

	@Autowired
	private Customer_Mapper customer_Mapper;

	@Override
	public void signup(Customer_Login_DTO customer) {}

	@Override
	public String login(String id) {
		return customer_Mapper.login(id);
	}
	
	
	
	
}
