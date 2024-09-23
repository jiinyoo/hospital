package kr.co.hospital.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.ManagementDto;

@Mapper
public interface ManagementMapper {
	public List<ManagementDto> getAllUsers();
    public void updateState(ManagementDto mdto);
	public int getTotalUsers();
	public List<ManagementDto> getUsersByPage(int offset, int limit);
	public int getTotalUsersBySearch(String search);
	public List<ManagementDto> getUsersBySearch(String search, int offset, int limit);
	public boolean isDoctor(String id);
	public int getDocId(String id);
	public void delWorkday(int doc_id);
	public void delDoctor(int doc_id);
}
