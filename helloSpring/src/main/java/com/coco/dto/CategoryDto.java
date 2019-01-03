package com.coco.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class CategoryDto implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 922136741588490750L;
	

	private int categoryId;
	
	private String categoryName;
	
	private int categoryOrder;
	
}
