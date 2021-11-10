<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>
<c:if test="${sessionScope.id==null }">   
   <script>
		alert("로그인이 필요한 작업입니다 로그인을 해주세요!")
		history.back();
	</script>
 </c:if>

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>상품올리기</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding"
		style="margin-left: 700px;">
		<div class="container">
			<div class="row">
				<form method="post" action="../second/insert_ok.do">
					<div class="row">
						<select id="sel1" name=cate1>
							<option value="OA">OA</option>
							<option value="가전">가전</option>
							<option value="가정">가정</option>
							<option value="냉난방">냉난방</option>
							<option value="사무">사무</option>
						</select> <select id=sel2 name=cate2>
							<option value="컴퓨터/모니터">컴퓨터/모니터</option>
							<option value="복합기/프린터">복합기/프린터</option>
							<option value="프로젝터/스크린">프로젝터/스크린</option>
							<option value="전화기/세단기/기타">전화기/세단기/기타</option>
						</select> <select id=sel3 name=cate3>
							<option value="노트북">노트북</option>
							<option value="데스크탑">데스크탑</option>
							<option value="모니터">모니터</option>
						</select>
					</div>
					<div class="row" style="margin-top: 20px;">
						<input type=text name=title size=55 class="input-lg"
							placeholder="제목" />
					</div>
					<div class="row" style="margin-top: 20px;">
						<input type=text name=seller_id size=15 class="input-lg"
							placeholder="아이디" value="${sessionScope.id }" readonly />
					</div>
					<div class="row" style="margin-top: 20px;">
						<input type=text name=img size=55 id=imgs class="input-lg"
							placeholder="이미지링크" />
					</div>
					<div class="row" style="margin-top: 20px;">
						<img id=result src="">
					</div>
					<div class="row" style="margin-top: 20px;">
					<input type=button value="확인하기" id=btn1 style="margin-top: 10px;"
						onclick="printName()">
					</div>
					<div class="row" style="margin-top: 20px;">
						<input type=text name=price id=price size=20 class="input-lg"
							placeholder="가격" onBlur="parseelement(this)" /><span>&nbsp;</span>
					</div>
					<div class="row" style="margin-top: 20px;">
						<textarea rows="15" cols="77" name="cmt" placeholder="코멘트"></textarea>
					</div>
					<div class="row" style="margin-top: 20px;">
						<input type="submit" value="등록" style="margin-left:250px; border-style: none; border-radius: 7px; background-color: #FF1828; width:75px;height:40px; color:white; font-weight: bold;" > &nbsp; &nbsp;
						<input type=button value="취소" style="border-style: none; border-radius: 7px; background-color: #C3B9BA; width:75px;height:40px;color:white; font-weight: bold;"
							onclick="javascript:history.back()">
					</div>
				</form>
			</div>
		</div>
	</section>
</body>

<script>
function printName()  {
	  const imgs = document.getElementById('imgs').value;
	  console.log(imgs);
	  document.getElementById('result').src = imgs;	 	  
}

	//단위를 넣지 않으려면 '원' 표시를 지우세요
	var prefix="원"
	var wd
	function parseelement(thisone){
	if (thisone.value.charAt(0)=="원")
	return
	wd="w"
	var tempnum=thisone.value
	for (i=0;i<tempnum.length;i++){
	if (tempnum.charAt(i)=="."){
	wd="d"
	break
	}
	}
	
	if (tempnum.charAt(tempnum.length-2)=="."){
	thisone.value=tempnum+"0" +prefix
	}
	else{
	tempnum=Math.round(tempnum*100)/100
	thisone.value=tempnum+prefix
	}
	}
</script>

</html>