package com.coco.service;

import java.util.List;
import java.util.Map;

import com.coco.dto.UserDto;
import com.coco.dto.UserVo;


public interface UserService {
	
	public List<UserDto> searchUser(Map<String, Object> paramMap);
	
	public int getCount(Map<String, Object> paramMap);
	
	public void insertUser(UserDto userDto);
	
	public void updateUserById(UserDto userDto);
	
	public void deleteUserById(int id);
	
	public UserDto getUserById(int id);

}
