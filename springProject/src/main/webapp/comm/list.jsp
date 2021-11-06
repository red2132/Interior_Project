<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
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
<style type="text/css">
#dd{
  height: 60px;
  width: 60px;
}
</style>
</head>

<body>
<!--================Blog Area =================-->
    <section class="blog_area padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                      <c:forEach var="vo" items="${cList }">
                      
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0"  src="${vo.filename }">
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="detail_before.do?no=${vo.no }&page=${curpage}">
                                    <h2>${vo.subject }</h2>
                                </a>
                                <ul class="blog-info-link">
                                    <li><i class="far fa-user"></i>${vo.id}</li>
                                    <li>${vo.dbday }</li>
                                </ul>
                            </div>
                        </article>
                       
                       
					</c:forEach>
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                             <c:if test="${startPage>1 }">
                                <li class="page-item">
                                    <a href="list.do?page=${startPage-1 }" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
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
                                    <a href="list.do?page=${i }" class="page-link">${i }</a>
                                </li>
                                 </c:forEach> 
                              <c:if test="${endPage<totalpage }">
                                <li class="page-item">
                                    <a href="list.do?page=${endPage+1 }" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </lI>
                              </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                      <c:if test="${sessionScope.id!=null && sessionScope.admin=='n' }">
                        <aside class="single_sidebar_widget search_widget">                        
                        <a href="insert.do">
                        	<button class="button rounded-0 primary-bg text-white w-100 btn_1">
                        		글쓰기
                        	</button>
                       </a>
                        </aside>
                        </c:if>

                     <aside class="single_sidebar_widget post_category_widget">
                      <form method=post action="filter.do">
                     <h4 class="widget_title">필터</h4>
						<div class="default-select" id="default-select_2">
							<select name="fs1">
								<option value="a">주거 형태</option>
								<option value="아파트">아파트</option>
								<option value="단독주택">단독주택</option>
								<option value="원룸&오피스텔">원룸&오피스텔</option>
								<option value="빌라&연립">빌라&연립</option>
							</select>
						</div>
						<div class="default-select" id="default-select_2">
							<select name="fs2">
								<option value="b">분야</option>
								<option value="리모델링">리모델링</option>
								<option value="홈스타일링">홈스타일링</option>
								<option value="건축">건축</option>
								<option value="부분공사">부분공사</option>
							</select>
						</div>
						<div class="default-select" id="default-select_2">
							<select name="fs3">
								<option value="c">가족구성</option>
								<option value="부모님과 함께">부모님과함께</option>
								<option value="싱글라이프">싱글라이프</option>
								<option value="신혼부부">신혼부부</option>
								<option value="아기가있는집">아기가있는집</option>
								<option value="취학자녀와함께">취학자녀와함께</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<button class="genric-btn success-border circle arrow">search<span
						class="lnr lnr-arrow-right"></span></button>
						</form>
                  </aside>                       
                  <aside class="single_sidebar_widget popular_post_widget">
                     <h3 class="widget_title">최근 본 게시물</h3>  
                      <c:forEach var="vo" items="${ccList }">                                       
                     <div class="media post_item">                   
                        <img src="${vo.filename }" id="dd">
                        <div class="media-body">
                           <a href="detail_before.do?no=${vo.no }&page=${curpage}">
                              <h3>${vo.subject }</h3>
                           </a>
                           <p>${vo.dbday }</p>
                        </div>                       
                     </div> 
                     </c:forEach>                                      
                  </aside>                     
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
</body>

</html>