package com.blog.dao;

import java.util.List;

import com.blog.dto.ArticleDto;


public interface ArticleDao {
	
	
	public List<ArticleDto> selectArticle(ArticleDto articleDto);
	
	public int countArticle();
	
	public void saveArticle(ArticleDto articleDto);
	
	public ArticleDto selectArticleById(int id);
	
	public List<ArticleDto> selectHotArticle();

}
