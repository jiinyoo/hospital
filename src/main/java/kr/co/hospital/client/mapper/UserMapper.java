package kr.co.hospital.client.mapper;


import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.UserDto;
@Mapper
public interface UserMapper {
	public void userOk(UserDto udto);
	public String useridCheck(String user_id);

}
