package port2.dto;

import lombok.Data;

@Data

public class Customer_Login_DTO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String tel;
	private String postcode;
	private String address1;
	private String address2;
	private String dt;

}
