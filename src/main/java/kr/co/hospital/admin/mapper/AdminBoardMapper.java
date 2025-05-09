package kr.co.hospital.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.AdminBoardDto;

@Mapper
public interface AdminBoardMapper {

	int getState(String user_id);

	int getChong(String stype, String sword);

	ArrayList<HashMap> boardlist(int index, String stype, String sword);

	AdminBoardDto boardcontent(int board_id);

	void boardReadnum(int board_id);

	void boarddelete(int board_id);

}
