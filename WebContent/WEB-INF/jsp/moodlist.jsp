<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath }/ued/third-party/SyntaxHighlighter/shCoreDefault.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/ued/third-party/SyntaxHighlighter/shCore.js"></script>
<script> 
//SyntaxHighlighter.highlight();
SyntaxHighlighter.all(); 
</script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?74d41c90ac369258ee3135f94d4735bb";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>碎言碎语</title>
<meta name="keywords" content="心情,javaee,j2ee" />
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/mood.css" rel="stylesheet">
<!-- 返回顶部调用 begin -->
<link href="${pageContext.request.contextPath }/css/lrtk.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/js.js"></script>
<!-- 返回顶部调用 end-->
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>

<%@include file="/common/top.jsp" %>

<div class="moodlist">
  <h1 class="t_nav"><span>删删写写，回回忆忆，虽无法行云流水，却也可碎言碎语。</span></h1>
  <div class="bloglist2">
    
    <c:forEach items="${blist }" var="b">
    	
    	<ul class="arrow_box">
	     <div class="sy">
	     
	     <c:if test="${b.pic!=null }">
	     	<img src="/pic/${b.pic }">
	     </c:if>
	     
	      <p> ${b.content }</p>
	      </div>
	      <span class="dateview"><fmt:formatDate value="${b.pubdate }" pattern="yyyy/MM/dd"/> </span>
	    </ul>
    	
    </c:forEach>
    
  </div>
  
			<div class="page">
			    <!-- 首页上一页 -->
			    <c:if test="${pager.currentPage!=1 }">
			    	<a href="${pageContext.request.contextPath }/broken/serach.do">&lt;&lt;</a>
			    	<a href="${pageContext.request.contextPath }/broken/serach.do?pageNo=${pager.currentPage-1}">&lt;</a>
			    </c:if>
			   
			   
			   <!-- 凑长度的增长页数 -->
			    <c:forEach begin="${pager.currentPage<5?1:(pager.currentPage-3)}" end="${pager.totalCount>=7?7:pager.totalCount }" varStatus="status">
			     	<c:if test="${pager.currentPage!=status.index }"><a href="${pageContext.request.contextPath }/broken/serach.do?pageNo=${status.index}">${status.index}</a></c:if>
			     	<c:if test="${pager.currentPage==status.index }"><b>${status.index}</b></c:if>
			    </c:forEach>
			    
			    <!-- 尾页下一页 -->
			    <c:if test="${pager.currentPage!=pager.totalCount }">
				    <a href="${pageContext.request.contextPath }/broken/serach.do?pageNo=${pager.currentPage+1}">&gt;</a>
				    <a href="${pageContext.request.contextPath }/broken/serach.do?pageNo=${pager.totalCount}">&gt;&gt;</a>
				</c:if>
				
				 &ensp; 总页数:<a title="Total record"><b>${pager.totalCount }</b></a>
			
			</div>  

</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
