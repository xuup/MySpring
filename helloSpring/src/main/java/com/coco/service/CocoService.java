package com.coco.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coco.dao.CocoDaoInterface;
import com.coco.dto.CocoDto;

@Service
public class CocoService {
	
	@Resource
	private CocoDaoInterface cocoDao;
	
	
	@RequestMapping("insert")
	public void insert(){
		CocoDto cocoDto = new CocoDto();
		cocoDto.setPicPath("/666");
		cocoDto.setWareId("666");
		
		int num = cocoDao.insert(cocoDto);
		System.out.println(num);
	}
}
