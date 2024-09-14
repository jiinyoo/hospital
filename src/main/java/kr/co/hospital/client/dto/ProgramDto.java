package kr.co.hospital.client.dto;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ProgramDto {
	int pro_id,pro_inwon,minus_inwon;
	String pro_name, pro_info,teach_name,pro_part,pro_img,pro_time;
	String start_date,end_date,writeday,day_of_week;
	
}	
