package kr.co.hospital.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.ManagementDto;

@Mapper
public interface ManagementMapper {
	public List<ManagementDto> getAllUsers();
    public void updateState(ManagementDto mdto);
}
