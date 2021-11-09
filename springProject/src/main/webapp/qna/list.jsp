<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>
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
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Q&A</h2>
                            <p>Q&A <span>-</span> 질문하기</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    <!--================Blog Area =================-->
    <section class="blog_area padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
	                    <table class="table">
	                    	<tr>
	                    		<td>
		                    		<c:if test="${sessionScope.id!=null }">
			                    		<a href="../qna/insert.do" class="btn btn-xs btn-danger" id="insertBtn">글쓰기</a>
		                    		</c:if>
		                    		<c:if test="${sessionScope.id==null }">
		                    			<p style="color:red">글쓰기는 로그인 후 이용 가능합니다.</p>
		                    		</c:if>
	                    		</td>
	                    	</tr>
	                    </table>
						<%-- 목록 출력 Start --%>
						<div>
							<table class="table">
						       <tr>
						        <th class="text-center" width=10%>번호</th>
						        <th class="text-center" width=45%>제목</th>
						        <th class="text-center" width=15%>작성자</th>
						        <th class="text-center" width=20%>작성일</th>
						        <th class="text-center" width=10%>조회수</th>
						       </tr>
						       <c:forEach var="vo" items="${qnaList }">
						         <tr>
							        <td class="text-center" width=10%>${vo.no }</td>
							        <td width=45%>
							          <c:if test="${vo.g_tab>0 }">
							            <c:forEach var="i" begin="1" end="${vo.g_tab }">
							              &nbsp;&nbsp;
							            </c:forEach>
							            <img src="../qna/re_icon.png">
							          </c:if>
							          <a href="../qna/detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a>
							        </td>
							        <td class="text-center" width=15%>${vo.id }</td>
							        <td class="text-center" width=20%><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
							        <td class="text-center" width=10%>${vo.hit }</td>
							       </tr>
						       </c:forEach>
						     </table>
						</div>     
						<%-- 목록 출력 End --%>  
						             
	                	<%-- 페이징 Start --%>
	                    <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                             	<c:if test="${startPage>1 }">
                                	<li class="page-item">
                                    	<a href="../qna/list.do?page=${startPage-1 }" class="page-link" aria-label="Previous"><i class="ti-angle-left"></i></a>
                                	</li>
                             	</c:if>
                             	<c:forEach var="i" begin="${startPage }" end="${endPage }">
                               		<c:if test="${i==curpage }">
                               			<c:set var="style" value="page-item active"/>
	                               	</c:if>
    	                           	 <c:if test="${i!=curpage }">
        	    						<c:set var="style" value="page-item"/>
	          						</c:if>
    	                            <li class="${style }">
        	                            <a href="../qna/list.do?page=${i }" class="page-link">${i }</a>
	                                </li>
	                            </c:forEach>
	                            <c:if test="${endPage<totalpage }">
                                	<li class="page-item">
                                    	<a href="../qna/list.do?page=${endPage+1 }" class="page-link" aria-label="Next"><i class="ti-angle-right"></i></a>
    	                            </li>
    	                        </c:if>
                            </ul>
                        </nav>
                        <%-- 페이징 End --%>
                    </div>
                </div>
            </div>
        </div>
   </section>
</body>
</html>