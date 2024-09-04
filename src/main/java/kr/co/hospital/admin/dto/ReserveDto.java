package kr.co.hospital.admin.dto;

import java.time.LocalTime;

import lombok.Data;

@Data
public class ReserveDto {

	private String doc_part, user_id, user_phone, res_code, user_jumin, res_date;
	private String writeday, user_name, doc_userid, doc_name;
	private LocalTime res_time;
	private int res_id, doc_id, state;
	
	
	
	
	
}
