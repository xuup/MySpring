package com.coco.dao;

import java.util.List;

import com.coco.dto.Condition;
import com.coco.dto.UserDto;

public interface UserDao {
	
	public List<UserDto> searchUser(Condition condition);
	 
	public void insertUser(UserDto userDto);
	
	public int getCount(Condition condition);
	
	public UserDto getUserById(int id);
	
	public void deleteUserById(int id);
	
	public void updateUserById(UserDto userDto);
	
}
