<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="baidu-site-verification" content="hL4CGerT5M" />
<meta name="baidu-site-verification" content="Xjm8OWFFsQ" />
<meta name="baidu_union_verify" content="0e0745f0d3339218fea28b7b30761b24">
<meta name="baidu_union_verify" content="140382ae625447fb438217ea5fd8ab2c">
<title>欢迎来到我的博客----Guddqs</title>
<meta name="keywords" content="Guddqs,javaee,j2ee,ssh,ssm,android,java,guddqs" />
<meta name="description" content="我自横刀向天笑,去留肝胆两昆仑" />
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/animation.css" rel="stylesheet">
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
<c:if test="${alist==null }">
	<c:redirect url="/article/queryAll.do"/>
</c:if>
<%@include file="/common/top.jsp" %>

<div id="mainbody">
  <div class="info">
    <figure> <img src="${pageContext.request.contextPath }/images/art.jpg"  alt="Panama Hat">
      <figcaption><strong>授人与鱼,不如授人与渔</strong> 我自横刀向天笑,去留肝胆两昆仑.人生自古谁无死,留取丹心照汗青.
	  &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
	  &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<br/>
      天地有正气，杂然赋流形。下则为河岳，上则为日星。</figcaption>
    </figure>
    <div class="card">
      <h1>我的名片</h1>
      <p>网名：Guddqs | 文曲星</p>
      <p>职业：J2EE工程师、业余安卓</p>
      <p>电话：18870321728</p>
      <p>Email：guddqs@126.com</p>
      <ul class="linkmore">
        <li><a href="${pageContext.request.contextPath }/message/show.do" class="talk" title="给我留言"></a></li>
        <li><a href="javascript:alert('暂不想被打扰!');" class="address" title="联系地址"></a></li>
        <li><a href="mailto:guddqs@126.com" class="email" title="给我写信"></a></li>
        <li><a href="javascript:alert('暂不想被打扰!');" class="photos" title="站点相册"></a></li>
        <li><a href="javascript:alert('谢谢,暂不想被打扰!');" class="heart" title="关注我"></a></li>
      </ul>
    </div>
  </div>
  <!--info end-->
  <div class="blank"></div>
  <div class="blogs">
    <ul class="bloglist">
      
      <c:forEach items="${alist }" var="a">
      	
      	<li>
	        <div class="arrow_box">
	          <div class="ti"></div>
	          <!--三角形-->
	          <div class="ci"></div>
	          <!--圆形-->
	          <h2 class="title"><a href="${pageContext.request.contextPath }/article/getArticle.do?id=${a.id}" target="_blank">
				
				 <c:if test="${a.title.length()>21 }">
	            	<c:out value="${a.title.substring(0,21)}" escapeXml="true"/>...
	            </c:if>
	            <c:if test="${a.title.length()<=21 }">
	            	<c:out value="${a.title}" escapeXml="true"/>
	            </c:if>
				</a></h2>
	          <ul class="textinfo">
	            <c:if test="${ !empty a.pic }">
	            	<a href="${pageContext.request.contextPath }/article/getArticle.do?id=${a.id}" target="_blank"><img src="/pic/${a.pic }"></a>
	            </c:if>
	            <c:if test="${a.content2.length()>150 }">
	            	<p> <c:out value="${a.content2.substring(0,150)}" escapeXml="true"/>......</p>
	            </c:if>
	            <c:if test="${a.content2.length()<=150 }">
	            	<p> <c:out value="${a.content2}" escapeXml="true"/></p>
	            </c:if>
	          </ul>
	          <ul class="details">
	            <li class="likes"><a href="#">${a.love }</a></li>
	            <li class="comments"><a href="#">${a.looktime }</a></li>
	            <li class="icon-time"><a href="#"><fmt:formatDate value="${a.pubdate }" pattern="yyyy-MM-dd HH:mm:ss"/></a></li>
	          </ul>
	        </div>
	        <!--arrow_box end--> 
	     </li>
      	
      </c:forEach>
      
     
    </ul>
    <!--bloglist end-->
    <aside>
      <div class="tuijian">
        <h2>推荐文章</h2>
        <ol>
        
	        <c:forEach items="${newlist }" var="n" varStatus="status">
	        	<li><span><strong>${status.index+1 }</strong></span>
	        	<a href="${pageContext.request.contextPath }/article/getArticle.do?id=${n.id}" >${n.title }</a></li>
	        </c:forEach>
        
        </ol>
      </div>
      
      <div class="clicks">
        <h2>热门点击</h2>
        <ol>
	        <c:forEach items="${hotlist}" var="hot" >
	        	<li><span><a href="${pageContext.request.contextPath }/article/serach.do?id=${hot.typeid}">${hot.type.name }</a></span>
	        	<a href="${pageContext.request.contextPath }/article/getArticle.do?id=${hot.id}" >${hot.title }</a></li>
	        </c:forEach>
          
        </ol>
      </div>
      
      <div class="search">
        <form class="searchform" method="get" action="${pageContext.request.contextPath }/article/serach.do">
          <input type="text" name="data" value="${searchdata }" placeholder="Search">
        </form>
      </div>
      <div class="viny">
        <dl>
          <dt class="art"><img src="${pageContext.request.contextPath }/images/artwork.png" alt="专辑"></dt>
          <dd class="icon-song"><span></span>Young For You</dd>
          <dd class="icon-artist"><span></span>歌手：Gala</dd>
          <dd class="icon-album"><span></span>专辑：Young For You</dd>
          <!-- <dd class="icon-like"><span></span><a href="javascript:alert('Thank You')">喜欢</a></dd> -->
          <dd>&nbsp;</dd>
          <dd class="music">
            <audio src="${pageContext.request.contextPath }/images/yongforyou.mp3" controls loop ></audio>
          </dd>
          <!--添加autoplay  也可以添加loop属性 音频加载到末尾时，会重新播放-->
        </dl>
      </div>
    </aside>
  </div>
  <!--blogs end--> 
</div>
<!--mainbody end-->

<%@include file="/common/foot.jsp" %>

</body>
</html>
