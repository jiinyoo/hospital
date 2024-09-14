package kr.co.hospital.client.dto;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ProgramDto {
	int pro_id;
	String pro_name, pro_info,teach_name,pro_inwon,pro_part,pro_img,pro_time;
	String start_date,end_date,writeday,day_of_week;
	
}	
