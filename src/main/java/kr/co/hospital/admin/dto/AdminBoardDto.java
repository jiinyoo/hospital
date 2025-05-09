package kr.co.hospital.admin.dto;

import lombok.Data;

@Data
public class AdminBoardDto {
	int board_readnum;
	String board_id,user_id,board_title,board_content,board_img,writeday;
}
