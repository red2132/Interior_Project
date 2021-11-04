<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트-글쓰기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0; // 전역변수 
$(function(){
	$('#add').click(function(){
		$('#fileView').append(
		    '<tr id=m'+(fileIndex)+'>'
		  + '<td width=25% class="text-right">파일 '+(fileIndex+1)+'</td>'
		  + '<td width=75%><input type=file name=files['+fileIndex+'] size=20></td>'
		  + '</tr>'
		)
		fileIndex++;
	})
	$('#remove').click(function(){
		if(fileIndex>0)
		{
		   	$('#m'+(fileIndex-1)).remove();
		   	fileIndex--;
		}
	})
})
</script>
<style type="text/css">
#fileupload >label{
	margin-top:10px;
	margin-left:90%;
}
button{
	margin-left:500px !important;
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
	            <h3>작성</h3>
	            <form action="../event/insert_ok.do" method="post" enctype="multipart/form-data" > 
	              <div class="col-md-12 form-group p_star">
	                <input type="text" class="form-control" id="title" name="title" placeholder="제목*" required />
	              </div>
	              <div class="col-md-6 form-group p_star" style="width:567.5px;">
	                <input type="text" class="form-control" id="period1" name="period1" placeholder="시작 기간* (YY-MM-DD)" required />
	              </div>
	              <div class="col-md-6 form-group p_star" style="width:567.5px;">
	                <input type="text" class="form-control" id="period2" name="period2" placeholder="종료 기간* (YY-MM-DD)" required />
	              </div>
	              <div class="col-md-12 form-group p_star">
	                <textarea class="form-control" name="content" id="content" style="height:300px;" placeholder="내용" ></textarea>
	              </div>
	              <div class="col-md-12 form-group p_star">
	                <input type="text" class="form-control" name="poster" placeholder="대표 이미지 주소*" required />
	              </div>
	              <div class="col-md-12 form-group p_star">
	                <input type="text" class="form-control" name="img" placeholder="컨텐츠 이미지 주소" />
	              </div>
	              <div class="col-md-12 form-group p_star">
	                <input type="password" class="form-control" name="pwd" placeholder="비밀번호*" required />
	              </div>
	              <div class="col-md-12">
	              <table class="table">           
		           <tr>
		           	 <th>첨부파일</th>
		             <td class="text-right">
		              <input type=button value="+" class="genric-btn primary-border circle small" id="add">
		              <input type=button value="-" class="genric-btn primary-border circle small" id="remove">
		             </td>
		           </tr>
		          </table>
		          <table class="table" id="fileView"></table>
		          </div>
		          <!-- 첨부파일
	              <div class="col-md-12 form-group p_star" id="fileupload">
		            <input type="file" id="fileadd" style="display:none" onChange='fileUpload()'/>
					<input type="text" class="form-control" id="filename" name="filename" placeholder="첨부 파일" readonly/>
					<label class="genric-btn primary-border circle small" for="fileadd">
						파일 선택
					</label>	
		          </div>
		           -->
	              <div class="col-md-12">
	              <button class="genric-btn primary radius">작성</button>
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