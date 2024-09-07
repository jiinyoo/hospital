package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class InquiryDto {
	private int inq_id,group_order;
	private String user_id,title,content,readnum,writeday,part,state,img,answer,bimil;
	private String[] imgs;
}
