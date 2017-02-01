<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客列表</title>
</head>
<body>
	<%@include file="/common/admintop.jsp" %>
	<c:if test="${mlist==null }">
		<c:redirect url="/message/list.do"/>
	</c:if>
	
	<c:if test="${!empty mlist }">
		<table width='50%' cellpadding="7" cellspacing="0" border="1" align="center">
			<tr bgcolor="white">
				<th>编号</th>
				<th>留言人</th>
				<th>ip</th>
				<th>内容</th>
				<th>回复</th>
				<th>留言时间</th>
				<th>操作</th>
			</tr>
			
			<c:forEach items="${mlist }" var="m">
				<tr>
					<td>${m.id }</td>
					<td>${m.name }</td>
					<td>${m.ip }</td>
					<td>
						<c:if test="${m.content.length()<=10 }">${m.content }</c:if>
						<c:if test="${m.content.length()>10 }">${m.content.substring(0,10) }......</c:if>
					</td>
					<td>${m.reply }</td>
					<td><fmt:formatDate value="${m.leavedate }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
					<td>
						<input type="button" onclick="location.href='${pageContext.request.contextPath }/message/read.do?id=${m.id }'" value="修改">
						<input type="button" onclick="location.href='${pageContext.request.contextPath }/message/delete.do?id=${m.id }';" value="删除">
					</td>
				</tr>
			</c:forEach>
			
		</table>
		<div align="center">
			<a href="${pageContext.request.contextPath }/message/list.do?pageNo=${pager.currentPage-1}">上一页</a>
			[${pager.currentPage }/${pager.totalCount}]
			<a href="${pageContext.request.contextPath }/message/list.do?pageNo=${pager.currentPage+1}">下一页</a>
		</div>
	</c:if>
	
	<c:if test="${empty mlist }">
		<div align="center">数据库没有数据!</div>
	</c:if>
	
</body>
</html>
