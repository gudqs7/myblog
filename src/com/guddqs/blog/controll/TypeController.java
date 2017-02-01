package com.guddqs.blog.controll;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guddqs.blog.dao.TypeMapper;
import com.guddqs.blog.entity.Type;

@Controller
@RequestMapping("/type")
public class TypeController {

	@Autowired
	private TypeMapper dao;

	@RequestMapping("/queryAll")
	public ModelAndView queryAll() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");
		List<Type> alist = dao.selectByExample(null);
		if (alist != null) {
			mv.addObject("alist", alist);
			mv.setViewName("index");
		}
		return mv;
	}

	@RequestMapping("/list")
	public ModelAndView list(Integer pageNo) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		if (pageNo == null)
			pageNo = 1;

		List<Type> tlist = dao.selectByExample(null);

		if (tlist != null) {
			mv.setViewName("admin/type_list");
			mv.addObject("tlist", tlist);
		} else {
			mv.addObject("message", "添加文章失敗");
		}
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(Type type) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		int iret = dao.insert(type);
		if (iret > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "添加文章分类失敗");
		}
		return mv;
	}

	@RequestMapping("/read")
	public ModelAndView read(Integer id) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		Type type = dao.selectByPrimaryKey(id);
		if (type != null) {
			mv.addObject("type", type);
			mv.setViewName("admin/editType");
		} else {
			mv.addObject("message", "操作失敗");
		}
		return mv;
	}

	@RequestMapping("/ready")
	public ModelAndView ready() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/editType");
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
			mv.addObject("message", "删除文章失敗");
		}
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(Type type) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		int iret = dao.updateByPrimaryKeySelective(type);
		if (iret > 0) {

			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "修改文章分类失敗");
		}
		return mv;
	}

}
