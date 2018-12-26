package com.blog.controller.base;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.dto.ArticleDto;
import com.blog.dto.LabelDto;
import com.blog.service.ArticleService;
import com.google.gson.Gson;

@Controller
@RequestMapping("article")
public class BaseController {
	
	Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	@Autowired
	private ArticleService articleService;
	
	private Gson gosn;
	
	@RequestMapping("init")
	public String index(ModelMap map){
		//获取文章总数
		int total = articleService.getTotal();
		map.put("total", total);
		map.put("curentPage", 0);
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("getArticle")
	public List<ArticleDto> getArticle(String offSet, String limit){
		gosn = new Gson();
		logger.info("offset: {},limit: {}",offSet, limit);
		List<ArticleDto> res = articleService.getArticle(offSet, limit);
		logger.info("res.........{}", gosn.toJson(res));
		return res;
	}
	
	
	@ResponseBody
	@RequestMapping("getLabels")
	public List<LabelDto> getLabels(){
		List<LabelDto> res = articleService.getLabels();
		return res;
	}
	
	
	@ResponseBody
	@RequestMapping("getHotArticle")
	public List<ArticleDto> getHotArticle(){
		List<ArticleDto> res = articleService.getHotArticle();
		return res;
	}
	
	
	@RequestMapping("detail")
	public String detail(int articleId, ModelMap map){
		logger.info("articleId:  {}",articleId);
		//获取文章总数
		ArticleDto articleDto = articleService.selectArticleById(Integer.valueOf(articleId));
		map.put("article", articleDto);
		return "content/detail";
	}
	
}
