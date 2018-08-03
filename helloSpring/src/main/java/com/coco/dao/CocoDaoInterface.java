package com.coco.dao;

import java.util.List;

import com.coco.dto.CocoDto;
import com.coco.dto.CocoVo;

public interface CocoDaoInterface {
	public int insert(CocoDto coco);
	
	public List<CocoDto> list(CocoDto coco);
	
	public int getCount(CocoDto coco);
	
	public CocoDto selectById(String id);
	
	public void updateById(CocoDto cocoDto);
	
	public void deleteById(String id);
}
