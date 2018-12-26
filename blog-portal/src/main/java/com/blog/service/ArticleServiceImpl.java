package com.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.ArticleDao;
import com.blog.dao.LabelDao;
import com.blog.dto.ArticleDto;
import com.blog.dto.LabelDto;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	private ArticleDao articleDao;
	
	@Autowired
	private LabelDao labelDao;
	
	public List<ArticleDto> getArticle(String offSet, String limit) {
		ArticleDto dto = new ArticleDto();
		dto.setOffset(Integer.valueOf(offSet));
		dto.setLimit(Integer.valueOf(limit));
		
		List<ArticleDto> res = articleDao.selectArticle(dto);
		
		return res;
	}
	
	
	
	public int getTotal() {
		int total = articleDao.countArticle();
		return total;
	}
	
	
	public List<LabelDto> getLabels(){
		List<LabelDto> list = labelDao.getLabels();
		return list;
	}
	
	
	public List<ArticleDto> getHotArticle(){
		List<ArticleDto> list = articleDao.selectHotArticle();
		return list;
	}
	
	public ArticleDto selectArticleById(int id){
		ArticleDto articleDto = null;
		articleDto = articleDao.selectArticleById(id);
		return articleDto;
	}

}
