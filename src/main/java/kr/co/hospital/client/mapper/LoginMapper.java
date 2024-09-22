package kr.co.hospital.client.mapper;

import org.apache.ibatis.annotations.Mapper;

import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;

@Mapper
public interface LoginMapper {
	public String loginOk(UserDto udto);
	public Integer getState(String user_id);
	public String findUserId(String user_email, String user_name);
	public String findPassword(String user_email, String user_id);
	public int updatePwd(String user_id, String newPwd);

}
