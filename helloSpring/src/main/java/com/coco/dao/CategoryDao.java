package com.coco.dao;

import java.util.List;

import com.coco.dto.CategoryDto;

public interface CategoryDao {
	public List<CategoryDto> selectCategory();
	
	public void insertCategory(CategoryDto categoryDto);
}
