package kr.co.hospital.admin.dto;

import lombok.Data;

@Data
public class AdminInquiryDto {
	private int inq_id,group_order;
	private String user_id,title,content,readnum,writeday,part,state,img,answer,bimil,origin_user_id,ustate;
	private String[] imgs;
}
