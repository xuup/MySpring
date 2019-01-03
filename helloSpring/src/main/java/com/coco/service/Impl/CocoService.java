package com.coco.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coco.dao.CocoDaoInterface;
import com.coco.dto.CocoDto;
import com.coco.dto.CocoVo;

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
	
	@RequestMapping("insert1")
	public void insert1(CocoDto cocoDto){
		
		int num = cocoDao.insert(cocoDto);
		System.out.println(num);
	}
	
	@RequestMapping("list")
	public List list(CocoDto cocoDto){
		List<CocoDto> list = cocoDao.list(cocoDto);
		return list;
	}
	
	public Integer getCount(CocoDto cocoDto){
		Integer count = cocoDao.getCount(cocoDto);
		return count;
	}
	
	public CocoDto selectById(String id){
		CocoDto cocoDto = cocoDao.selectById(id);
		return cocoDto;
	}
	
	
	public void updateById(CocoDto cocoDto){
		cocoDao.updateById(cocoDto);
	}
	
	public void deleteById(String id){
		cocoDao.deleteById(id);
	}
	
}
