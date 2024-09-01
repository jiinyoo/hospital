package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class BoardDto {
	int id;
	String user_id,board_title,board_content,board_img,board_readnum,writeday;
}
