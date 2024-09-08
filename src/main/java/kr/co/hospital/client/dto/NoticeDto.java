package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class NoticeDto {
	private int readnum;
	private String notice_id,user_id,title,content,img,writeday;
	
	private String[] imgs;

}
