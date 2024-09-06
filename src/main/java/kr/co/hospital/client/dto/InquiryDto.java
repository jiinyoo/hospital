package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class InquiryDto {
	private int inq_id;
	private String user_id,title,content,readnum,writeday,part,state,img,answer,bimil;

}
