package com.coco.service;

import java.util.List;

import com.coco.dto.CategoryDto;

public interface CategoryService {
	public List<CategoryDto> selectCategory();
	
	public void insertCategory(CategoryDto categoryDto);
}
