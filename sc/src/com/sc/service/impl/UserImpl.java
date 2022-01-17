package com.sc.service.impl;

import com.google.gson.Gson;
import com.sc.dao.dto.LoginDto;
import com.sc.dao.dto.UserDto;
import com.sc.service.intf.UserIntf;
import com.sc.vo.DelCardVo;

public class UserImpl implements UserIntf{

	public UserDto doLogin(String jsonStr){
		UserDto userDto = new UserDto();
		Gson gson = new Gson();
		LoginDto dto = gson.fromJson(jsonStr, LoginDto.class);
		
		System.out.println("----------------------------");
		System.out.println(dto.getUserName());
		System.out.println(dto.getPassword());
		
		if(dto.getUserName().equals("supremec") && dto.getPassword().equals("concert786")){
			userDto.setUserName("supremec");
			userDto.setUserType("admin");
		}else{
			userDto.setUserType("invalid");
		}
		
		return userDto;
	}
}
