package kr.co.hospital.admin.mapper;

import org.apache.ibatis.annotations.Mapper;

import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.UserDto;

@Mapper
public interface LoginMapper {
	public String loginOk(UserDto udto);

}
