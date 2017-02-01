<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<style>
		body{font: 17px "楷体", "Arial Narrow", HELVETICA; color: #c0c0c0; line-height: 1.5; background: #333; }
		div a,a {padding:10px 7px; font-size:16px; color: #a6a6a6; text-decoration: none; transition: All 1s ease; -webkit-transition: All 1s ease; -moz-transition: All 1s ease; -ms-transition: All 1s ease; -o-transition: All 1s ease; }
		a:hover { color: #fff; }
		#nav{ clear: both; overflow: hidden; margin: 22px auto; width:800px;}
		
		ul li{float:left; paddding:17px; background: white; list-style:none;}
		ul li a { padding:17px 7px; font-size:24px; text-decoration:none; color:#111}
		ul li:hover{background:springgreen;}
	</style>
<header>

<div id="nav">
    <ul>
      <li><a href="${pageContext.request.contextPath }/" target="_blank">前台首页</a></li>
      <li><a href="${pageContext.request.contextPath }/article/list.do" title="博客管理">博客管理</a></li>
      <li><a href="${pageContext.request.contextPath }/type/list.do" title="博客分类管理">博客分类管理</a></li>
      <li><a href="${pageContext.request.contextPath }/broken/list.do"  title="碎言碎语管理">碎言碎语管理</a></li>
      <li><a href="${pageContext.request.contextPath }/message/list.do"  title="留言板管理">留言板管理</a></li>
    </ul>
  </div>

</header>
<!--header end-->
