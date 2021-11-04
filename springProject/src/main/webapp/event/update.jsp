<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트-글수정</title>
<style type="text/css">
#updateBtn{
	margin-left:40% !important;
}
.country_select{
    width: 100% !important;
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
	            <h3>수정</h3>
	            <form action="../event/update_ok.do" method="post">
	              <div class="col-md-6 form-group p_star" >
	              	<input type=hidden name=no value="${vo.no }" id="no">
	              	<input type=hidden name=page value="${page }" id="page">
		            <div class="radion_btn">
	                  <input type="radio" id="ing" name="state" value="진행중" ${vo.state=='진행중'?"checked":"" } />
	                  <label for="ing" >진행중</label>
	                  <div class="check"></div>
	                </div>
	                <div class="radion_btn">
	                  <input type="radio" id="end" name="state" value="종료" ${vo.state=='종료'?"checked":"" } />
	                  <label for="end" >종료</label>
	                  <div class="check"></div>
	                </div>
	              </div> 
	              <div class="col-md-12 form-group p_star">
	                <input type="text" class="form-control" id="title" name="title" value="${vo.title }" required />
	              </div>
	              <div class="col-md-6 form-group p_star" style="width:567.5px;">
	                <input type="text" class="form-control" id="period1" name="period1" value="${period1 }" required />
	              </div>
	              <div class="col-md-6 form-group p_star" style="width:567.5px;">
	                <input type="text" class="form-control" id="period2" name="period2" value="${period2 }" required />
	              </div>
	              <div class="col-md-12 form-group p_star">
	                <textarea class="form-control" name="content" id="content" style="height:300px;" >${vo.content }</textarea>
	              </div>
	              <div class="col-md-12 form-group p_star">
	                <input type="text" class="form-control" name="poster" value="${vo.poster }" required />
	              </div>
	              <div class="col-md-12 form-group p_star">
	                <input type="text" class="form-control" name="img" value="${vo.img }" />
	              </div>
	              <div class="col-md-12 form-group p_star">
	                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호*" required />
	              </div>
	              <div class="col-md-12">
	              <input type=submit class="genric-btn primary radius" id="updateBtn" value="수정">
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