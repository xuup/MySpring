package com.coco.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coco.controller.common.BaseController;
import com.coco.dto.UserDto;
import com.coco.dto.UserVo;
import com.coco.service.UserService;


@Controller
@RequestMapping("user")
public class UserController extends BaseController{
	
	@Resource
	private UserService userService;
	
	
	@Autowired
	private Mapper mapper;
	
		
	@RequestMapping("listUser")
	public String listUser(HttpServletRequest request){
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		request.setAttribute("userName", userName);
		return "/user/listUser";
	}
	
	
	@RequestMapping("searchUser")
	@ResponseBody
	public Map<String, Object> searchUser(UserVo userVo){
		
		Logger logger = Logger.getLogger("searchUser");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("limit", userVo.getLimit());
		queryMap.put("offset", userVo.getOffset());
		queryMap.put("userName", userVo.getUserName());
		
		logger.info("init userList begin...");
		List<UserDto> list = userService.searchUser(queryMap);
		logger.info("init userList end...");
		
		int count = userService.getCount(queryMap);
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	
	@RequestMapping("addUser")
	public String addUser(ModelMap mpdelMap){
		mpdelMap.put("context", "context");
		return "/user/addUser";
	}
	
	
	@RequestMapping("getUserById")
	@ResponseBody
	public UserDto getUserById(String data){
		int id = Integer.valueOf(data);
		return userService.getUserById(id);
	}
	
	
	@RequestMapping("updateUserById")
	@ResponseBody
	public String updateUserById(UserVo userVo){
		UserDto userDto = mapper.map(userVo, UserDto.class);
		userService.updateUserById(userDto);
		return "success";
	}
	
	@RequestMapping("insertUser")
	@ResponseBody
	public String insertUser(UserVo userVo){
		
		UserDto userDto = mapper.map(userVo, UserDto.class);
		
		System.out.println("--------begin--------");
		
		
		userService.insertUser(userDto);
		
		System.out.println("--------end--------");
		
		return "ok";
		
	}
	
	
	@RequestMapping("deleteUserById")
	@ResponseBody
	public String deleteUserById(String id){
		userService.deleteUserById(Integer.valueOf(id));
		return "ok";
	}
	
	
	
	@RequestMapping("insertUser2")
	@ResponseBody
	public void insertUser2(UserDto userDto,HttpServletResponse response) throws IOException{
		
		
		System.out.println("--------begin2--------");
		
		
		userService.insertUser(userDto);
		
		System.out.println("--------end2--------");
		
		
		response.getWriter().write("ok");
	}
	
	
}
