<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
$(function(){
	$('#delBtn').click(function(){
		$("#checkDialog").dialog({
	    	autoOpen : false,
	        width : 400,
	        height : 180,
	        modal : true
	    }).dialog("open");
	});
   
	$('#noBtn').click(function(){
		$('#checkDialog').dialog("close");
	});
   
	$('#okBtn').click(function(){
		let pwd=$('#check_pwd').val();
		if(pwd.trim()=="")
		{
			$('#check_pwd').focus();
			return; 
		}
		let no=$('#no').val();
		let page=$('#page').val();
		$.ajax({
			type:'get', 
			url:'../comm/delete_ok.do',
			data:{"no":no,"pwd":pwd},
		    success:function(res)
		    {
		    	let result=res
		    	//let result=Number(res.trim());
		    	if(result==0)
		    	{
		    		alert("비밀번호가 틀립니다!!");
		    		$('#check_pwd').val("");
		    		$('#check_pwd').focus();
		    	}
		    	else
		    	{
		    		location.href="../comm/list.do?page="+page;//정상수행시에 목록으로 이동 
		    	}
		    }
		})
	})
})
</script>
<style type="text/css">
.progress-table {
    width: 50px;
  }
</style>
</head>
<body>
   <!--================Blog Area =================-->
   <section class="blog_area single-post-area padding_top">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="feature-img">
                     <img class="img-fluid" src="${vo.filename }" alt="">
                  </div>
                  <div class="blog_details">
                     <h2>${vo.subject } </h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><i class="far fa-user"></i>${vo.id}</a></li>
                         <li>${vo.dbday }</li>
                     </ul>                         
                     <p class="excert">
                     <table class="progress-table col-lg-7">
							<tr>
								<td class="text-center" height="60px">${vo.hsize}</td>
								<td class="text-center">${vo.hstyle}</td>
								<td class="text-center">${vo.rstyle}</td>
								<td class="text-center">${vo.family}</td>
							</tr>
						</table>
						</p>
						<p class="excert">
                        ${vo.content }
                     </p>
                  </div>
               </div>
               <div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"></span></p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="far fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     	<a href="list.do?page=${page }" class="genric-btn success">목록</a>
                      <c:if test="${sessionScope.id!=null && sessionScope.admin=='n' }">
                      	<c:if test="${sessionScope.id==vo.id }">
							<a href="update.do?no=${vo.no }&page=${page}" class="genric-btn info">수정</a>
							<a href="#" id="delBtn"  class="genric-btn danger">삭제</a>
						</c:if>
					</c:if>
                  </div>
               </div>
               <div class="comments-area">
                  <h4>05 Comments</h4>
                 <c:forEach var="rvo" items="${rList }">
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="img/comment/comment_1.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                 ${rvo.msg }
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>${rvo.id }</h5>
                                    <p class="date">${rvo.dbday } </p>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                </c:forEach>
               </div>
               
              <c:if test="${sessionScope.id!=null }">
               <div class="comment-form">
                  <form method="post" action="../comm/reply_insert.do">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                           	  <input type="hidden" name="bno" value="${vo.no }">
                           	  <input type="hidden" name="page" value="${page }">
                           	  <input type="hidden" name="id" value="${sessionScope.id }">
                              <textarea class="form-control w-100" name=msg id="msg" cols="30" rows="9"
                                 placeholder="Write Comment"></textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group mt-3">
                        <button class="btn_3 button-contactForm">댓글쓰기</button>
                     </div>
                  </form>
               </div>
              </c:if>
            </div>
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
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
                  <aside class="single_sidebar_widget tag_cloud_widget">
                     <h4 class="widget_title">Tag Clouds</h4>                    
                     <ul class="list">
                     	<c:forTokens items="${vo.tags} " delims="#" var="tag">                   	
                        <li>                       	
                         	<a href="tag.do?tag=${tag }">${tag}</a>                      	
                        </li>                      
                        </c:forTokens>
                     </ul>
                  </aside>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Header part end-->
    <div id="checkDialog" title="비밀번호 확인" style="display:none">
  
  <table class="table">
   <tr>
    <th width=40% align="right">비밀번호 확인</th>
    <td width=60%><input type=password id="check_pwd" size=15 class="input-sm">
    	 <input type=hidden name=no value="${vo.no }" id="no">
	     <input type=hidden name=page value="${page }" id="page">
    </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
      <input type=button value="입력" id="okBtn" style="float: left">
      <input type=button value="취소" id="noBtn" style="float: left">
     </td>
   </tr>
  </table>
 
</div>
</body>
</html>