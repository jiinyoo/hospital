package kr.co.hospital.client.dto;

import java.time.LocalTime;

import lombok.Data;

@Data
public class ReserveDto {
	private String doc_part,user_id,user_phone,res_code,user_jumin,res_date;
	private int res_id,doc_id,state;
	private LocalTime res_time;
}
