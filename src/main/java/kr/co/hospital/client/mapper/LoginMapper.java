package kr.co.hospital.client.mapper;

import org.apache.ibatis.annotations.Mapper;

import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;

@Mapper
public interface LoginMapper {
	public String loginOk(UserDto udto);
	public Integer getState(String userid);

}
