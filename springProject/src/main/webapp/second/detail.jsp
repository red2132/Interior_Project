<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();

		//댓글 등록 버튼
		$('#insertBtn').click(function() {
			let msg = $('#msg').val();
			if (msg.trim() == "") {
				$('#msg').focus();
				return;
			}
			$('#replyForm').submit();
		})
		//댓글 수정 버튼
		$('#updateBtn').click(function() {

		})

	});
</script>


<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
	var websocket;
	function connection() {
		// websocket 등록 
		websocket = new WebSocket("ws://localhost:8080/web/chat-ws");
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;

	}
	function onOpen(event) {
		// 서버 연결
		alert("채팅 서버와 연결되었습니다!!");
	}
	function onMessage(event) {
		// 서버에 값을 전송
		var data = event.data;
		if (data.substring(0, 4) == "msg:") {
			// 100 LOGIN , 200 방만들기 
			appendMessage(data.substring(4));
		}
	}
	function onClose(event) {
		// 종료
		alert("채팅서버와 연결 종료되었습니다!!");
	}
	function disconnection() {
		// 서버연결 해제
		websocket.close();
	}
	function send() {
		// 전송 
		var name = $('#name').val();
		if (name.trim() == "") {
			$('#name').focus();
			return;
		}
		var msg = $('#sendMsg').val();
		if (msg.trim() == "") {
			$('#sendMsg').focus();
			return;
		}
		websocket.send("msg:[" + name + "]" + msg);
		$('#sendMsg').val("");
		$('#sendMsg').focus();

	}
	function appendMessage(msg) {
		// 채팅문자열을 결합 
		$('#recvMsg').append(msg + "<br>");
		var ch = $('#chatArea').height();
		var m = $('#recvMsg').height() - ch;
		$('#chatArea').scrollTop(m);
	}

	$(function() {
		$('#startBtn').click(function() {
			connection();
		});
		$('#endBtn').click(function() {
			disconnection();
		});
		$('#sendBtn').click(function() {
			send();
		})
		$('#sendMsg').keydown(function(key) {
			if (key.keyCode == 13) {
				send();
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
							<h2>Shop Single</h2>
							<p>${vo.title }
								<span>-</span> 상세보기
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!--================End Home Banner Area =================-->

	<!--================Single Product Area =================-->
	<div class="product_image_area section_padding">
		<div class="container">
			<div class="row s_product_inner justify-content-between">
				<div class="col-lg-7 col-xl-7">
					<div class="product_slider_img">
						<div id="vertical">
							<!-- 상품디테일/상품 이미지 -->
							<div data-thumb="img/product/single-product/product_1.png">
								<img src="${vo.img }" heigh=400px width=400px />
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-xl-4">
					<div class="s_product_text">
						<h3>${vo.title }</h3>
						<h2>${vo.price }</h2>
						<ul class="list">
							<li><a class="active" href="#"> <span>카테고리 </span> :
									${vo.cate1 }&nbsp;&gt;&nbsp;${vo.cate2 }&nbsp;&gt;&nbsp;${vo.cate3 }
							</a></li>
							<li><a href="#"> <span>Availibility</span> : In
									Stock??????????
							</a></li>
						</ul>
						<p>${vo.cmt }</p>
						<div
							class="card_area d-flex justify-content-between align-items-center">
							<div class="product_count">
								<span class="inumber-decrement"> <i class="ti-minus"></i></span>
								<input class="input-number" type="text" value="1" min="0"
									max="10"> <span class="number-increment"> <i
									class="ti-plus"></i></span>
							</div>
							<a href="#" class="btn_3">장바구니에 추가</a> <a href="#"
								class="like_us"> <i class="ti-heart"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">상품정보</a></li>
					<li><a href="#tabs-2">댓글</a></li>
					<li><a href="#tabs-3">채팅</a></li>
				</ul>
				<div id="tabs-1">
					<p>${vo.cmt }</p>
				</div>
				<div id="tabs-2">
					<%-- <div class="row">
						<div class="col-lg-6">
							<div class="review_list">
								<c:forEach var="rp" items="rList">
								<div class="review_item">
									<div class="media">
										<div class="d-flex"><img src="#" alt="" /></div>
										<div class="media-body">
											<h4 style="display: inline;">달러{sessionScop.name }</h4>
											<span style="float: right;margin-right: 10%">
											달러{rp.regdate }
											</span>
										</div>
									</div>
									<p>달러{rp.content }</p>
									<c:if test="달러{sessionScope.id==rp.id}">
									<div style="float: right">
										<input type="button" value="수정" id="updateBtn">
										<input type="button" value="삭제" id="deleteBtn">
									</div>
									</c:if>
								</div>
								</c:forEach>
 							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<c:if test="${sessionScope.id==null }">
								<p>로그인시 댓글 입력이 가능합니다.</p>
								</c:if>
								<c:if test="${sessionScope.id==null }">나중에 낫널로 바꾸기
								<p>댓글 입력</p>
								<form class="row contact_form" action="#"
									method="post" novalidate="novalidate">
									<input type="hidden" name="item_no" value=${vo.no }>
									<input type="hidden" name="cateStr" value="second">
									<!-- id, name은 세션에서, regdate는 시스템데이트 -->
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="content" cols="100" rows="5"
												placeholder="댓글 입력" id="msg"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="submitBtn">
											등록</button>
									</div>
								</form>
								</c:if>
							</div>
						</div>
					</div> --%>
				</div>
				<div id="tabs-3">
					<p>채팅창 넣기</p>

				</div>
			</div>
		</div>
	</section>
	<!--================tabs =================-->
	<div class="col-lg-2"></div>
	<div>위에 탭 나중에 손보기</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<div class="container">
		<div class="col-lg-7 col-xl-7">
			상세정보<br> 상세정보<br> 상세정보<br> 상세정보<br> 상세정보<br>
			상세정보<br> 상세정보<br> 상세정보<br> 상세정보<br> 상세정보<br>
			상세정보<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br>
		</div>






		<div class="col-lg-5 col-xl-5">
			<a href="../chat/chat.do">채팅 </a>

			<!-- 채 -->

			<h1>채팅</h1>
			<div class="row">
				<table class="table">
					<tr>
						<td class="inline">이름:<input type=text id="name"
							class="input-sm"> <input type="button" id="startBtn"
							value="입장" class="btn btn-sm btn-primary"> <input
							type="button" id="endBtn" value="퇴장"
							class="btn btn-sm btn-danger">
						</td>
					</tr>
					<tr>
						<td>
							<div
								style="height: 150px; overflow-y: auto; border: 1px solid black;">
								<div id="recvMsg"></div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="inline"><input type=text id="sendMsg" size=50
							class="input-sm"> <input type=button id="sendBtn"
							value="전송" class="btn btn-sm btn-success"></td>
					</tr>
				</table>
			</div>

			<!-- 채팅 -->


		</div>
	</div>

	<div style="color: red">임시로</div>
	<hr style="border-color: red">
	<br>
	<br>
	<br>
	<br>

	<div class=container>
		<div class="row">
			<div class="col-lg-6">
				<div class="review_list">
					<c:if test="${rCnt==0}">
						<h4>댓글이 없습니다.</h4>
					</c:if>
					<c:if test="${rCnt!=0}">
						<h4>(${rCnt })개의 댓글이 있습니다.</h4>
					</c:if>
					<br>
					<c:forEach var="rp" items="${rList }">
						<div class="review_item">
							<div class="media">
								<div class="d-flex">
									<img src="#" alt="" />
								</div>
								<div class="media-body">
									<h4 style="display: inline;">${rp.id }</h4>

									<span style="float: right; margin-right: 10%">
										${rp.dbday } </span>
								</div>
							</div>

							<p>${rp.content }</p>
							<c:if test="${sessionScope.id==rp.id}">
								<div style="float: right">
									<input type="button" value="수정" id="updateBtn">
									<form method=post action="../second/replyDelete.do"
										style="float: right">
										<input type="hidden" name=no value="${vo.no }"> <input
											type="hidden" name=rno value="${rp.no }"> <input
											type="button" value="수정" id="deleteBtn">
									</form>
									<form method=post action="../second/replyDelete.do"
										style="float: right">
										<input type="hidden" name=no value="${vo.no }"> <input
											type="hidden" name=rno value="${rp.no }"> <input
											type="submit" value="삭제" id="deleteBtn">
									</form>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>


			<div class="col-lg-6">
				<div class="review_box">
					<c:if test="${sessionScope.id==null }">
						<p>로그인시 댓글 입력이 가능합니다.</p>
					</c:if>
					<c:if test="${sessionScope.id!=null }">
						<p>댓글 입력</p>
						<form class="row contact_form" action="../second/replyInsert.do"
							method="post" novalidate="novalidate" id="replyForm">

							<input type="hidden" name="item_no" value=${vo.no }> <input
								type="hidden" name="cate" value="second">
							<!-- id, name은 세션에서, regdate는 시스템데이트 -->
							<input type="hidden" name="id" value=${sessionScope.id }>
							<input type="hidden" name="pwd" value="1234"> <input
								type="hidden" name="name" value=${sessionScope.name }>
							<div class="col-md-12">
								<div class="form-group">
									<textarea class="form-control" name="content" cols="100"
										rows="5" placeholder="댓글 입력" id="msg"></textarea>
								</div>
							</div>
							<div class="col-md-12 text-right">
								<!-- <input type="submit" value="등록" class="insertBtn"> -->
								<button type="button" id="insertBtn">등록</button>
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>




	<!-- 다이얼로그 -->
	<div id="DELETEdialog" title="" style="display: none">

		<table class="table">
			<tr>
				<th width=20% align="right">ID</th>
				<td width=80%><input type=text id="login_id" size=15
					class="input-sm"></td>
			</tr>
			<tr>
				<th width=20% align="right">PW</th>
				<td width=80%><input type=password id="login_pwd" size=15
					class="input-sm"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type=button value="로그인"
					id="logBtn" style="float: left"> <input type=button
					value="취소" id="canBtn" style="float: left"></td>
			</tr>
		</table>

	</div>

</body>
</html>