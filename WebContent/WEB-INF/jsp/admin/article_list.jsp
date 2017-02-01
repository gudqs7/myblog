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
	
	<c:if test="${alist==null }">
		<c:redirect url="/article/list.do"/>
	</c:if>
	
	<c:if test="${!empty alist }">
		<table width='79%' cellpadding="5" cellspacing="0" border="1" align="center">
			<tr bgcolor="white">
				<th>编号</th>
				<th>标题</th>
				<th>内容</th>
				<th>分类</th>
				<th>浏览数</th>
				<th>喜爱数</th>
				<th>发布时间</th>
				<th>操作</th>
			</tr>
			
			<c:forEach items="${alist }" var="a">
				<tr>
					<td align="center">${a.id }</td>
					<td>
						<c:if test="${a.title.length()<=8 }"><c:out value="${a.title }" escapeXml="true"/></c:if>
						<c:if test="${a.title.length()>8 }"><c:out value="${a.title.substring(0,8) }" escapeXml="true"/>...</c:if>
					</td>
					<td>
						<c:if test="${a.content2.length()<=8 }"><c:out value="${a.content2 }" escapeXml="true"/></c:if>
						<c:if test="${a.content2.length()>8 }"><c:out value="${a.content2.substring(0,8) }" escapeXml="true"/>...</c:if>
					</td>
					<td>${a.type.name }</td>
					<td>${a.looktime }</td>
					<td>${a.love }</td>
					<td><fmt:formatDate value="${a.pubdate }" pattern="yyyy-MM-dd"/> </td>
					<td width="250">
						<input style="background: #f60; font-size:18px; color:white; padding: 3px 12px;" type="button" onclick="location.href='${pageContext.request.contextPath }/article/read.do?id=${a.id }'" value="修改">
						
						<c:if test="${a.state==1||a.state==null }">
							<input style="background: red; font-size:18px; color:white; padding: 3px 12px;" type="button" onclick="location.href='${pageContext.request.contextPath }/article/delete.do?id=${a.id }';" value="删除">
						</c:if>
						
						<c:if test="${a.state==0 }">
							<input style="background: springgreen; font-size:18px; color:white; padding: 3px 12px;" type="button" onclick="location.href='${pageContext.request.contextPath }/article/recly.do?id=${a.id }';" value="恢复">
						</c:if>
						
						<c:if test="${a.state==0 }">
							<input style="background: #111; font-size:18px; color:white; padding: 3px 12px;" type="button" onclick="if(confirm('确认删除（请谨慎操作）？')){if(prompt('确认删除（请谨慎操作）？','Password?')=='guddqs')location.href='${pageContext.request.contextPath }/article/realdelete.do?id=${a.id }';}" value="彻底删除">
						</c:if>
						
						
					</td>
				</tr>
			</c:forEach>
			
		</table>
		<div align="center">
			<a href="${pageContext.request.contextPath }/article/list.do?pageNo=${pager.currentPage-1}">上一页</a>
			[${pager.currentPage }/${pager.totalCount}]
			<a href="${pageContext.request.contextPath }/article/list.do?pageNo=${pager.currentPage+1}">下一页</a>
		</div>
	</c:if>
	
	<c:if test="${empty alist }">
		<div align="center">数据库没有数据!</div>
	</c:if>
	<div align="center">
		<a href="${pageContext.request.contextPath }/article/ready.do">新增</a>
	</div>
	
</body>
</html>
