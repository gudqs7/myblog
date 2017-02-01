<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/ued/third-party/SyntaxHighlighter/shCoreDefault.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/ued/third-party/SyntaxHighlighter/shCore.js"></script>
<script> 
//SyntaxHighlighter.highlight();
//SyntaxHighlighter.all(); 
</script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ued/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ued/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ued/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	var UEDITOR_HOME_URL = "${pageContext.request.contextPath }/ued/";
</script>
<c:if test="${article==null }"><c:set var="opr" value="新增"/><c:set var="action" value="add"/></c:if>
<c:if test="${article!=null }"><c:set var="opr" value="修改"/><c:set var="action" value="update"/></c:if>
<title>博客${opr}页面</title>
</head>
<body align='center'>
	<form name="myform" action="${pageContext.request.contextPath }/article/${action}.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${article.id }">
		<table width='70%' cellpadding="7" cellspacing="0" border="1" align="center">
			
			<tr>
				<th>标题</th>
				<td align='left'><input name="title" value="${article.title }"></td>
			</tr>
			<tr>
				<th>内容</th>
				<td align='left'>
				<div style='display:none' id='old'>${article.content }</div>				
				<script id="editor" type="text/plain" style="width:824px;"></script>
				<textarea id="content" name="content" style="display: none;"></textarea></td>
			</tr>
			<tr>
				<th>博客分类</th>
				<td align='left'>
					<select name="typeid">
						<c:forEach items="${typelist }" var="type">
							<option<c:if test="${type.id==article.typeid }"> selected="selected" </c:if> value="${type.id }">${type.name }</option>
						</c:forEach>
					</select>
					<a target="_blank" href="${pageContext.request.contextPath }/type/list.do">编辑分类</a>
				</td>
			</tr>
			<tr>
				<th>图片</th>
				<td align='left'>
					<c:if test="${article!=null and article.pic!=null }">
						<img width='200px' src="/pic/${article.pic }" /><br/>
					</c:if>
					<input name="photo" type="file">
				</td>
			</tr>
			
		</table>
<div align='center' style='margin:7px;'>
		<input value="${opr }" type="submit" >
		<input value="返回" type="button" onclick="location.href='${pageContext.request.contextPath}/article/list.do'">
</div>
	</form>
<script type="text/javascript">
 
function selectText(element) {
    var text = document.getElementById(element);
    if (document.body.createTextRange) {
        var range = document.body.createTextRange();
        range.moveToElementText(text);
        range.select();
    } else if (window.getSelection) {
        var selection = window.getSelection();
        var range = document.createRange();
        range.selectNodeContents(text);
        selection.removeAllRanges();
        selection.addRange(range);
        /*if(selection.setBaseAndExtent){
            selection.setBaseAndExtent(text, 0, text, 1);
        }*/
    } else {
        //alert("none");
    }
}
</script>
<script type="text/javascript">
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('editor', {
			autoHeight : true
		});	
		
		document.myform.onsubmit=function(){
		//function getAllHtml(){
			//alert(UE.getEditor('editor').getContent());
			document.getElementById("content").value=UE.getEditor('editor').getContent();
			//alert(document.getElementById("content").value);
			if(document.getElementById("content").value.length>10000) {alert("字数长度超过限制");return false};
			return true;
		}
	UE.getEditor('editor').ready(function(){
    		UE.getEditor('editor').setContent($("#old").html());
	})
	
		
	</script>
</body>
</html>
