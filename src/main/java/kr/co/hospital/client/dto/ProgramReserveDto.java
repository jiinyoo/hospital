package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class ProgramReserveDto {
	int pres_id,state;
	String user_id,pres_part,pres_date,pres_time,writeday,p_inwon;

}