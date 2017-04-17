package com.entity;

public class Page {
	private int pageIndex;// 当前页
	private int pageSize = 3;// 每页数据条数
	private int count;// 总页数
	private int datas;// 总条数

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCount() {
		return count;
	}

	public void setCount() {
		if (datas >= pageSize) {
			if (datas % pageSize == 0) {
				count = datas / pageSize;
			} else {
				count = datas / pageSize + 1;
			}
		} else {
			count = 1;
		}
	}

	public int getDatas() {
		return datas;
	}

	public void setDatas(int datas) {
		this.datas = datas;
	}

}
