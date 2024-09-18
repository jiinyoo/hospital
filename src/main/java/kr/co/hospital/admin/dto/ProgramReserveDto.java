package kr.co.hospital.admin.dto;

import lombok.Data;

@Data
public class ProgramReserveDto {
	int pres_id,pro_id,state,p_inwon;
	String user_id,pres_part,pres_date,pres_time,writeday,pres_number,pro_name,user_name,user_phone;
}
