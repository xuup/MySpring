package com.coco.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coco.controller.common.BaseController;
import com.coco.dto.UserDto;
import com.coco.service.UserService;


@Controller
@RequestMapping("user")
public class UserController extends BaseController{
	
	@Resource
	private UserService userService;
	
	@RequestMapping("addUser")
	public String addUser(ModelMap mpdelMap){
		mpdelMap.put("context", "context");
		return "/user/addUser";
	}
	
	@RequestMapping("insertUser")
	public void insertUser(UserDto userDto){
		
		System.out.println("--------begin--------");
		
		
		userService.insert(userDto);
		
		System.out.println("--------end--------");
		
		
	}
	
	
	
	@RequestMapping("insertUser2")
	@ResponseBody
	public void insertUser2(UserDto userDto,HttpServletResponse response) throws IOException{
		
		
		System.out.println("--------begin2--------");
		
		
		userService.insert(userDto);
		
		System.out.println("--------end2--------");
		
		
		response.getWriter().write("ok");
	}
	
	
}
