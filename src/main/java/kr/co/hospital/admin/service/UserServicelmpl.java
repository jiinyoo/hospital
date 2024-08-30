package kr.co.hospital.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hospital.admin.dto.UserDto;
import kr.co.hospital.admin.mapper.UserMapper;

@Service
@Qualifier("use")
public class UserServicelmpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Override
	public String user()
	{
		return "/admin/user/user";
	}
	
	@Override
	public String userOk(UserDto udto)
	{
		mapper.userOk(udto);
		return "redirect:/admin/login";
	}

}
