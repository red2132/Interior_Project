<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트-상세보기</title>
<style type="text/css">
.genric-btn.primary {
    color: #fff !important;
    background: #ff3368;
    border: 1px solid transparent;
}
#buttons{
  margin-left:960px;
}
#listBtn {
  margin-top:100px;
  margin-bottom:30px;
  margin-left:46%;
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
	<!-- breadcrumb start-->

	<!-- 이벤트 상세보기 -->
	<section class="blog_area single-post-area padding_top">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 posts-list">
               <div class="single-post">
                  <div class="blog_details">
                  	 <c:if test="${sessionScope.admin=='y'}">
                  	 <div class="col-lg-12" id="buttons">
                        <a href="../event/update.do?no=${vo.no }&page=${page}" class="genric-btn primary circle">수정</a>
       				    <a href="../event/delete.do?no=${vo.no }&page=${page}" class="genric-btn primary circle">삭제</a>
			      	 </div>
			      	 </c:if>
                     <h2>${vo.title }</h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="far fa-user"></i>${vo.id }</a></li>
                        <li><i class="fa fa-check-circle"></i>${vo.state }</a></li>
                        <li><i class="fa fa-calendar"></i>${vo.period }</a></li>
                     </ul>
                     
                     <c:if test="${vo.filecount>0 }">
                     <div style="padding-bottom:20px;width:1140;text-align:right;">
                     	  <ul><b>첨부 파일&nbsp;<i class="fa fa-caret-down" aria-hidden="true"></i></b></ul>
						  <ul>
						   <c:forEach var="fn" items="${fList }" varStatus="s">
						     <li><a href="download.do?fn=${fn }">${fn }</a>&nbsp;(${sList[s.index]}Bytes)</li>
						   </c:forEach>
						  </ul>
					 </div>
				     </c:if>
                     <div class="feature-img">
                     	<img src="${vo.img }" style="width:1140px;">
                  	 </div>
                     <p class="excert">
                        <br>${vo.content}<br>
                     </p>
			      	 <div class="col-lg-12">
			      	 	<a href="../event/list.do?page=${page }" class="genric-btn primary radius" id="listBtn">목록</a>
			      	 </div>
			      </div>
			     </div>
                </div>
              </div>
               
     		<!-- 좋아요/SNS -->
               <div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"><i class="far fa-heart"></i></span> Lily and 4
                        people like this</p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="far fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     <ul class="social-icons">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                        <li><a href="#"><i class="fab fa-behance"></i></a></li>
                     </ul>
                  </div>
                 
             <!-- 글작성자 -->
               <div class="blog-author">
                  <div class="media align-items-center">
                     <img src="../template/img/comment/1.png" alt="">
                     <div class="media-body">
                        <a href="#">
                           <h4>${vo.id }</h4>
                        </a>
                        <p>이벤트 관련 문의사항은 아래 메일로 문의주세요.<br>💌admin@sist.co.kr</p>
                     </div>
                  </div>
               </div>
             <!-- 댓글 -->
               <div class="comments-area">
                  <h4>05 Comments</h4>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="desc">
                              <p class="comment">
                                 Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                 Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                    <p class="date">December 4, 2017 at 3:12 pm </p>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="desc">
                              <p class="comment">
                                 Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                 Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                    <p class="date">December 4, 2017 at 3:12 pm </p>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="desc">
                              <p class="comment">
                                 Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                 Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                    <p class="date">December 4, 2017 at 3:12 pm </p>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="comment-form">
                  <h4>Leave a Reply</h4>
                  <form class="form-contact comment_form" action="#" id="commentForm">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9"
                                 placeholder="Write Comment"></textarea>
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="name" id="name" type="text" placeholder="Name">
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="email" id="email" type="email" placeholder="Email">
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <input class="form-control" name="website" id="website" type="text" placeholder="Website">
                           </div>
                        </div>
                     </div>
                     <div class="form-group mt-3">
                        <a href="#" class="btn_3 button-contactForm">Send Message</a>
                     </div>
                  </form>
               </div>
            </div>
          </div>
      </div>
     </div>
   </section>
</body>
</html>