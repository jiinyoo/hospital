package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class BoardDto {
	int board_readnum;
	String board_id,user_id,board_title,board_content,board_img,writeday;
}
