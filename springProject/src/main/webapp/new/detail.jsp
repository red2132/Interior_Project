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
<script type="text/javascript">

let u = 0;// 전역변수
$(function(){	
	$('#cartInsertBtn').click(function(){
		$('#replyForm').submit();
	});
	
	$('#insertBtn').click(function(){
		$('#cartInsertFrm').submit();
	});
	
	$('#sel').change(function(){
		let count=$(this).val();
		let price=$('#price').text();
		let total=parseInt(count)*parseInt(price)+3000;
		$('#total').text(total+"원");
		$('#amount').val(count);
	})
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
							<h2>Shop Category</h2>
							<p>
								인기상품 <span><i class="ti-arrow-right"></i></span> ${cate1 } <span><i
									class="ti-arrow-right"></i></span> ${cate2 }
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
				<div class="col-lg-6 col-xl-6">
					<div class="product_slider_img">
						<div id="vertical">
							<!-- 상품디테일/상품 이미지 -->
							<div data-thumb="${vo.img }">
								<img src="${vo.img }" width="400px" height="400px" />
							</div>

						</div>
					</div>
				</div>
				<div class="col-lg-6 col-xl-6">
					<div class="s_product_text">
						<h3>${vo.title }</h3>
						<h2 id="price">${vo.price }원</h2>
						<ul class="list">
							<li><a class="active" href="#"> <span>카테고리 </span> :
									${cate1 } <i class="ti-arrow-right"></i> ${cate2 }
							</a></li>
							<li><a href="#"> <span>Availibility</span> : In Stock
							</a></li>
						</ul>
						<p>${vo.cmt }</p>
						<div
							class="card_area d-flex justify-content-between align-items-center">

							<c:if test="${sessionScope.id==null }">
								<h5 style="color: red">로그인시 장바구니 이용이 가능합니다.</h5>
							</c:if>
							<c:if test="${sessionScope.id!=null }">

							<!-- 	<form method="post" action="../cart/cartInsert.do">  -->
									<input type=hidden name=no value=${vo.no }> <input
										type=hidden name=cate1 value=${cate1 }> <input
										type=hidden name=cate2 value=${cate2 }>
									<!-- <div class="product_count" style="display:inline;">
										<span class="inumber-decrement"> <i class="ti-minus"></i></span>
										<input class="input-number" type="text" value="1" min="0" max="10" name=amount>
											<span class="number-increment"><i class="ti-plus"></i>
										</span>
									</div> -->
									<select id="sel">
						            	<c:forEach var="i" begin="1" end="10">
						            		<option value="${i}">${i}개</option>
						            	</c:forEach>
						            </select> 
									
							<!-- ################################################################# -->
							<!-- ################################################################# -->
									<form id="cartInsertFrm" method="post" action="../new/cart_ok.do">
		       						<%-- <input type=hidden name="product_id" value="${vo.product_id }"> --%>
		       						<input type=hidden name="product_id" value="${vo.no }">
							        <input type=hidden name="amount" value="" id="amount">
							        <input type="submit" id="cartInsertBtn" class=btn_3 value="장바구니">
							        </form>
								   <!-- <input type=submit value="장바구니에 추가" class=btn_3> -->
							<!-- ################################################################# -->
							<!-- ################################################################# -->
							   		
									
									
									
								<!--</form>-->
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<!--  댓글 -->

	<div class=container>
		<div class="row">
			<div class="col-lg-6">
				<div class="review_list">
					<c:if test="${rCnt==0}">
						<h4>댓글이 없습니다.</h4>
					</c:if>
					<c:if test="${rCnt!=0}">
						<h4>${rCnt }개의 댓글이있습니다.</h4>
						<!-- rCnt 댓글 갯수 -->
					</c:if>
					<br>
					<c:forEach var="rvo" items="${rList }">
						<!--model.addAttribute("rList", rList);  -->
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
									<a href="../new/replyDelete.do?no=${vo.no }&rno=${rvo.no}"
										class="btn btn-xs">삭제</a>
								</div>
							</c:if>
							<table class="table up" style="display: none" id="u${rvo.no }">
								<tr>
									<td class="inline">
										<form method="post" action="../new/replyUpdate.do">
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
						<form class="row contact_form" action="../new/replyInsert.do"
							method="post" novalidate="novalidate" id="replyForm">
							<input type="hidden" name="item_no" value=${vo.no }> <input
								type="hidden" name="cate" value="new"> <input
								type="hidden" name="id" value=${sessionScope.id }> <input
								type="hidden" name="pwd" value="1234"> <input
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
	<!--================End Product Description Area =================-->
	<!-- 연관 베스트 상품 목록 출력 start-->
  	<section class="product_list best_seller">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="section_tittle text-center">
            <h2>연관 베스트 상품 추천</h2> 
          </div>
        </div>
      </div>
      <div class="row align-items-center justify-content-between">
        <div class="col-lg-12">
          <div class="best_product_slider owl-carousel">
            <c:forEach var="list" items="${bestList }" begin="1" end="10">
	            <div class="single_product_item">
	              <a href="../new/detail.do?no=${list.no }">
		              <img src="${list.img }" alt="">
		              <div class="single_product_text">
		                <h4>${list.title }</h4>
		                <h3>${list.price }원</h3>
		              </div>	
	              </a>
	            </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 베스트 아이템 목록 출력 end-->

</body>
</html>