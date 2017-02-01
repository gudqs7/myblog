<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test="${message==null }"><c:set var="opr" value="新增"/><c:set var="action" value="add"/></c:if>
<c:if test="${message!=null }"><c:set var="opr" value="修改"/><c:set var="action" value="update"/></c:if>
<title>留言${opr}页面</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/message/${action}.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${message.id }">
		<table width='50%' cellpadding="7" cellspacing="0" border="1" align="center">
			
			<tr>
				<th>发言人</th>
				<td>${message.name }+(${message.ip })</td>
			</tr>
			<tr>
				<th>内容</th>
				<td>
					<textarea rows="5" cols="53">${message.content }</textarea>
				</td>
			</tr>
			<tr>
				<th>回复</th>
				<td>
					<textarea name="reply" rows="5" cols="53" >${message.reply }</textarea>
				</td>
			</tr>
			
		</table>
<div align='center'>
		<input value="${opr }" type="submit" >
		<input value="返回" type="button" onclick="location.href='${pageContext.request.contextPath}/message/list.do'">
</div>
	</form>
</body>
</html>
