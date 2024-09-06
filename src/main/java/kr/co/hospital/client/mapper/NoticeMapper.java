package kr.co.hospital.client.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.NoticeDto;

@Mapper
public interface NoticeMapper {
	public void notice_writeOk(NoticeDto ndto);
	public ArrayList<NoticeDto> list();
	public void readnum(String id);
	public NoticeDto content(String id);
	public NoticeDto update(String id);
	public void updateOk(NoticeDto ndto);
	public void delete(int id);

}
