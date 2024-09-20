package kr.co.hospital.client.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.NoticeDto;

@Mapper
public interface NoticeMapper {
	public void notice_writeOk(NoticeDto ndto);
	public ArrayList<HashMap> notice_list(int index, int pageSize);
	public void notice_readnum(String noitce_id);
	public NoticeDto notice_content(String noitce_id);
	public void notice_updateOk(NoticeDto ndto);
	public void notice_delete(String user_id, String notice_id);
	public int getTotalNoticeCount();

}
