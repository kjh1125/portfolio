package port2.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import port2.dto.Product_DTO;

@Service
public class Product_DAO implements Product_Mapper {
	
	
	@Autowired
	private Product_Mapper mainMapper;

	@Override
	public List<Product_DTO> getAll() {
		
		return mainMapper.getAll();
	}

	@Override
	public List<Product_DTO> getCode(String code) {
		
		return mainMapper.getCode(code);
	}

	@Override
	public List<Product_DTO> getItem(String item) {
		
		return mainMapper.getItem(item);
	}

	
}
