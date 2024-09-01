package kr.co.hospital.client.service;

import kr.co.hospital.client.dto.UserDto;

public interface UserService {
	public String user();
	public String userOk(UserDto udto);
	public String useridCheck(String user_id);

}
