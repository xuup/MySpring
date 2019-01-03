package com.coco.service;

import com.coco.dto.ArticleDto;
import com.coco.dto.ArticleVo;
import com.coco.dto.ResultVo;

public interface ArticleService {
	
	public ResultVo<ArticleVo> selectArticle(ArticleDto articleDto);
	
	public void saveArticle(ArticleDto articleDto);
	
	public ArticleDto selectArticleById(int id);
}
