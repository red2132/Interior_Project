<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
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
	
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.reply_update').click(function(){
		//1. 열린 수정창 모두 닫기
		$('.up').hide();
		$('.reply').hide();
		//2. 수정 클릭한 댓글만 수정창 열기
		let no=$(this).attr("data-no");
		if(u==0){ //u가 0이면 show(u= 0 -> 1)
			$(this).text("취소");
			$('#u'+no).show();
			u=1;
		}else{
			$('#u'+no).hide();
			$(this).text("수정");
			u=0;
		}
	})
	
	$('.replys').click(function(){
		//1. 열린 수정창 모두 닫기
		$('.up').hide();
		$('.reply').hide();
		//2. 수정 클릭한 댓글만 수정창 열기
		let no=$(this).attr("data-no");
		if(r==0){ //u가 0이면 show(u= 0 -> 1)
			$(this).text("취소");
			$('#r'+no).show();
			r=1;
		}else{
			$('#r'+no).hide();
			$(this).text("댓글");
			r=0;
		}
	})
})
</script>
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
    <!--================ 게시글 출력 =================-->
    <section class="blog_area padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
						<table class="table">
							<tr>
								<th width="20%" class="text-center">번호</th>
								<td width="30%" class="text-center">${vo.no }</td>
								<th width="20%" class="text-center">작성일</th>
								<td width="30%" class="text-center"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>
							<tr>
								<th width="20%" class="text-center">이름</th>
								<td width="30%" class="text-center">${vo.id }</td>
								<th width="20%" class="text-center">조회수</th>
								<td width="30%" class="text-center">${vo.hit }</td>
							</tr>
							<tr>
								<th width="20%" class="text-center">제목</th>
								<td colspan="3">${vo.subject }</td>
							</tr>
							<tr>
								<td colspan="4" class="text-left" valign="top" height="200">
									<pre style="white-space:pre-wrap;background-color:white;border:none">${vo.content }</pre>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="text-right">
									<c:if test="${sessionScope.id==vo.id || sessionScope.admin=='y'}">
										<a href="../qna/update.do?no=${vo.no }&page=${page }" class="btn btn-xs btn-info">수정</a>
										<a href="../qna/delete.do?no=${vo.no }&page=${page }" class="btn btn-xs btn-success">삭제</a>
									</c:if>
									<a href="../qna/reply.do?no=${vo.no }&page=${page }" class="btn btn-xs btn-danger">답변</a>
									<a href="../qna/list.do?page=${page }" class="btn btn-xs btn-primary">목록</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--=========================================== 댓글출력 ==========================================================-->
	<!--================Blog Area =================-->
   <section class="blog_area single-post-area padding_top">
      <div class="container">
         <div class="row">
            <%--------------------------- 댓글목록 출력 --------------------------%>
            <div class="col-lg-12 posts-list">
              <div class="comments-area">
                  <h4>${rCount } Comments</h4>
                        <c:forEach var="rvo" items="${list }">
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                        	<c:if test="${rvo.g_tab>0 }">
                        		<c:forEach var="i" begin="1" end="${rvo.g_tab }">
                        			&nbsp;&nbsp;
                        		</c:forEach>
                        			<img src="re_icon.png">
                        	</c:if>
                        	<!-- 댓글 출력 -->
                        	<div class="desc">
                        	  <p class="comment">${rvo.msg }</p>
                       		  <div class="d-flex justify-content-between">
                       		  	<div class="d-flex align-items-center">
                       		  		<h5>
                                      <a href="#">${rvo.id }</a>
                                    </h5>
                                    <p class="date"><fmt:formatDate value="${rvo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                                </div>
                                <div class="buttons_reply">
				                  	<c:if test="${sessionScope!=null }">
				                  	<c:if test="${sessionScope.id==rvo.id }">
					                  	<a href="../qna/reply_delete.do?no=${rvo.no }&bno=${vo.no}&page=${page}" class="btn-reply text-uppercase" 
					                  		style="float:right;margin-left:-23px">삭제</a>
					                  	<span class="btn-reply text-uppercase reply_update" data-no=${rvo.no } style="float:right;margin-left:-23px">수정</span>
				                  	</c:if>
				                  	<a href="#" class="btn-reply text-uppercase" style="float:right;">답변댓글</a>
				                  	</c:if>
			                    </div>
                              </div>
                           </div>
                           <!-- 댓글 수정 -->
			               <div class="comment-form up" id="u${rvo.no}" style="display:none;margin-bottom:30px;" >
			                  <form method="post" action="../qna/reply_update.do">
			                     <div class="row">
			                        <div class="col-12">
			                           <div class="form-group">
			                           	  <input type="hidden" name="no" value="${rvo.no }">
					        			  <input type="hidden" name="bno" value="${vo.no }">
					        			  <input type="hidden" name="page" value="${page }">
			                              <textarea class="form-control w-100" name="msg" cols="30" rows="9">${rvo.msg }</textarea>
					                     <div class="form-group mt-3">
					                        <input type=submit class="btn_3 button-contactForm" style="float:right;" value="수정"/>
					                     </div>
			                     		</div>
			                    	</div>
			                     </div>
			                  </form>
			               </div>
			               
                        </div>
                     </div>
                  </div>
                        </c:forEach>
               </div>
               <%--------------------------- 새댓글등록 --------------------------%>
               <c:if test="${sessionScope.id!=null }">
	               <div class="comment-form">
	                  <h4>댓글</h4>
	                  <form method="post" action="../qna/reply_insert.do">
	                     <div class="row">
	                        <div class="col-10">
	                        	<div class="form-group">
	                        		<textarea class="form-control w-100" name="msg" id="comment" cols="30" rows="9" placeholder="댓글을 입력해주세요"></textarea>
	                        	</div>
	                        </div>
	                        <div class="col-2">
	                        	<div class="form-group mt-3">
	                        		<input type="hidden" name="bno" value="${vo.no }">
									<input type="hidden" name="page" value="${page}">		
	                        		<input type="submit" class="btn_3 button-contactForm" value="등록">
			                    </div>
		                    </div>
	                     </div>
	                  </form>
	               </div>
               </c:if>
            </div>
      	</div>
      </div>
   </section>
   <!--================Blog Area end =================-->


</body>
</html>