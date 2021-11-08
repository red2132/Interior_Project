<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
  margin: 0px auto;
  width:1000px;
}
</style>
</head>
<body>

	<div class="bgded overlay">
		<div id="breadcrumb" class="hoc clear"> 
		</div>
	</div>
	
	<div style="height:112px"></div>
	
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

	<div class="wrapper row3">
		<main class="hoc container clear">
			<h1 class="text-center">마이 페이지</h1>
			
			<div class="row">
			<div style="height:50px"></div>
			<h3>내 게시글</h3>
	    		<table class="table">
	      			<tr>
	        			<th class="text-center" width=20%>번호</th>
	        			<th class="text-center" width=55%>제목</th>
	        			<th class="text-center" width=25%>등록일</th>
	      			</tr>
	      			<c:forEach var="cvo" items="${cList}">
	        			<tr>
	          				<td class="text-center">${cvo.no}</td>
	          				<td>${cvo.subject}</td>
	          				<td class="text-center">${cvo.dbday}</td>
	        			</tr>
	      			</c:forEach>
	    		</table>
	  		</div>
	  		
	  		<div style="height:25px"></div>
	  		
	  		<div class="row">
			<div style="height:50px"></div>
			<h3>내 댓글</h3>
	    		<table class="table">
	      			<tr>
	        			<th class="text-center" width=20%>번호</th>
	        			<th class="text-center" width=55%>내용</th>
	        			<th class="text-center" width=25%>등록일</th>
	      			</tr>
	      			<c:forEach var="rvo" items="${rList}">
	        			<tr>
	          				<td class="text-center">${rvo.no}</td>
	          				<td>${rvo.msg}</td>
	          				<td class="text-center">${rvo.dbday}</td>
	        			</tr>
	      			</c:forEach>
	    		</table>
	  		</div>
	  		
	  		<div style="height:25px"></div>
	  		
	  		<div class="row">
			<div style="height:50px"></div>
			<h3>내 지역 설정</h3>
				<div class="container">
					<p>※ 현재 내 지역 설정은 주소지 기준으로만 설정 가능합니다.</p>
					<div class="panel panel-default">
						<div class="panel-heading">주소지 목록</div>
						<div class="panel-body">
							<ul>
								<li>${addr_data1}&nbsp;${addr_data2}</li>
							</ul>
						</div>
					</div>
					<a href="../member/join_update.do">
						<input type="button" style="float:right;" class="btn btn-xs btn-primary" value="수정하기">
					</a>
				</div>
			</div>
			
	  		<div style="height:50px"></div>
	  		
	  		<div class="row">
			<div style="height:50px"></div>
			<h3>내 관심사</h3>
			
			</div>
	  		
	  	</main>
	</div>  
</body>
</html>