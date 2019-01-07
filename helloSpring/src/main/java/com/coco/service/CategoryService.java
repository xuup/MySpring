package com.coco.service;

import java.util.List;

import com.coco.dto.CategoryDto;

public interface CategoryService {
	public List<CategoryDto> selectCategory();
	
	public CategoryDto selectCategoryById(Integer categoryId);
	
	public void insertCategory(CategoryDto categoryDto);
	
	public void updateCategory(CategoryDto categoryDto);
}
