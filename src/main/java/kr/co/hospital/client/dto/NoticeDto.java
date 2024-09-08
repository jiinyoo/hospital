package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class NoticeDto {
	private int notice_id,readnum;
	private String user_id,title,content,img,writeday;
	
	private String[] imgs;

}
