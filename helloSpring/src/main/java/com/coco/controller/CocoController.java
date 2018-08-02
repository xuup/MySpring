package com.coco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coco.dto.CocoDto;
import com.coco.dto.CocoVo;
import com.coco.service.CocoService;
import com.coco.util.PaginationUtil;

@Controller
@RequestMapping("cocoTest")
public class CocoController {
	
	@Resource
	private CocoService service;
	
	@RequestMapping("intiCoco")
	public String initCoco(){
		return "/coco";
	}
	
	@RequestMapping("insert")
	@ResponseBody
	public Map insert(CocoDto dto){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("------begin------");
		service.insert1(dto);
		System.out.println("-----------end-------------");
		
		map.put("message", "ok");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("list")
	public Map list(CocoDto dto){
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("------begin------"+dto.getLimit());
		List<CocoDto> list = service.list(dto);
		System.out.println("------end--------"+dto.getOffset());
		
		int count = service.getCount(dto);
		map.put("rows", list);
		map.put("total", count);
		
		return map;
	}
	
	@RequestMapping("edit")
	public String edit(String id,String data,ModelMap modelMap){
		CocoDto cocoDto = new CocoDto();
		cocoDto = service.selectById(id);
		modelMap.put("cocoDto", cocoDto);
		return "editCoco";
	}
	
}
