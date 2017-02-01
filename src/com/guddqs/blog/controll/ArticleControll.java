package com.guddqs.blog.controll;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.guddqs.blog.dao.ArticleMapper;
import com.guddqs.blog.dao.TypeMapper;
import com.guddqs.blog.entity.Article;
import com.guddqs.blog.entity.ArticleExample;
import com.guddqs.blog.entity.Pager;
import com.guddqs.blog.entity.Type;
import com.guddqs.blog.entity.TypeExample;

@Controller
@RequestMapping("/article")
public class ArticleControll {

	@Autowired
	private ArticleMapper dao;

	@Autowired
	private TypeMapper tdao;

	@RequestMapping("/queryAll")
	public ModelAndView queryAll() {
		int totalRowCount = dao.countByExample(null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");
		ArticleExample example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		List<Article> alist = dao.selectByExample(example, new Pager(4, 1, totalRowCount));
		example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		example.setOrderByClause("looktime desc");
		List<Article> hotlist = dao.selectByExample(example, new Pager(9, 1, totalRowCount));
		example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		example.setOrderByClause("pubdate desc");
		List<Article> newlist = dao.selectByExample(example, new Pager(9, 1, totalRowCount));

		if (alist != null) {
			mv.addObject("alist", alist);
			mv.addObject("hotlist", hotlist);
			mv.addObject("newlist", newlist);
			mv.setViewName("index");
		}
		return mv;
	}

	@RequestMapping("/getArticle")
	public ModelAndView getArticle(Article article, HttpServletRequest request) {
		int totalRowCount = dao.countByExample(null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		article = dao.selectByPrimaryKey(article.getId());

		if(article==null||article.getState().equals(0)){
			mv.addObject("message", "文章不存在或已删除!");
			return mv;
		}
		
		boolean isSameIp = true;

		String nowip = request.getRemoteAddr() + article.getId();

		// System.out.println(nowip);

		Object ip = request.getSession().getAttribute("ip" + article.getId());

		if (ip == null) {
			request.getSession().setAttribute("ip" + article.getId(), nowip);
			Logger.getLogger("IP").warn("有一个ip访问了你的文章,ip加文章id:" + nowip);
		} else {
			if (ip.toString().equals(nowip)) {
				isSameIp = false;
			}
		}

		if (isSameIp) {
			article.setLooktime(article.getLooktime() + 1);
			Integer time = article.getLooktime();
			dao.updateByPrimaryKeySelective(new Article(article.getId(), time));
		}

		ArticleExample example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		example.createCriteria().andTypeidEqualTo(article.getTypeid());
		List<Article> alist = dao.selectByExample(example, new Pager(5, 1, totalRowCount));
		example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		example.setOrderByClause("looktime desc");
		List<Article> hotlist = dao.selectByExample(example, new Pager(9, 1, totalRowCount));
		example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		example.setOrderByClause("pubdate desc");
		List<Article> newlist = dao.selectByExample(example, new Pager(9, 1, totalRowCount));

		for (Article art : alist) {
			if (art.getId().equals(article.getId())) {
				alist.remove(art);
				break;
			}
		}

		if (article != null && hotlist != null) {
			mv.addObject("article", article);
			mv.addObject("alist", alist);
			mv.addObject("hotlist", hotlist);
			mv.addObject("newlist", newlist);

			mv.setViewName("view");
		} else {
			mv.addObject("message", "阅读文章失敗");
		}
		return mv;
	}

	@RequestMapping("/serach")
	public ModelAndView getArticleByTypeId(Integer id, String data, Integer pageNo) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		if (id == null) {
			id = 0;
		}

		if (pageNo == null) {
			pageNo = 1;
		}

		ArticleExample example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		if (id > 0)
			example.createCriteria().andTypeidEqualTo(id);

		if (data != null && !data.isEmpty()) {
			example.or().andTitleLike("%" + data + "%");
			example.or().andContentLike("%" + data + "%");
		}
		TypeExample t = new TypeExample();
		t.createCriteria().andNameLike("%" + data + "%");
		List<Type> tlist = tdao.selectByExample(t);

		List<Integer> tids = new ArrayList<>();
		for (Type te : tlist) {
			tids.add(te.getId());
		}
		if (tids.size() > 0)
			example.or().andTypeidIn(tids);

		int totalRowCount = dao.countByExample(null);

		Pager pager = new Pager(9, pageNo, dao.countByExample(example));
		List<Article> alist = dao.selectByExample(example, pager);
		example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		example.setOrderByClause("looktime desc");
		List<Article> hotlist = dao.selectByExample(example, new Pager(9, 1, totalRowCount));
		example = new ArticleExample();
		example.createCriteria().andStateEqualTo(1);
		example.setOrderByClause("pubdate desc");
		List<Article> newlist = dao.selectByExample(example, new Pager(9, 1, totalRowCount));
		if (alist != null) {
			mv.addObject("alist", alist);
			mv.addObject("searchdata", data);
			mv.addObject("hotlist", hotlist);
			mv.addObject("newlist", newlist);
			mv.addObject("pager", pager);
			mv.addObject("tid", id);
			mv.setViewName("knowledge");
		} else {
			mv.addObject("message", "阅读文章失敗");
		}
		return mv;
	}

	@RequestMapping("/list")
	public ModelAndView list(Integer pageNo, Integer typeid) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		if (pageNo == null)
			pageNo = 1;
		if (typeid == null)
			typeid = 0;

		ArticleExample example = new ArticleExample();
		if (typeid > 0) {
			example.createCriteria().andTypeidEqualTo(typeid);
		}
		example.setOrderByClause("pubdate desc");
		
		Pager pager = new Pager(10, pageNo, dao.countByExample(example));
		List<Article> alist = dao.selectByExample(example, pager);

		if (alist != null) {
			mv.setViewName("admin/article_list");
			mv.addObject("pager", pager);
			mv.addObject("alist", alist);
		} else {
			mv.addObject("message", "浏览文章失敗");
		}
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest req, Article article, MultipartFile photo) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");
		article.init();

