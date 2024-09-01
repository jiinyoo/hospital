package kr.co.hospital.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hospital.client.dto.UserDto;
import kr.co.hospital.client.mapper.UserMapper;

@Service
@Qualifier("use")
public class UserServicelmpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Override
	public String user()
	{
		return "client/user/user";
	}
	
	@Override
	public String userOk(UserDto udto)
	{
		mapper.userOk(udto);
		return "redirect:/main/login";
	}

	@Override
	public String useridCheck(String user_id) 
	{
		System.out.println(mapper.useridCheck(user_id));
		return mapper.useridCheck(user_id);
	}

}
