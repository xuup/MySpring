package com.coco.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.dozer.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coco.controller.common.BaseController;
import com.coco.dto.ArticleDto;
import com.coco.dto.ArticleVo;
import com.coco.dto.ResultVo;
import com.coco.service.ArticleService;
import com.google.gson.Gson;


@Controller
@RequestMapping("article")
public class ArticleController extends BaseController{
	
	public static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	private Gson gson = new Gson();
	
	@Resource
	private Mapper mapper;
	
	@Autowired
	private ArticleService articleService;
	
	
	@RequestMapping("listArticle")
	public String listArticle(){
		return "/article/listArticle";
	}
	
	
	@RequestMapping("addArticle")
	public String addArticle(){
		return "/article/addArticle";
	}
	
	
	@RequestMapping("searchArticle")
	@ResponseBody
	public ResultVo<ArticleVo> searchArticle(ArticleVo articleVo){
		logger.info(gson.toJson(articleVo));
		ArticleDto articleDto = mapper.map(articleVo, ArticleDto.class);
		ResultVo<ArticleVo> result = articleService.selectArticle(articleDto);
		return result;
	}
	
	
	@RequestMapping("saveArticle")
	@ResponseBody
	public String saveArticle(ArticleVo articleVo){
		ArticleDto articleDto = mapper.map(articleVo, ArticleDto.class);
		//设置文章的创建时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		String createTime = sdf.format(date);
		articleDto.setCreateTime(createTime);
		articleService.saveArticle(articleDto);
		return "ok";
	}
	
	
	@RequestMapping("editViewById")
	public String editViewById(int id,boolean isEdit, ModelMap map){
		logger.info("id:"+ id);
		ArticleDto  articleDto = articleService.selectArticleById(id);
		map.put("article", articleDto);
		if(isEdit){
			return "/article/editArticle";
		}else{
			return "/article/viewArticle";
		}
		
	}
	
}
