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
	let u = 0;// 전역변수
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
		//댓글 수정
		$('.updates').click(function() {
			$('.up').hide();// 출력된 수정창을 닫는다
			let no = $(this).attr("data-value"); // 출력할 위치를 확인 (어떤것이 수정할 지 확인 )
			if (u == 0) // 열고
			{
				u = 1; // 닫기
				$('#u' + no).show();
				$(this).text("취소");
			} else // 닫기
			{
				u = 0; // 열기 
				$('#u' + no).hide();
				$(this).text("수정");
			}
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
								<img src="${vo.img }" heigh=700px width=600px />
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-xl-5">
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
						<div class="card_area d-flex justify-content-between align-items-center">
							<!-- <div class="product_count">
								<span class="inumber-decrement"> <i class="ti-minus"></i></span>
								<input class="input-number" type="text" value="1" min="0"
									max="10"> <span class="number-increment"> <i
									class="ti-plus"></i></span>
							</div> -->
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
<hr>

	<div class="container">
		<div class="col-lg-7 col-xl-7">
			${vo.cmt }
			<br> <br> <br>
			상세정보<br> 상세정보<br> 상세정보<br> 상세정보<br> 상세정보<br>
			상세정보<br> 상세정보<br> 상세정보<br> 상세정보<br> 상세정보<br>
			상세정보<br> <br> <br> <br> <br> <br> <br>
			
		</div>

		<div class="col-lg-5 col-xl-5">
			<a href="../chat/chat.do">채팅 </a>
			
			<!-- 채팅~! -->

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
	<div class="col-lg-1">
	</div>
	<div style="color: red">Comments(${rCnt })</div>
	<hr>

	<div class=container>
		<div class="row">
			<div class="col-lg-6">
				<div class="review_list">
					<c:if test="${rCnt==0}">
						<h4>댓글이 없습니다.</h4>
					</c:if>
					<c:if test="${rCnt!=0}">
						<h4>${rCnt }개의 댓글이 있습니다.</h4>
					</c:if>
					<br>
					<c:forEach var="rvo" items="${rList }">
						<div class="review_item">
							<div class="media">
								<div class="d-flex">
									<img src="#" alt="" />
								</div>
								<div class="media-body">
									<h4 style="display: inline;">${rvo.id }</h4>
									<span style="float: right; margin-right: 10%">
										${rvo.dbday } </span>
								</div>
							</div>
							<p>${rvo.content }</p>
							<c:if test="${sessionScope.id==rvo.id}">
								<div style="float: right">
									<span class="btn btn-xs updates" data-value="${rvo.no }">수정</span>
									<a href="../second/replyDelete.do?no=${vo.no }&rno=${rvo.no}" class="btn btn-xs">삭제</a>
								</div>
							</c:if>
							<table class="table up" style="display: none" id="u${rvo.no }">
								<tr>
									<td class="inline">
										<form method="post" action="../second/replyUpdate.do">
											<input type=hidden name="no" value="${vo.no }"> <input
												type=hidden name="rno" value="${rvo.no }">
											<textarea rows="5" cols="70" name="content"
												style="float: left">${rvo.content }</textarea>
											<input type=submit value="댓글수정"
												style="height: 105px; float: left" class="btn btn-danger">
										</form>
									</td>
								</tr>
							</table>
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
								<button type="button" id="insertBtn">등록</button>
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>