<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>碎言碎语列表</title>
</head>
<body>
	<%@include file="/common/admintop.jsp" %>
	<c:if test="${blist==null }">
		<c:redirect url="/broken/list.do"/>
	</c:if>
	
	<c:if test="${!empty blist }">
		<table width='70%' cellpadding="7" cellspacing="0" border="1" align="center">
			<tr bgcolor="white">
				<th>编号</th>
				<th>内容</th>
				<th>发布时间</th>
				<th>操作</th>
			</tr>
			
			<c:forEach items="${blist }" var="b">
				<tr>
					<td align="center">${b.id }</td>
					<td>
						<c:if test="${b.content.length()<=31 }"><c:out value="${b.content }" escapeXml="true"/></c:if>
						<c:if test="${b.content.length()>31 }"><c:out value="${b.content.substring(0,31) }" escapeXml="true"/>......</c:if>
					</td>
					<td><fmt:formatDate value="${b.pubdate }" pattern="yyyy-MM-dd"/></td>
					<td align="center">
						<input style="background: #f60; font-size:18px; color:white; padding: 3px 12px;" type="button" onclick="location.href='${pageContext.request.contextPath }/broken/read.do?id=${b.id }';" value="修改">
						<input style="background: red; font-size:18px; color:white; padding: 3px 12px;" type="button" onclick="location.href='${pageContext.request.contextPath }/broken/delete.do?id=${b.id }'" value="删除">
					</td>
				</tr>
			</c:forEach>
			
		</table>
		<div align="center">
			<a href="${pageContext.request.contextPath }/broken/list.do?pageNo=${pager.currentPage-1}">上一页</a>
			[${pager.currentPage }/${pager.totalCount}]
			<a href="${pageContext.request.contextPath }/broken/list.do?pageNo=${pager.currentPage+1}">下一页</a>
		</div>
	</c:if>
	
	<c:if test="${empty blist }">
		数据库没有数据!
	</c:if>
	<div align="center">
		<a href="${pageContext.request.contextPath }/broken/ready.do">新增</a>
	</div>
</body>
</html>
