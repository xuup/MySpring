package com.coco.dao;

import java.util.List;

import com.coco.dto.ArticleDto;

public interface ArticleDao {
	
	public List<ArticleDto> selectArticle(ArticleDto articleDto);
	
	public int countArticle(ArticleDto articleDto);
	
	public void saveArticle(ArticleDto articleDto);
	
	public ArticleDto selectArticleById(int id);

}
