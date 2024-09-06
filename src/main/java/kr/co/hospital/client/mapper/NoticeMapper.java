package kr.co.hospital.client.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.NoticeDto;

@Mapper
public interface NoticeMapper {
	public void notice_writeOk(NoticeDto ndto);
	public ArrayList<HashMap> notice_list();
	public void notice_readnum(String id);
	public NoticeDto notice_content(String id);
	public NoticeDto notice_update(String id);
	public void notice_updateOk(NoticeDto ndto);
	public void notice_delete(int id);

}
