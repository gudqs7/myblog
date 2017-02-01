package com.guddqs.blog.controll;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.guddqs.blog.dao.BrokenMapper;
import com.guddqs.blog.entity.Broken;
import com.guddqs.blog.entity.BrokenExample;
import com.guddqs.blog.entity.Pager;

@Controller
@RequestMapping("/broken")
public class BrokenController {
	
	@Autowired
	private BrokenMapper dao;
	
	@RequestMapping("/serach")
	public ModelAndView getArticleByTypeId( Integer pageNo) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		if (pageNo == null) {
			pageNo = 1;
		}
		
		BrokenExample example=new BrokenExample();
		example.setOrderByClause("pubdate desc");
		Pager pager = new Pager(14, pageNo, dao.countByExample(example));
		List<Broken> blist = dao.selectByExample(example, pager);
		if (blist != null) {
			mv.addObject("blist", blist);
			mv.addObject("pager", pager);
			mv.setViewName("moodlist");
		} else {
			mv.addObject("message", "读取数据失败!");
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
		List<Broken> blist = dao.selectByExample(null,pager);

		if (blist != null) {
			mv.setViewName("admin/broken_list");
			mv.addObject("pager",pager);
			mv.addObject("blist", blist);
		} else {
			mv.addObject("message", "浏览碎语失敗");
		}
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(Broken broken,HttpServletRequest req,MultipartFile photo) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");
		
		broken.init();
		
		if(photo!=null&&!photo.getOriginalFilename().isEmpty()){
			String fileName=photo.getOriginalFilename();
			String path="c:/pic";
			fileName=UUID.randomUUID()+fileName.substring(fileName.indexOf('.'));
			File newfile=new File(path,fileName);
			if(!newfile.exists())
				newfile.createNewFile();
			photo.transferTo(newfile);
			broken.setPic(fileName);
		}
		
		int iret = dao.insertSelective(broken);
		if (iret > 0) {
			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "添加碎语失敗");
		}
		return mv;
	}

	@RequestMapping("/read")
	public ModelAndView read(Integer id) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		Broken broken = dao.selectByPrimaryKey(id);
		if (broken != null) {
			mv.addObject("broken", broken);
			mv.setViewName("admin/editBroken");
		} else {
			mv.addObject("message", "操作失敗");
		}
		return mv;
	}

	@RequestMapping("/ready")
	public ModelAndView ready() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/editBroken");
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
			mv.addObject("message", "删除碎语失敗");
		}
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(Broken broken,HttpServletRequest req,MultipartFile photo) throws IOException {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("faild");

		if(photo!=null&&!photo.getOriginalFilename().isEmpty()){
			String fileName=photo.getOriginalFilename();
			System.out.println(fileName);
			String path="c:/pic";
			fileName=UUID.randomUUID()+fileName.substring(fileName.indexOf('.'));
			File newfile=new File(path,fileName);
			if(!newfile.exists())
				newfile.createNewFile();
			photo.transferTo(newfile);
			broken.setPic(fileName);
		}
		
		int iret = dao.updateByPrimaryKeySelective(broken);
		if (iret > 0) {

			mv.setViewName("redirect:list.do");
		} else {
			mv.addObject("message", "修改碎语失敗");
		}
		return mv;
	}
}
