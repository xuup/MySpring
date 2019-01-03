package com.coco.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.coco.dao.UserDao;
import com.coco.dto.Condition;
import com.coco.dto.UserDto;
import com.coco.dto.UserVo;
import com.coco.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserDao userDao;
	
	
	public List<UserDto> searchUser(Map<String, Object> map){
		Integer limit = 5;
		Integer offset = 1;
		if(map.get("limit") != null){
			limit = (Integer) map.get("limit");
		}
		
		if(map.get("offset") != null){
			offset = (Integer) map.get("offset");
		}
		
		
		Condition condition = new Condition();
		condition.setLimit(limit);
		condition.setOffset(offset);
		
		if(map.get("userName") != null){
			String userName = (String) map.get("userName");
			if(StringUtils.isNotBlank(userName)){
				condition.setUserName(userName);
			}
		}
		
		List<UserDto> list = userDao.searchUser(condition);
		
		return list;
	}
	
	
	public int getCount(Map<String, Object> map){
		Integer limit = 5;
		Integer offset = 1;
		if(map.get("limit") != null){
			limit = (Integer) map.get("limit");
		}
		
		if(map.get("offset") != null){
			offset = (Integer) map.get("offset");
		}
		
		Condition condition = new Condition();
		condition.setLimit(limit);
		condition.setOffset(offset);
		
		return userDao.getCount(condition);
	}
	
	
	public UserDto getUserById(int id){
		return userDao.getUserById(id);
	}
	
	public void updateUserById(UserDto userDto){
		userDao.updateUserById(userDto);
	}
	
	
	public void insertUser(UserDto userDto){
		userDao.insertUser(userDto);
	}
	
	
	public void deleteUserById(int id){
		userDao.deleteUserById(id);
	}
	
	public UserDto searchUserByPro(UserDto userDto){
		return userDao.searchUserByPro(userDto);
	}
	
}
