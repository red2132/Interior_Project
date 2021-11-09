<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트-목록</title>
<style>
.card-section {
  padding: 25px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.card-list {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
}
.card {
  width: 500px;
  height: 130px;
  border-radius: 10px;
  overflow: hidden;
  margin: 15px 20px;
  box-shadow: 0 8px 30px rgba(0,0,0,0.2), 0 0 5px rgba(0,0,0,0.15);
  transform: scale3d(1, 1, 1);
  transition: all 0.2s ease-out, filter 0.75s ease-out;
  background: rgba(0,0,0,0.2);
  filter: grayscale(0.1) saturate(95%) brightness(95%) contrast(90%);
}
.card >a >img {
  position: absolute;
  width: 108%;
  height: 108%;
  top: -4%;
  left: -4%;
  z-index: -10;
  transform: scale(1.05);
  transition: all 0.2s ease-out, transform 0.2s ease-out, filter 0.75s ease-out;
  filter: blur(0px);
}
.card_detail >table {
	margin: 0px 15px;
}
.blog-pagination .page-item.active .page-link {
    background-color: #ff3368;
    border-color: #ff3368;
    color: #ffff !important;
}
</style>
</head>
<body>

<!-- breadcrumb start-->
	    <section class="breadcrumb breadcrumb_bg">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-sm-8">
	                    <div class="breadcrumb_iner">
	                        <div class="breadcrumb_iner_item">
	                            <h2>이벤트</h2>
	                            <p>공지사항<span>-</span>이벤트</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
<!-- breadcrumb end-->	
	
<section class="blog_area single-post-area">
<div class="container">
  <div class="row">
  <div class="posts-list">
  <div class="col-sm-12" style="margin-top:100px;" >
	  <c:if test="${sessionScope.admin=='y'}">
		<a href="../event/insert.do" class="genric-btn primary circle" style="color: #ffff !important;margin-left:1000px;">작성</a>
	  </c:if>
	</div>
	<div class="card-section">
	  <div class="card-list">
	    <c:forEach var="vo" items="${list }">
	    <div class="col-sm-6" style="padding-bottom:20px;">
		    <div class="card">
		      <a href="../event/detail_before.do?no=${vo.no}&page=${curpage}"><center><img src="${vo.poster }"/></center></a>
		  	</div>
		  	<div class="card_detail" style="margin-left:10px;">
		     <table>
		      <tr>
		      	<th><a href="../event/detail_before.do?no=${vo.no}&page=${curpage}">${vo.state }&nbsp;</a></th>
		      	<td>｜</td>
		      	<td><a href="../event/detail_before.do?no=${vo.no}&page=${curpage}">&nbsp;${vo.period }</a></td>
		      </tr>
		     </table>
		    </div>
		   </div>
	   </c:forEach>
	 </div>
	</div>
	
	
	<!-- 검색 -->
	<div class="col-sm-12">
    <aside class="single_sidebar_widget search_widget">
	<div class="form-group" style="margin-left:790px;margin-top:20px;">
    <div class="input-group mb-3">
    <form method=post action="../event/find.do" id="find">
       <select name="fs" class="input">
	   	 	<option value="T" >제목</option>
	   	 	<option value="C" >내용</option>
	   	 	<option value="P" >기간</option>
	   </select>
       <input type="text" name="ss" class="form-control" placeholder='검색어'
              onfocus="this.placeholder = ''" onblur="this.placeholder = '검색어'"
              style="width:200px;border-radius:5px;margin-top:3px;margin-left:5px;'">
       <div class="input-group-append">
       <button class="btn" type="button" onclick="document.getElementById('find').submit();"
       style="margin-top:3px;"><i class="ti-search"></i></button>
       </div>
    </form>
    </div>
    </div>
    </aside>
    </div>
	
	<!-- 페이지 -->
    <nav class="blog-pagination justify-content-center d-flex">
       <ul class="pagination">
         <c:if test="${startPage>1 }">
         <li class="page-item">
          <a href="../event/list.do?page=${startPage-1}" class="page-link" aria-label="Previous">
           <i class="ti-angle-left"></i>
          </a>
         </li>
         </c:if>  
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
         <c:if test="${i==curpage }">
         <li class="page-item active">
           <a href="../event/list.do?page=${i }" class="page-link">${i }</a>
         </li>
         </c:if>
         <c:if test="${i!=curpage }">
         <li class="page-item">
           <a href="../event/list.do?page=${i }" class="page-link">${i }</a>
         </li>
         </c:if>
         </c:forEach>
         <c:if test="${endPage<totalpage }">
         <li class="page-item">
           <a href="../event/list.do?page=${endPage+1 }" class="page-link" aria-label="Next">
             <i class="ti-angle-right"></i>
           </a>
         </li>
         </c:if>
      </ul>
    </nav>
    
    <!-- 쿠키 -->
    <section class="product_list best_seller" style="padding-top:30px;">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-sm-12">
          <div class="section_tittle text-center">
            <h4>최근 본 이벤트 <a href="../event/event_cookie_delete.do"><i class="fas fa-trash-alt"></i></a></h4>
          </div>
        </div>
      </div>
      <div class="row align-items-center justify-content-between">
        <div class="col-sm-12">
          <div class="best_product_slider owl-carousel">
           <c:forEach var="vo" items="${cList }" varStatus="s">
           	  <c:if test="${s.index<10 }">
           	  <div class="single_product_item">
       		  <a href="../event/detail.do?no=${vo.no }&page=${curpage}"><img src="${vo.poster }"></a>
       		  </div>
       		  </c:if>
     	   </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </section>
 </div>
</div>
</div>
</section>
</body>
</html>