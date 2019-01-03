package com.coco.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coco.dao.ArticleDao;
import com.coco.dto.ArticleDto;
import com.coco.dto.ArticleVo;
import com.coco.dto.ResultVo;
import com.coco.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService{

	
	@Autowired
	private ArticleDao articleDao;
	
	@Resource
	private Mapper mapper;
	
	public void saveArticle(ArticleDto articleDto) {
		articleDao.saveArticle(articleDto);
	}

	public ResultVo<ArticleVo> selectArticle(ArticleDto articleDto) {
		List<ArticleDto> list = articleDao.selectArticle(articleDto);
		int totals = articleDao.countArticle(articleDto);
		
		ResultVo<ArticleVo> rs = new ResultVo<ArticleVo>();
		List<ArticleVo> rslist = new ArrayList<ArticleVo>();
		for(ArticleDto dto: list){
			ArticleVo vo = mapper.map(dto, ArticleVo.class);
			rslist.add(vo);
		}
		
		rs.setRows(rslist);
		rs.setTotal(totals);
		
		return rs;
	}
	
	
	public ArticleDto selectArticleById(int id){
		return articleDao.selectArticleById(id);
	}

}
