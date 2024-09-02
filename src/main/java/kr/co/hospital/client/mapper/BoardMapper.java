package kr.co.hospital.client.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.BoardDto;

@Mapper
public interface BoardMapper {

	void boardinsert(BoardDto bdto);

	ArrayList<HashMap> boardlist();

}
