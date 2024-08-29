package kr.co.hospital.admin.mapper;


import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.UserDto;
@Mapper
public interface UserMapper {
	public void userOk(UserDto udto);

}
