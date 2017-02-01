<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<aside>
        <div class="search">
        <form class="searchform" method="get" action="${pageContext.request.contextPath }/article/serach.do">
          <input type="text" name="data" value="${searchdata }" placeholder="Search">
        </form>
      </div>
      <div class="sunnav">
        <ul>
          <li><a href="/web/"  title="网站建设">网站建设</a></li>
          <li><a href="/newshtml5/"  title="HTML5 / CSS3">HTML5 / CSS3</a></li>
          <li><a href="/jstt/"  title="技术探讨">技术探讨</a></li>
          <li><a href="/news/s/"  title="慢生活">慢生活</a></li>
        </ul>
      </div>
      <div class="tuijian">
        <h2>栏目更新</h2>
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
	        	<li><span><a href="${pageContext.request.contextPath }/article/serach.do?id=${hot.typeid}" >${hot.type.name }</a></span>
	        	<a href="${pageContext.request.contextPath }/article/getArticle.do?id=${hot.id}" >${hot.title }</a></li>
	        </c:forEach>
        </ol>
      </div>
    </aside>