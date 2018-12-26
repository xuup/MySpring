package com.blog.service;

import java.util.List;

import com.blog.dto.ArticleDto;
import com.blog.dto.LabelDto;

public interface ArticleService {
	
	public List<ArticleDto> getArticle(String offSet, String limit);
	
	public int getTotal();
	
	public List<LabelDto> getLabels();
	
	public List<ArticleDto> getHotArticle();
	
	public ArticleDto selectArticleById(int id);
}
