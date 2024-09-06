package kr.co.hospital.admin.dto;

import java.time.LocalTime;

import lombok.Data;

@Data
public class WorkdayDto {

	private int workday_id, doc_id;
	private String dayofweek;
	private LocalTime start_time,end_time;
	
	private String[] dayofweeks;
	private int[] start_times,end_times;
}
