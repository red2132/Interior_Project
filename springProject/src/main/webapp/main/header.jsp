<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
$(function(){
	$('#login').click(function(){
		$("#dialog").dialog({
	    	autoOpen : false,
	        width : 280,
	        height : 230,
	        modal : true
	    }).dialog("open");
	});
   
	$('#canBtn').click(function(){
		$('#dialog').dialog("close");
	});
   
	$('#logBtn').click(function(){
		let id = $('#login_id').val();
		if(id.trim() == "")
		{
			$('#login_id').focus();
			return; 
		}
		let pwd = $('#login_pwd').val();
		if(pwd.trim() == "")
		{
			$('#login_pwd').focus();
			return;
		}

		$.ajax({
			type : 'post',
			url : '../member/login_ok.do',
			data : {"id" : id, "pwd" : pwd},
			success : function(res)
			{
				let result = res;
				if(result == 'NOID')
				{
					alert("아이디가 존재하지 않습니다.\n다시 입력하세요!");
					$('#login_id').val("");
					$('#login_pwd').val("");
					$('#login_id').focus();
				}
				else if(result == 'NOPWD')
				{
					alert("비밀번호가 틀립니다.\n다시 입력하세요!");
					$('#login_pwd').val("");
					$('#login_pwd').focus();
				}
				else
				{
					location.href = "../main/main.do";
				}
			}
		})
	});
	
	$('#logout').click(function(){
		location.href="../member/logout.do";
	});

});
</script>
</head>
<body>
<!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="../main/main.do"> <img src="../template/img/logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="../main/main.do">Home</a>
                                </li>
                                <!-- 인기상품 -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        인기상품
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                    	<%-- <c:forEach var="c1" items="${cateList }">
                                        	<a class="dropdown-item" href="../new/list.do?cate1=${c1 }">${c1 }</a>
                                        </c:forEach> --%>
                                        
                                        <a class="dropdown-item" href="../new/list.do?cate1=가구&sort=0">가구</a>
                                        <a class="dropdown-item" href="../new/list.do?cate1=가전&sort=0">가전</a>
                                        <a class="dropdown-item" href="../new/list.do?cate1=공구&sort=0">공구</a>
                                        <a class="dropdown-item" href="../new/list.do?cate1=리모델링&sort=0">리모델링</a>
                                        <a class="dropdown-item" href="../new/list.do?cate1=생활&sort=0">생활</a>
                                        <a class="dropdown-item" href="../new/list.do?cate1=조명&sort=0">조명</a>
                                        <a class="dropdown-item" href="../new/list.do?cate1=침구&sort=0">침구</a>
                                        <a class="dropdown-item" href="../new/list.do?cate1=패브릭&sort=0">패브릭</a>
                                    </div>
                                </li>
                                <!-- 인테리어 커뮤니티 -->
                                	<li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="../template/blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        인테리어
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="#"> 인테리어</a> <!-- 인테리어 업체 및 시공사례 -->
                                        <a class="dropdown-item" href="#"> 시공견적</a> <!-- 시공견적은 업체 평수당 단가기준으로 -->
                                    	<a class="dropdown-item" href="../comm/list.do"> 커뮤니티</a> <!-- 인테리어 정보 공유 커뮤니티 -->
                                    </div>
                                </li>
                                <!-- 중고거래 -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="../second/list.do?cate1=OA" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        중고거래
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                    	<%-- <c:forEach var="cate" items="${secondCateList }">
                                        	<a class="dropdown-item" href="../second/list.do?cate1=${cate }">${cate }</a>
                                        </c:forEach> --%>
                                        <a class="dropdown-item" href="../second/list.do?cate1=OA">OA</a>
                                        <a class="dropdown-item" href="../second/list.do?cate1=가전">가전</a>
                                        <a class="dropdown-item" href="../second/list.do?cate1=가정">가정</a>
                                        <a class="dropdown-item" href="../second/list.do?cate1=냉난방">냉난방</a>
                                        <a class="dropdown-item" href="../second/list.do?cate1=사무">사무</a>
                                    </div>
                                </li>
                                <!-- QNA -->
                                <li class="nav-item">
                                	<!-- QnA 모아보기(비밀게시글은 admin,본인만 보기 가능 / 분류별 글쓰기(배송,물품,시공,등등...) / 검색가능(제목,내용) / 첫페이지는 모두 출력, 분류 선택시 해당 분류 문의만 모아보기) -->
                                    <a class="nav-link" href="../qna/list.do">QnA</a>
                                </li>
                                <!-- 이벤트 -->
                                <li class="nav-item">
                                	<!-- QnA 모아보기(비밀게시글은 admin,본인만 보기 가능 / 분류별 글쓰기(배송,물품,시공,등등...) / 검색가능(제목,내용) / 첫페이지는 모두 출력, 분류 선택시 해당 분류 문의만 모아보기) -->
                                    <a class="nav-link" href="../event/list.do">이벤트</a>
                                </li>
                                <li class="nav-item dropdown"> 
                                    <!-- 회원(로그인 X) -->
                                    <c:if test="${sessionScope.id==null }">
                                    <a class="nav-link dropdown-toggle" href="../template/blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        회원</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="../member/join.do">회원가입</a>
                                        <a class="dropdown-item" href="../member/idfind.do">아이디찾기</a> 
                                        <a class="dropdown-item" href="../member/pwdfind.do">비밀번호찾기</a> 
                                    </div>
                                    </c:if>
                                   
                                    <!-- 마이페이지(로그인 O) -->
                                    <c:if test="${sessionScope.id!=null && sessionScope.admin=='n' }">
                                    	<a class="nav-link dropdown-toggle" href="../template/blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        마이페이지</a>
		                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
		                                        <a class="dropdown-item" href="../page/mypage.do">마이페이지</a>
		                                        <a class="dropdown-item" href="../page/mybuypage.do">구매내역</a>
		                                        <a class="dropdown-item" href="../page/mysellpage.do">판매내역</a>
		                                        <a class="dropdown-item" href="../member/join_update.do">회원정보수정</a>
		                                        <a class="dropdown-item" href="../member/join_delete.do">회원탈퇴</a>
		                                     </div>
                                       </c:if>
                                        
                                        <c:if test="${sessionScope.id!=null && sessionScope.admin=='y' }">
                                        <a class="nav-link dropdown-toggle" href="../template/blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        관리자페이지
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="../page/mypage.do">마이페이지</a>
                                        <a class="dropdown-item" href="../page/adminpage.do">관리자페이지</a>
                                    </div>
                                   </c:if>   
                                </li>
                            </ul>
                        </div>
                        <div class="hearer_icon d-flex">
							<c:if test="${sessionScope.id==null }">
								<!-- <i class="ti-pencil"></i><a href="../member/join.do" style="color:#000000">&nbsp;회원가입</a>
								&nbsp;&nbsp; -->
								<i class="ti-unlock"></i><a href="#" id="login" style="color:#000000" >로그인</a>
								<!-- <li><a href="#" id="login">로그인</a></li> -->
							</c:if>
							<c:if test="${sessionScope.id!=null }">
								<!-- <i class="ti-user"></i><a href="../page/mypage.do" style="color:#000000">&nbsp;마이페이지</a>
								&nbsp;&nbsp; -->
								<i class="ti-lock"></i><a href="../member/logout.do" style="color:#000000">로그아웃</a>
							</c:if>
					</div>
					<c:if test="${sessionScope.id!=null && sessionScope.admin=='n' }">
					 <div class="dropdown cart">
                                <a class="dropdown-toggle" href="../page/mycartpage.do">
                                <!-- <a class="dropdown-toggle" href="../page/mycartpage.do" id="navbarDropdown3" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
                                    <i class="fas fa-cart-plus"></i>
                                </a>
                            </div>
					</c:if>
					<div class="hearer_icon d-flex">
							<a id="search_1" href="javascript:void(0)" style="color:#000000"><i class="ti-search"></i>검색</a>
								&nbsp;&nbsp;
                            
                             </div>
                           
                            
                            
                       
                    </nav>
                </div>
            </div>
        </div>
        <div class="search_input" id="search_input_box">
            <div class="container ">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>
    <!-- Header part end-->
    <div id="dialog" title="로그인" style="display:none">
  
  <table class="table">
   <tr>
    <th width=20% align="right">ID</th>
    <td width=80%><input type=text id="login_id" size=15 class="input-sm"></td>
   </tr>
   <tr>
    <th width=20% align="right">PW</th>
    <td width=80%><input type=password id="login_pwd" size=15 class="input-sm"></td>
   </tr>
   <tr>
     <td colspan="2" align="center">
      <input type=button value="로그인" id="logBtn" style="float: left">
      <input type=button value="취소" id="canBtn" style="float: left">
     </td>
   </tr>
  </table>
 
</div>
</body>
</html>