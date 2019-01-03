package com.coco.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coco.dto.UserDto;
import com.coco.dto.UserVo;
import com.coco.service.UserService;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Resource
	private Mapper mapper;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("initLogin")
	public String initLogin(){
		return "/login";
	}
	
	@RequestMapping("dologin")
	public String login(HttpServletRequest request, UserVo userVo, ModelMap map) throws UnsupportedEncodingException{
		if(userVo == null){
			map.put("message", "用户信息为空!");
			return "login";
		}
		if(StringUtils.isBlank(userVo.getUserName())){
			map.put("message", "登录名为空!");
			return "login";
		}
		if(StringUtils.isBlank(userVo.getPassword())){
			map.put("message", "密码为空!");
			return "login";
		}
		UserDto userDto = mapper.map(userVo, UserDto.class);
		UserDto rs = userService.searchUserByPro(userDto);
		if(rs == null){
			map.put("message", "用户名或密码错误!");
			return "login";
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("user", userDto.getUserName());
			return "redirect:/user/listUser";
		}
	}
	
}
