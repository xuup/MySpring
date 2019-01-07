package com.coco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coco.controller.common.BaseController;
import com.coco.dto.CategoryDto;
import com.coco.service.ArticleService;
import com.coco.service.CategoryService;

@Controller
@RequestMapping("category")
public class CategoryController extends BaseController{
	
	@Resource
	private CategoryService categoryService;
	
	@RequestMapping("initCategory")
	public String initCategory(){
		return "category/listCategory";
	}
	
	
	@ResponseBody
	@RequestMapping("listCategory")
	public Map<String, Object> listCategory(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<CategoryDto> list = null;
		list = categoryService.selectCategory();
		map.put("rows", list);
		map.put("total", list.size());
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping("getCategoryById")
	public CategoryDto getCategoryById(Integer categoryId){
		CategoryDto categoryDto = new CategoryDto();
		categoryDto = categoryService.selectCategoryById(categoryId);
		return categoryDto;
	}
	
	
	@RequestMapping("insertCategory")
	@ResponseBody
	public String insertCategory(CategoryDto categoryDto){
		categoryService.insertCategory(categoryDto);
		return "ok";
	}
	
	
	@RequestMapping("updateCategory")
	@ResponseBody
	public String updateCategory(CategoryDto categoryDto){
		categoryService.updateCategory(categoryDto);
		return "ok";
	}
	
}
