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
<title>${article.title}</title>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ued/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ued/ueditor.all.min.js"></script>
<script type="text/javascript">
var UEDITOR_HOME_URL = "${pageContext.request.contextPath }/ued/";
</script>


<link rel="stylesheet" href="${pageContext.request.contextPath }/ued/third-party/SyntaxHighlighter/shCoreDefault.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/ued/third-party/SyntaxHighlighter/shCore.js"></script>
<script> 
//SyntaxHighlighter.highlight();
SyntaxHighlighter.defaults['toolbar'] = true;
SyntaxHighlighter.defaults['smart-tabs'] = true;
SyntaxHighlighter.all(); 
</script>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ued/lang/zh-cn/zh-cn.js">

</script>
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
    <div id="index_view">
      <h1 class="c_titile">${article.title }</h1>
      <p class="box">发布时间：<fmt:formatDate value="${article.pubdate }" pattern="yyyy年MM月dd日 HH:mm:ss"/><span>编辑：${article.author}</span>阅读（${article.looktime }）</p>
      <ul>

        <p> ${article.content }</p>

      </ul>
      <div class="share"> 
        <!-- Baidu Button BEGIN -->
        <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare"> <span class="bds_more">分享到：</span> 
        
        <a class="bds_qzone"></a> <a class="bds_tsina"></a> <a class="bds_tqq"></a> <a class="bds_renren"></a> <a class="bds_t163"></a> <a class="shareCount"></a> </div>
        <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
        <script type="text/javascript" id="bdshell_js"></script> 
        <script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
</script> 
        <!-- Baidu Button END --> 
      </div>
      <div class="otherlink">
        <h2>相关文章</h2>
        <ol>
        	<c:forEach items="${alist }" var="a">
        		<li><a href="${pageContext.request.contextPath }/article/getArticle.do?id=${a.id}" target="_blank" title="${a.title }">${a.title }</a></li>
        	</c:forEach>
        
        </ol>
      </div>
    </div>
    <!--bloglist end-->
    
    <%@include file="/common/aside.jsp" %>
    
	<div id="index_view2">
<!-- 多说评论框 start -->
	<div class="ds-thread" data-thread-key="9633${article.id}" data-title="${article.title}" data-url="http://guddqs.cn/article/getArticle.do?id=${article.id}"></div>
	<!-- 多说评论框 end -->
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

  </div>
  <!--blogs end--> 
</div>
<!--mainbody end-->

<%@include file="/common/foot.jsp" %>

</body>
</html>
