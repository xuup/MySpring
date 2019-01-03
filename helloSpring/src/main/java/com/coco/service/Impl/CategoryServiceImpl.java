package com.coco.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.coco.dao.CategoryDao;
import com.coco.dto.CategoryDto;
import com.coco.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Resource
	private CategoryDao categoryDao;
	
	public List<CategoryDto> selectCategory() {
		List<CategoryDto> rs = new ArrayList<CategoryDto>();
		rs = categoryDao.selectCategory();
		return rs;
	}
	
	public void insertCategory(CategoryDto categoryDto){
		categoryDao.insertCategory(categoryDto);
	}

}
