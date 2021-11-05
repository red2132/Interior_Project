<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
<!--================Blog Area =================-->
    <section class="blog_area padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
					<h3 class="text-center">${number}개의 게시물이 검색되었습니다</h3>
                     <h3 class="text-center">    </h3>
                      <c:forEach var="vo" items="${tList }">
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0"  src="${vo.filename }">
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="detail.do?no=${vo.no }&page=1">
                                    <h2>${vo.subject }</h2>
                                </a>
                                <ul class="blog-info-link">
                                    <li><i class="far fa-user"></i>${vo.id}</li>
                                     <li>${vo.dbday }</li>
                                </ul>
                            </div>
                        </article>
					</c:forEach>
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
                     <h3 class="widget_title">Recent Post</h3>
                     <div class="media post_item">
                        <img src="img/post/post_1.png" alt="post">
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>From life was you fish...</h3>
                           </a>
                           <p>January 12, 2019</p>
                        </div>
                     </div>
                     <div class="media post_item">
                        <img src="img/post/post_2.png" alt="post">
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>The Amazing Hubble</h3>
                           </a>
                           <p>02 Hours ago</p>
                        </div>
                     </div>
                     <div class="media post_item">
                        <img src="img/post/post_3.png" alt="post">
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>Astronomy Or Astrology</h3>
                           </a>
                           <p>03 Hours ago</p>
                        </div>
                     </div>
                     <div class="media post_item">
                        <img src="img/post/post_4.png" alt="post">
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>Asteroids telescope</h3>
                           </a>
                           <p>01 Hours ago</p>
                        </div>
                     </div>
                  </aside>                  
                    </div>
                </div>
            </div>
        </div>
    </section>