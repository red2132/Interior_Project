<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zxx">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!--================Home Banner Area =================-->
<!-- breadcrumb start-->
<!-- <section class="breadcrumb breadcrumb_bg" style="height:100px">-->
<section class="blog_area padding_top">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-lg-12">
            <div class="breadcrumb_iner">
               <div class="breadcrumb_iner_item">
                  <!-- <h2 style="margin-top:120px">Q&A 질문하기</h2> -->
                  <h2>Q&A 질문하기</h2>
                  <table class="table">
			       <tr>
			        <td>
			         <a href="../qna/insert.do" class="btn btn-xs btn-danger">글쓰기</a>
			        </td>
			       </tr>
			      </table>
				    <div style="height: 550px">
	                  <table class="table">
				       <tr>
				        <th class="text-center" width=10%>번호</th>
				        <th class="text-center" width=45%>제목</th>
				        <th class="text-center" width=15%>이름</th>
				        <th class="text-center" width=20%>작성일</th>
				        <th class="text-center" width=10%>조회수</th>
				       </tr>
				       <c:forEach var="vo" items="${qnaList }">
				         <tr>
					        <td class="text-center" width=10%>${vo.no }</td>
					        <td width=45%>
					          <c:if test="${vo.g_tab>0 }">
					            <c:forEach var="i" begin="1" end="${vo.g_tab }">
					              &nbsp;&nbsp;&nbsp;
					            </c:forEach>
					            <img src="../qna/re_icon.png">
					          </c:if>
					          <a href="../replyboard/detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a>
					          <c:if test="${today==vo.regdate }">
					            &nbsp;<sup style="color:red">new</sup>
					          </c:if>
					        </td>
					        <td class="text-center" width=15%>${vo.name }</td>
					        <td class="text-center" width=20%>${vo.regdate }</td>
					        <td class="text-center" width=10%>${vo.hit }</td>
					       </tr>
				       </c:forEach>
				     </table>
				     <table class="table">
				     	<tr>
				     	 <td class="text-center">
					         <a href="../qna/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
					         ${curpage } page / ${totalpage } pages
					         <a href="../qna/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
					        </td>
				       </tr>
				     </table>
	              </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
</body>
</html>
<!-- breadcrumb start-->
<!--================Blog Area =================-->
   <!-- 
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <div class="row">
     <h1 class="text-center">묻고답하기</h1>
     <table class="table">
       <tr>
        <td>
         <a href="../replyboard/insert.do" class="btn btn-sm btn-danger">새글</a>
        </td>
       </tr>
     </table>
     <div style="height: 450px">
     <table class="table">
       <tr>
        <th class="text-center" width=10%>번호</th>
        <th class="text-center" width=45%>제목</th>
        <th class="text-center" width=15%>이름</th>
        <th class="text-center" width=20%>작성일</th>
        <th class="text-center" width=10%>조회수</th>
       </tr>
       <c:forEach var="vo" items="${list }">
         <tr>
	        <td class="text-center" width=10%>${vo.no }</td>
	        <td width=45%>
	          <c:if test="${vo.group_tab>0 }">
	            <c:forEach var="i" begin="1" end="${vo.group_tab }">
	              &nbsp;&nbsp;
	            </c:forEach>
	            <img src="re_icon.png">
	          </c:if>
	          <a href="../replyboard/detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a>
	          <c:if test="${today==vo.dbday }">
	            &nbsp;<sup style="color:red">new</sup>
	          </c:if>
	        </td>
	        <td class="text-center" width=15%>${vo.name }</td>
	        <td class="text-center" width=20%>${vo.dbday }</td>
	        <td class="text-center" width=10%>${vo.hit }</td>
	       </tr>
       </c:forEach>
     </table>
     </div>
     
     
     <table class="table">
       <tr>
        <td class="text-left inline">
        	<form method="post" action="../replyboard/find.do">
	          <input type="checkbox" value="N" class="input-sm" name="fs">이름
	          <input type="checkbox" value="S" class="input-sm" name="fs">제목
	          <input type="checkbox" value="C" class="input-sm" name="fs">내용
	          <input type=text name=ss size=15 class="input-sm">
	          <input type=submit class="btn btn-sm btn-success" value="검색">
	        </form>
        </td>
        <td class="text-right">
         <a href="../replyboard/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
         ${curpage } page / ${totalpage } pages
         <a href="../replyboard/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
        </td>
       </tr>
     </table>
    </div>
  </main>
</div> -->
