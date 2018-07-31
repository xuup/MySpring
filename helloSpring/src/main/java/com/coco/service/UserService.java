package com.coco.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.coco.dao.UserDao;
import com.coco.dto.UserDto;

@Service
public class UserService {
	@Resource
	private UserDao userDao;
	
	public void insert(UserDto userDto){
		userDao.insertUser(userDto);
	}
}
