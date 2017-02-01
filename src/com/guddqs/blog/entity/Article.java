package com.guddqs.blog.entity;

import java.util.Date;

public class Article {
	private Integer id;

	private String title;

	private Type type;

	private Integer state;

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Article(Integer id2, Integer time) {
		this.id = id2;
		this.looktime = time;
	}

	public Article() {
		// TODO Auto-generated constructor stub
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	private String content;

	private String content2;

	private Date pubdate;

	private String author;

	private Integer looktime;

	private Integer love;

	private String pic;

	private Integer typeid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getContent() {
		return content;
	}

	public String getContent2() {
		String rs = "yuanlai";
		try {
			rs = content.replaceAll("<[^>]*? ?[^>]*>|</[^>]*?>|<[^>]*?/>", "");
			rs = rs.replaceAll("&nbsp;|&ensp;", "  ");
			rs = rs.replaceAll("&quot;", ";");
			rs = rs.replaceAll("&gt;", ">");
			rs = rs.replaceAll("&lt;", "<");
			// System.out.println(rs);
		} catch (Exception ex) {
			System.out.println("原来是这里出错了---"+ex.getMessage());
		}
		return rs;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public void setContent2(String content) {
		this.content2 = content2 == null ? null : content.trim();
	}

	public Date getPubdate() {
		return pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author == null ? null : author.trim();
	}

	public Integer getLooktime() {
		return looktime;
	}

	public void setLooktime(Integer looktime) {
		this.looktime = looktime;
	}

	public Integer getLove() {
		return love;
	}

	public void setLove(Integer love) {
		this.love = love;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic == null ? null : pic.trim();
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public void init() {
		this.pubdate = new Date();
		this.looktime = 0;
		this.love = 0;
		this.author = "Guddqs";
		this.state = 1;
	}
}