package kr.co.hospital.client.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.BoardDto;

@Mapper
public interface BoardMapper {
	void boardinsert(BoardDto bdto);
	ArrayList<HashMap> boardlist(int index, String stype, String sword);
	void boardReadnum(String board_id);
	BoardDto boardcontent(String board_id);
	void boarddelete(String board_id, String user_id);
	void boardupdateOk(BoardDto bdto);
	int getChong(String stype, String sword);
}
