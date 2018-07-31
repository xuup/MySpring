package com.coco.util;

import java.util.List;


public class BaseGridVo {
	
	/** 总页数 */
	private long total = 0;
	/** 当前页 */
	private int page = 1;
	/** 总记录数 */
	private long records = 0;
	/** 计算后的每页显示行数 */
	private int length = 0;
	/** 分页查询开始的记录号 */
	private int begin = 0;
	/** 排序的字段 */
	private String sidx;
	/** 排序方法desc/asc */
	private String sord;
	/** 操作类型 */
	private String oper;
	/** 列表数据 */
	private List rows;


	public void setRows(List rows) {
		this.rows = rows;
	}

	public List getRows() {
		return rows;
	}


	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public long getRecords() {
		return records;
	}

	public void setRecords(long records) {
		this.records = records;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}
}
