package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class UserDto {

	private int id;
	private String user_id,user_pwd,user_name,user_phone,user_email,user_jumin,user_addr,writeday;
	private int state;

}
