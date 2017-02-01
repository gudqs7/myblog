package com.guddqs.blog.controll;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guddqs.blog.dao.ArticleMapper;
import com.guddqs.blog.dao.MessageMapper;
import com.guddqs.blog.entity.Article;
import com.guddqs.blog.entity.ArticleExample;
import com.guddqs.blog.entity.Message;
import com.guddqs.blog.entity.Pager;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageMapper dao;
	
	@Autowired
	private ArticleMapper adao;
	
	@RequestMapping("/show")
	public ModelAndView getArticle(Integer id) {
		int totalRowCount = adao.countByExample(null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		ArticleExample example = new ArticleExample();

		example = new ArticleExample();
		example.setOrderByClause("looktime desc");
		example.createCriteria().andStateEqualTo(1);
		List<Article> hotlist = adao.selectByExample(example, new Pager(9, 1, totalRowCount));
		example = new ArticleExample();
		example.setOrderByClause("pubdate desc");
		example.createCriteria().andStateEqualTo(1);
		List<Article> newlist = adao.selectByExample(example, new Pager(9, 1, totalRowCount));

		if ( hotlist != null) {
			mv.addObject("hotlist", hotlist);
			mv.addObject("newlist", newlist);

			mv.setViewName("message");
		} else {
			mv.addObject("message", "阅读文章失敗");
		}
		return mv;
	}
	
	@RequestMapping("/list")
	public ModelAndView list(Integer pageNo) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		if (pageNo == null)
			pageNo = 1;

		Pager pager=new Pager(10, pageNo, dao.countByExample(null));
		List<Message> mlist = dao.selectByExample(null,pager);

		if (mlist != null) {
			mv.setViewName("admin/messge_list");
			mv.addObject("pager",pager);
			mv.addObject("mlist", mlist);
		} else {
			mv.addObject("message", "浏览留言失敗");
		}
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(Message message) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		message.init();
		int iret = dao.insert(message);
		if (iret > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "添加留言失敗");
		}
		return mv;
	}

	@RequestMapping("/read")
	public ModelAndView read(Integer id) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		Message message = dao.selectByPrimaryKey(id);
		if (message != null) {
			mv.addObject("message", message);
			mv.setViewName("admin/editMessage");
		} else {
			mv.addObject("message", "操作失敗");
		}
		return mv;
	}

	@RequestMapping("/ready")
	public ModelAndView ready() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/editMessage");
		return mv;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(Integer id) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		int iret = dao.deleteByPrimaryKey(id);
		if (iret > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "删除留言失敗");
		}
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(Message message) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		int iret = dao.updateByPrimaryKeySelective(message);
		if (iret > 0) {

			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "修改留言失敗");
		}
		return mv;
	}
	
}
