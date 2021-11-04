<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#deleteBtn{
	margin-top:30px;
	margin-left:42% !important;
}
</style>
</head>
<body>

	<!-- breadcrumb start-->
	    <section class="breadcrumb breadcrumb_bg">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-lg-8">
	                    <div class="breadcrumb_iner">
	                        <div class="breadcrumb_iner_item">
	                            <h2>이벤트</h2>
	                            <p>공지사항<span>-</span>이벤트</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	 <!-- breadcrumb start-->
	    
	<!--================Checkout Area =================-->
	  <section class="checkout_area padding_top">
	    <div class="container">
	      <div class="billing_details">
	        <div class="row">
	          <div class="col-md-12">
	            <h3>삭제</h3>
	            <form action="../event/delete_ok.do" method="post">
	            	<input type=hidden name=no value="${no }" id="no">
	            	<input type=hidden name=page value="${page }" id="page">
	            	<div class="col-md-12 form-group p_star">
	                <input type="password" class="form-control" name="pwd" placeholder="비밀번호*" required style="width:500px;margin: 0 auto;" />
	              	</div>
	              	<div class="col-lg-12">
	              	    <input type=submit class="genric-btn primary radius" id="deleteBtn" value="삭제">
		            	<input type=button value="취소" class="genric-btn primary radius" 
		            	onclick="javascript:history.back()">
 		            </div>
	            </form>
	          </div>
	        </div>
	      </div>
	    </div>
	  </section>
	<!--================End Checkout Area =================-->
</body>
</html>