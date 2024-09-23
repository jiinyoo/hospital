package kr.co.hospital.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.AdminNoticeDto;

@Mapper
public interface AdminNoticeMapper {
	public void admin_notice_writeOk(AdminNoticeDto ndto);
	public ArrayList<HashMap> admin_notice_list(int index, int pageSize);
	public void admin_notice_readnum(String noitce_id);
	public AdminNoticeDto admin_notice_content(String noitce_id);
	public void admin_notice_updateOk(AdminNoticeDto ndto);
	public void admin_notice_delete(String user_id, String notice_id);
	public int getTotalNoticeCount();
	

}
