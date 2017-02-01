package com.guddqs.blog.entity;

public class Pager {
	private Integer pageSize;
	private Integer currentPage;
	private Integer totalCount;
	private Integer totalRowCount;

	public Integer getPageSize() {
		return pageSize;
	}

	public Pager() {
		super();
	}

	public Pager(Integer pageSize, Integer currentPage, Integer totalRowCount) {
		super();
		this.pageSize = pageSize;
		this.totalRowCount = totalRowCount;
		this.totalCount = this.totalRowCount % pageSize == 0//
				? this.totalRowCount / pageSize //
				: this.totalRowCount / pageSize + 1;
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > this.totalCount) {
			currentPage = this.totalCount;
		}
		this.currentPage = currentPage;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public Integer getTotalRowCount() {
		return totalRowCount;
	}
}

