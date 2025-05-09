package kr.co.hospital.admin.dto;

import lombok.Data;

@Data
public class AdminNoticeDto {
	private int notice_id,readnum;
	private String user_id,title,content,img,writeday;
	
	private String[] imgs;

}
