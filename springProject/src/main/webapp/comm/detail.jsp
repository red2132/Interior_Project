<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 상세보기</title>
<style type="text/css">
.comment-list{
	padding-bottom: 30px !important;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
let u=0;
let r=0;
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
	
	$('.updates').click(function(){
		$('.up').hide();
		$('.reply').hide();
		// 수정창을 연다 
		let no=$(this).attr("data-no");
		if(u==0) // show
		{
			$(this).text("");
			$('#u'+no).show();
			u=1;
		}
		else // hide
		{
			$('#u'+no).hide();
			$(this).text("");
			u=0;
		}
	})
	
	$('.replys').click(function(){
		$('.up').hide(); 
		$('.reply').hide();
		// 수정창을 연다 
		let no=$(this).attr("data-no");
		if(r==0) // show
		{
			$(this).text("");
			$('#r'+no).show();
			r=1;
		}
		else // hide
		{
			$('#r'+no).hide();
			$(this).text("");
			r=0;
		}
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
                     <table class="table col-lg-7">
							<tr class="active">
								<td class="text-center">${vo.hsize}</td>
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
				<c:if test="${vo.cnt!=0 }">
               	  <h4>${vo.cnt}&nbsp;Comments</h4>             	  
               	</c:if>
               	<c:if test="${vo.cnt==0 }">
               		<c:if test="${sessionScope.id==null}">
               			<h4>로그인 하시고 첫 댓글을 달아보세요!</h4>
               		</c:if>               		
               		<c:if test="${sessionScope.id!=null && sessionScope.admin=='n' }">
               	  		<h4>댓글을 달아주세요!</h4>
               		</c:if>
               	</c:if>              	
                  <!-- 댓글 출력 위치 -->
                  <c:forEach var="rvo" items="${rList }">
                  <div class="comment-list">
                  <div class="buttons_reply">
					<c:if test="${sessionScope.id!=null }">
                    <c:if test="${sessionScope.id==rvo.id }">
                         <a class="far fa-edit updates" data-no=${rvo.no } style="float:right; margin-top:3px; margin-left: 3px;"></a>
                         <a href="../comm/reply_delete.do?no=${rvo.no }&bno=${vo.no}&page=${page}"
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
                                       <a href="#">${rvo.id }</a>
                                    </h5>
                                    <p class="date" style="margin-top:10px;margin-left:10px !important;">${rvo.dbday }</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
               
               <!-- 댓글 수정 -->
               <div class="comment-form up" id="u${rvo.no}" style="display:none;margin-bottom:30px;" >
                  <form class="form-contact comment_form" method="post" action="../comm/reply_update.do">
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
                  <form class="form-contact comment_form" method="post" action="../comm/reply_reply_insert.do">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                           	  <input type="hidden" name="pno" value="${rvo.no }">
		        			  <input type="hidden" name="bno" value="${vo.no }">
		        			  <input type="hidden" name="page" value="${page }">
                              <textarea class="form-control w-100" name="msg" cols="30" rows="5"
                                 placeholder="대댓글 달기"></textarea>
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
                  <form class="form-contact comment_form" method="post" action="../comm/reply_insert.do">
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
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
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