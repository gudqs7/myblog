<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理首页</title>
</head>
<body>
	
	<div align="center">
		
		<ul style="color: white; width: 500px; margin: 30px auto; padding: 20px;">
			<li style="list-style: none; line-height: 25px; font-size: 16px; background: orange;margin: 10px auto; padding: 4px 7px;" >
			<a style="text-decoration:none; color: white;" href="${pageContext.request.contextPath }/article/list.do">博客管理</a></li>
			<li style="list-style: none; line-height: 25px; font-size: 16px; background: orange;margin: 10px auto; padding: 4px 7px;" >
			<a style="text-decoration:none;color: white;" href="${pageContext.request.contextPath }/type/list.do">博客分类管理</a></li>
			<li style="list-style: none; line-height: 25px; font-size: 16px; background: orange;margin: 10px auto; padding: 4px 7px;" >
			<a style="text-decoration:none;color: white;" href="${pageContext.request.contextPath }/broken/list.do">碎言碎语管理</a></li>
			<li style="list-style: none; line-height: 25px; font-size: 16px; background: orange;margin: 10px auto; padding: 4px 7px;" >
			<a style="text-decoration:none;color: white;" href="${pageContext.request.contextPath }/message/list.do">留言管理</a></li>
			<li style="list-style: none; line-height: 25px; font-size: 16px; background: orange;margin: 10px auto; padding: 4px 7px;" >
			<a style="text-decoration:none;color: white;" href="${pageContext.request.contextPath }/">返回首页</a></li>
		</ul>
		
	</div>
	
	
</body>
</html>