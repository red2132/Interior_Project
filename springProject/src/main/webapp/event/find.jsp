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
.posts-list h4{
	margin-left:60px;
}
</style>
</head>
<body>
<!-- breadcrumb start-->
	    <section class="breadcrumb breadcrumb_bg">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-lg-8">
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
	
<!-- 목록 페이지 -->
<section class="blog_area single-post-area padding_top">
<div class="container">
  <div class="row">
  <div class="posts-list">
	<h4>'<b>${ss }</b>'을 검색한 결과(${fcnt })
	<a  onclick="window.history.back()"><i class="fas fa-arrow-circle-left"
	style="margin-left:775px;"></i> 뒤로가기</a></h4>
	<div class="card-section">
	  <div class="card-list">
	    <c:forEach var="vo" items="${flist }">
	    <div class="col-lg-6" style="padding-bottom:20px;">
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
	
	</div>
	</div>
	</div>
</section>
</body>
</html>