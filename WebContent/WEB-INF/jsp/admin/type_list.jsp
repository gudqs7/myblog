<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客分类列表</title>
</head>
<body>
	<%@include file="/common/admintop.jsp" %>
	<c:if test="${tlist==null }">
		<c:redirect url="/type/list.do"/>
	</c:if>
	
	<c:if test="${!empty tlist }">
		<table width='70%' cellpadding="7" cellspacing="0" border="1" align="center">
			<tr bgcolor="white">
				<th>编号</th>
				<th>名称</th>
				<th>操作</th>
			</tr>
			
			<c:forEach items="${tlist }" var="t">
				<tr>
					<td align="center">${t.id }</td>
					<td  align="center">${t.name }</td>
					<td width="150px">
						<input style="background: #f60; font-size:18px; color:white; padding: 3px 12px;" type="button" onclick="location.href='${pageContext.request.contextPath }/type/read.do?id=${t.id }'" value="修改">
						<input style="background: red; font-size:18px; color:white; padding: 3px 12px;" type="button" onclick="location.href='${pageContext.request.contextPath }/type/delete.do?id=${t.id }';" value="删除">
					</td>
				</tr>
			</c:forEach>
			
		</table>
	</c:if>
	
	<c:if test="${empty tlist }">
		<div align="center">数据库没有数据!</div>
	</c:if>
	<div align="center">
		<br/>
		<a href="${pageContext.request.contextPath }/type/ready.do">新增</a>
	</div>
	
</body>
</html>
