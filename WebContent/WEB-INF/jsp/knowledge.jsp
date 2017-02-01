<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学无止境</title>
<meta name="keywords" content="${article.title},javaee,j2ee" />
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/learn.css" rel="stylesheet">
<!-- 返回顶部调用 begin -->
<link href="${pageContext.request.contextPath }/css/lrtk.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/js.js"></script>
<!-- 返回顶部调用 end-->
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?74d41c90ac369258ee3135f94d4735bb";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

</head>
<body>

<%@include file="/common/top.jsp" %>

<article id="mainbody">

<div class="blogs3">
	<h1 class="t_nav"><span>此时耐心学习,或废寝忘食者,他日必与他人不同</span></h1>
	<div class="newblog">
		<c:if test="${!empty alist }">
	    
		    <c:forEach items="${alist }" var="a">
		    	
		    	<h2>
					<c:if test="${a.title.length()<21 }"><c:out value="${a.title }" escapeXml="true"/></c:if>
			      	<c:if test="${a.title.length()>=21 }"><c:out value="${a.title.substring(0,21) }" escapeXml="true"/></c:if>
				</h2>
			   <p class="dateview"><span>发布时间：<fmt:formatDate value="${a.pubdate }" pattern="yyyy年MM月dd日"/>
			    </span><span>作者：${a.author }</span><span>分类：[<a href="${pageContext.request.contextPath }/article/serach.do?id=${a.typeid}">${a.type.name }</a>]</span></p>
			    <figure><img src="/pic/${a.pic }"></figure>
			    <ul class="nlist">
			      <p>
			      	<c:if test="${a.getContent2().length()<50 }"><c:out value="${a.getContent2() }" escapeXml="true"/></c:if>
			      	<c:if test="${a.getContent2().length()>=50 }"><c:out value="${a.getContent2().substring(0,40) }" escapeXml="true"/></c:if>
			      </p>
			      <a title="展开全文" href="${pageContext.request.contextPath }/article/getArticle.do?id=${a.id}" class="readmore">详细信息>>></a>
			    </ul>
			    <div class="line"></div>
		    	
		    </c:forEach>
		    
		    
		    <div class="blank"></div>
		    <div class="ad">  
		    </div>
		    
		    <div class="page">
			    <!-- 首页上一页 -->
			    <c:if test="${pager.currentPage!=1 }">
			    	<a href="${pageContext.request.contextPath }/article/serach.do?id=${tid }&${searchdata==null?'dd':'data='}${searchdata }">&lt;&lt;</a>
			    	<a href="${pageContext.request.contextPath }/article/serach.do?id=${tid }&${searchdata==null?'dd':'data='}${searchdata }&pageNo=${pager.currentPage-1}">&lt;</a>
			    </c:if>
			   
			   
			   <!-- 凑长度的增长页数 -->
			    <c:forEach begin="${pager.currentPage<5?1:(pager.currentPage-3)}" end="${pager.totalCount>=7?7:pager.totalCount }" varStatus="status">
			     	<c:if test="${pager.currentPage!=status.index }"><a href="${pageContext.request.contextPath }/article/serach.do?id=${tid }&${searchdata==null?'dd':'data='}${searchdata }&pageNo=${status.index}">${status.index}</a></c:if>
			     	<c:if test="${pager.currentPage==status.index }"><b>${status.index}</b></c:if>
			    </c:forEach>
			    
			    <!-- 尾页下一页 -->
			    <c:if test="${pager.currentPage!=pager.totalCount }">
				    <a href="${pageContext.request.contextPath }/article/serach.do?id=${tid }&${searchdata==null?'dd':'data='}${searchdata }&pageNo=${pager.currentPage+1}">&gt;</a>
				    <a href="${pageContext.request.contextPath }/article/serach.do?id=${tid }&${searchdata==null?'dd':'data='}${searchdata }&pageNo=${pager.totalCount}">&gt;&gt;</a>
				</c:if>
				
				 &ensp; 总页数:<a title="Total record"><b>${pager.totalCount }</b></a>
			
			</div>
       </c:if>		
	</div>   
       <%@include file="/common/aside.jsp" %>
       
</div>

</article>

<%@include file="/common/foot.jsp" %>

</body>
</html>
