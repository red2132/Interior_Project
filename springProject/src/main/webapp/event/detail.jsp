<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>이벤트-상세보기</title>
<style type="text/css">
.genric-btn.primary {
    color: #fff;
    background: #ff3368;
    border: 1px solid transparent;
}
#Btn {
    color: #fff !important;
    background: #ff3368;
    border: 1px solid transparent;
}
#buttons{
  margin-left:960px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;
let r=0;
$(function(){
	$('.updates').click(function(){
		$('up').hide();
		$('reply').hide();
		// 수정창 열기
		let no=$(this).attr("data-no");
		if(u==0) // 보여주기
		{
			$(this).text("");
			$('#u'+no).show();
			u=1;
		}
		else // 숨기기
		{
			$('#u'+no).hide();
			$(this).text("");
			u=0;
		}
	})
	$('.replys').click(function(){
		$('.up').hide();
		$('.reply').hide();
		// 대댓글창을 연다 
		let no=$(this).attr("data-no");
		if(r==0) // 보여주기
		{
			$(this).text("");
			$('#r'+no).show();
			r=1;
		}
		else // 숨기기
		{
			$('#r'+no).hide();
			$(this).text("");
			r=0;
		}
	})
})
</script>
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
                        <a href="../event/update.do?no=${vo.no }&page=${page}" class="genric-btn primary circle" id="Btn">수정</a>
       				    <a href="../event/delete.do?no=${vo.no }&page=${page}" class="genric-btn primary circle" id="Btn">삭제</a>
			      	 </div>
			      	 </c:if>
                     <h2>${vo.title }</h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="far fa-user"></i>${vo.id }</a></li>
                        <li><i class="fa fa-check-circle"></i>${vo.state }</li>
                        <li><i class="fa fa-calendar"></i>${vo.period }</li>
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
			      	 	<a href="../event/list.do?page=${page }" class="genric-btn primary1 radius"
			      	 	id="Btn" style="margin-top:100px;margin-bottom:30px;margin-left:46%;">목록</a>
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
               	  <h4>댓글(${rcnt })</h4>
                  <!-- 댓글 출력 위치 -->
                  <c:forEach var="rvo" items="${list }">
                  <div class="comment-list">
                  <div class="buttons_reply">
					<c:if test="${sessionScope.id!=null }">
                    <c:if test="${sessionScope.id==rvo.id }">
                         <a class="far fa-edit updates" data-no=${rvo.no } style="float:right; margin-top:3px; margin-left: 3px;"></a>
                         <a href="../event/reply_delete.do?no=${rvo.no }&bno=${vo.no}&page=${page}"
                         style="float:right;"><i class="far fa-trash-alt"></i></a>	
					</c:if> 
                         <a class="far fa-comment-dots replys" data-no=${rvo.no } style="float:right; margin-top:3px; margin-right: 3px;"></a>  
					</c:if>
					</div>
				   </div>
				   	 <c:if test="${rvo.group_tab>0 }">
	               		<c:forEach var="i" begin="1" end="${rvo.group_tab }">
	                 		&nbsp;&nbsp;
	               		</c:forEach>
	               	   		<i class="fas fa-reply" style="padding-bottom:5px;color:pink;"></i>
	             	 </c:if>                           
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="desc">
                              <p class="comment">${rvo.msg }</p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">${rvo.name }</a>
                                    </h5>
                                    <p class="date" style="margin-top:10px;margin-left:10px !important;">${rvo.dbday }</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
               
               <!-- 댓글 수정 -->
               <div class="comment-form up" id="u${rvo.no}" style="display:none;margin-bottom:30px;" >
                  <form class="form-contact comment_form" action="../event/reply_update.do" method="post">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                           	  <input type="hidden" name="no" value="${rvo.no }">
		        			  <input type="hidden" name="bno" value="${vo.no }">
		        			  <input type="hidden" name="page" value="${page }">
                              <textarea class="form-control w-100" name="msg" cols="30" rows="5"
                                 placeholder="내용">${rvo.msg }</textarea>
		                     <div class="form-group mt-3">
		                        <input type=submit value="수정" class="genric-btn primary circle" style="float:right;" />
		                     </div>
                     		</div>
                    	</div>
                     </div>
                  </form>
               </div>
               
               <!-- 대댓글 폼 -->
               <div class="comment-form reply" id="r${rvo.no}" style="display:none;margin-bottom:30px;" >
                  <form class="form-contact comment_form" action="../event/reply_reply_insert.do" method="post">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                           	  <input type="hidden" name="pno" value="${rvo.no }">
		        			  <input type="hidden" name="bno" value="${vo.no }">
		        			  <input type="hidden" name="page" value="${page }">
                              <textarea class="form-control w-100" name="msg" cols="30" rows="5"
                                 placeholder="내용"></textarea>
                              <div class="form-group mt-3">
                        		<input type=submit value="작성" class="genric-btn primary circle" style="float:right;" />
                     		</div>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
               </c:forEach>
                
               <!-- 댓글 폼 -->
               <c:if test="${sessionScope.id!=null }">
               <div class="comment-form">
                  <h4>작성</h4>
                  <form class="form-contact comment_form" action="../event/reply_insert.do" method="post">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                           	  <input type="hidden" name="bno" value="${vo.no }">
		        			  <input type="hidden" name="page" value="${page }">
                              <textarea class="form-control w-100" name="msg" cols="30" rows="5"
                                 placeholder="내용"></textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group mt-3">
                        <input type=submit class="genric-btn primary circle" value="작성"/>
                     </div>
                  </form>
               </div>
               </c:if>
              </div>
            </div>
          </div>
   </section>
</body>
</html>