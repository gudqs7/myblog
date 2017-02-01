package com.guddqs.blog.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class ExceptionResover implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest req, HttpServletResponse resp, Object target,
			Exception ex) {

		ModelAndView mv = new ModelAndView();

		mv.addObject("message", ex.getMessage());

		mv.setViewName("faild");

		return mv;
	}

}