		if (photo != null && !photo.getOriginalFilename().isEmpty()) {
			String fileName = photo.getOriginalFilename();
			String path = "c:/pic";
			fileName = UUID.randomUUID() + fileName.substring(fileName.indexOf('.'));
			File newfile = new File(path, fileName);
			if (!newfile.exists())
				newfile.createNewFile();
			photo.transferTo(newfile);
			article.setPic(fileName);
		}
		
		int iret = dao.insert(article);
		if (iret > 0) {

			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "添加文章失敗");
		}
		return mv;
	}

	@RequestMapping("/read")
	public ModelAndView read(Integer id) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		List<Type> typelist = tdao.selectByExample(null);
		Article article = dao.selectByPrimaryKey(id);
		if (article != null) {
			mv.addObject("article", article);
			mv.addObject("typelist", typelist);
			mv.setViewName("admin/editArticle");
		} else {
			mv.addObject("message", "操作失敗");
		}
		return mv;
	}

	@RequestMapping("/ready")
	public ModelAndView ready() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		List<Type> typelist = tdao.selectByExample(null);

		if (typelist != null) {
			mv.addObject("typelist", typelist);
			mv.setViewName("admin/editArticle");
		} else {
			mv.addObject("message", "读取数据错误!");
		}
		return mv;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(Integer id) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		Article article = new Article();
		article.setId(id);
		article.setState(0);
		int iret = dao.updateByPrimaryKeySelective(article);
		if (iret > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "删除文章失敗");
		}
		return mv;
	}
	
	@RequestMapping("/realdelete")
	public ModelAndView realdelete(Integer id) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		int iret = dao.deleteByPrimaryKey(id);
		if (iret > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "删除文章失敗");
		}
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest req, Article article, MultipartFile photo) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		if (photo != null && !photo.getOriginalFilename().isEmpty()) {
			String fileName = photo.getOriginalFilename();
			System.out.println(fileName);
			String path = "c:/pic";
			fileName = UUID.randomUUID() + fileName.substring(fileName.indexOf('.'));
			File newfile = new File(path, fileName);
			if (!newfile.exists())
				newfile.createNewFile();
			photo.transferTo(newfile);
			article.setPic(fileName);
		}

		int iret = dao.updateByPrimaryKeySelective(article);
		if (iret > 0) {

			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "修改文章失敗");
		}
		return mv;
	}

	@RequestMapping("/recly")
	public ModelAndView recly(Integer id) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		Article article = new Article();
		article.setId(id);
		article.setState(1);
		int iret = dao.updateByPrimaryKeySelective(article);
		if (iret > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "恢复文章失敗");
		}
		return mv;
	}

}
