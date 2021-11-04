<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
  margin: 0px auto;
  width:300px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.updates').click(function(){
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
 -->
</head>
<body>
	<!--================Home Banner Area =================-->
    <!--================Blog Area =================-->
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
								<td width="30%" class="text-center"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
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
									<a href="../qna/update.do?no=${vo.no }&page=${page }" class="btn btn-xs btn-info">수정</a>
									<a href="../qna/delete.do?no=${vo.no }&page=${page }" class="btn btn-xs btn-success">삭제</a>
									<a href="../qna/list.do?no=page=${page }" class="btn btn-xs btn-primary">목록</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
<!--
	<%-- 댓글 출력 --%>
	<div class="row">
		<table class="table">
			<tr>
				<td>
					<c:forEach var="rvo" items="${list }">
						<table class="table">
							<tr>
								<td class="text-left">
									<c:if test="${rvo.g_tab>0 }">
										<c:forEach var="i" begin="1" end="${rvo.g_tab }">
											&nbsp;&nbsp;
										</c:forEach>
										<img src="../qna/re_icon.png">
									</c:if>
									▼${rvo.name}(<span style="color:blue">${rvo.dbday }</span>)
								</td>
								<td class="text-left">
								  <c:if test="${sessionScope.id!=null }">
									<c:if test="${sessionScope.id==rvo.id }"> <%-- 작성자 본인일 때 댓글 수정/삭제 --%>
										<span class="btn btn-xs btn-danger" data-no="${rvo.no }">수정</span>
										<a href="../qna/reply_delete.do?no=${rvo.no }&bno=${vo.no}&page=${page}" class="btn btn-xs btn-danger">삭제</a>
									</c:if>
									<span class="btn btn-xs btn-info replys" data-no=${rvo.no }>답글</span>
								  </c:if>
								</td>
							</tr>
							<tr>
								<td colspan="2" valign="top">
								  <pre style="white-space:pre-wrap;background-color:white;border:none">${rvo.msg }</pre>
								</td>
							</tr>
						</table>
						<%-- 수정폼 --%>
						<table class="table up" style="display:none" id="u${rvo.no }">
							<tr>
								<td class="inline">
									<form method="post" action="../qna/reply_update.do">
										<input type="hidden" name="no" value="${rvo.no }">
										<input type="hidden" name="bno" value="${vo.no }"><%-- 게시물번호 --%>
										<input type="hidden" name="page" value="${page}">
										<textarea rows="4" cols="90" name="msg" style="float:left">${rvo.msg }</textarea>
										<input type="submit" value="댓글수정" class="btn btn-danger" style="height:80;float:left">						
									</form>
								</td>
							</tr>
						</table>
						<%-- 답글폼 --%>
						<table class="table reply" style="disply:none" id="r${rvo.no }">
							<tr>
								<td class="inline">
									<form method="post" action="../qna/reply_reply_insert.do">
										<input type="hidden" name="pno" value="${rvo.no }">
										<input type="hidden" name="bno" value="${vo.no }">
										<input type="hidden" name="page" value="${page}">
										<textarea rows="4" cols="90" name="msg" style="float:left"></textarea>
										<input type="submit" value="답글등록" class="btn btn-danger" style="height:80;float:left">						
									</form>
								</td>
							</tr>
						</table>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	<c:if test="${sessionScope.id!=null }"><%-- 로그인 된 상태 --%>
		<div class="row">
			<table class="table">
				<tr>
					<td class="inline">
						<form method="post" action="../qna/reply_insert.do">
							<input type="hidden" name="bno" value="${vo.no }">
							<input type="hidden" name="page" value="${page}">
							<textarea rows="4" cols="90" name="msg" style="float:left"></textarea>
							<input type="submit" value="댓글등록" class="btn btn-danger" style="height:80;float:left">						
						</form>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	 -->
</body>
</html>