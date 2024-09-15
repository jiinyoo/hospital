package kr.co.hospital.admin.dto;

import lombok.Data;

@Data
public class ManagementDto{
	
	private int id, state;
	private String user_id, user_name, user_email;

}
