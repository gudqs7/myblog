<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>留言板----留下记忆通向未来</title>
<meta name="keywords" content="${article.title},javaee,j2ee" />
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/view.css" rel="stylesheet">
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

<div id="mainbody">
  <div class="blogs2">
    
	<div id="message_view">
	
	<!-- 多说评论框 start -->
	<div class="ds-thread" data-thread-key="007" data-title="所有留言" data-url="http://guddqs.cn/message/show.do"></div>
	<!-- 多说评论框 end -->
	<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
	<script type="text/javascript">
	var duoshuoQuery = {short_name:"guddqs"};
		(function() {
			var ds = document.createElement('script');
			ds.type = 'text/javascript';ds.async = true;
			ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
			ds.charset = 'UTF-8';
			(document.getElementsByTagName('head')[0] 
			 || document.getElementsByTagName('body')[0]).appendChild(ds);
		})();
		</script>
	<!-- 多说公共JS代码 end -->

    </div>
    <!--bloglist end-->
        <%@include file="/common/aside.jsp" %>
  </div>
  <!--blogs end--> 
</div>
<!--mainbody end-->

<%@include file="/common/foot.jsp" %>


</body>
</html>
