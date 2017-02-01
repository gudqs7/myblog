package com.guddqs.blog.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Repository
public class LoggerIntercept implements HandlerInterceptor {

	private final Logger logger = Logger.getLogger(LoggerIntercept.class);

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object target, Exception ex)
			throws Exception {

		if (ex != null) {
			logger.error(ex.getMessage()+"其他错误信息(可能没有):"+req.getAttribute("message"));
		}

	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object target, ModelAndView mv)
			throws Exception {
		

	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object target) throws Exception {
		boolean flag=true;
		if (	req.getRequestURI().indexOf("list") != -1
				|| req.getRequestURI().indexOf("read") != -1
				|| req.getRequestURI().indexOf("ready") != -1
				|| req.getRequestURI().indexOf("update") != -1
				|| req.getRequestURI().indexOf("delete") != -1) {
			
			if(req.getSession().getAttribute("user")==null){
				flag=false;
			}
		}
		return flag;
	}

}

