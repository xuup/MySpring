package com.coco.util;

import java.util.List;

public class QueryResult<T> {

	
	/**总记录数*/
	private long count;
	
	/**分页结果*/
	private List<T> results;

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public List<T> getResults() {
		return results;
	}

	public void setResults(List<T> results) {
		this.results = results;
	}
	

}
