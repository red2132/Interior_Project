<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.form-group p_star{
   display:inline;
}
</style>
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
	});
	$('#remove').click(function(){
		if(fileIndex>0)
		{
		   	$('#m'+(fileIndex-1)).remove();
		   	fileIndex--;
		}
	})
});
</script>
</head>
<body>
 <!--================Home Banner Area =================-->
  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>당신의 집을 소개해주세요!</h2>
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
          <div class="col-lg-12">
             <form method="post" action="../comm/update_ok.do">
              <div class="col-md-4 form-group p_star">
               <h3>주거형태</h3>
                <select class="country_select" name="hstyle" value="${vo.hstyle }">
                  <option value="아파트">아파트</option>
                  <option value="단독주택">단독주택</option>
                  <option value="원룸&오피스텔">원룸&오피스텔</option>
                  <option value="기타">기타</option>
                </select>
              </div>
              <div class="col-md-4 form-group p_star" >
               <h3>리모델링 방법</h3>
                <select class="country_select" name="rstyle" value="${vo.rstyle }">
                  <option value="홈스타일링">홈스타일링</option>
                  <option value="리모델링">리모델링</option>
                  <option value="부분공사">부분공사</option>
                  <option value="건축">건축</option>
                </select>
              </div>             
              <div class="col-md-4 form-group p_star">
              <h3>가족구성</h3>
                <select class="country_select" name="family" value="${vo.family }">
                  <option value="아기가있는집">아기가있는집</option>
                  <option value="신혼부부">신혼부부</option>
                  <option value="취학자녀와함께">취학자녀와함께</option>
                  <option value="싱글라이프">싱글라이프</option>
                  <option value="기타">기타</option>
                </select>
              </div>
              <h3>평수</h3>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" name="hsize" placeholder="평수 입력"  value="${vo.hsize }"/>
                <input type=hidden name=no value="${vo.no }" id="no">
         		<input type=hidden name=page value="${page }" id="page">
              </div>
              <h3>글작성</h3>
              <div class="col-md-6 form-group">
                <input type="text" class="form-control" name="id" placeholder="아이디 입력" value="${vo.id }"/>
              </div>
              <div class="col-md-6 form-group">
                <input type="text" class="form-control" name="pwd" placeholder="비밀번호 입력"/>
              </div>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" name="subject" placeholder="제목 입력" value="${vo.subject }"/>
              </div>
               <div class="col-md-12 form-group">
                <textarea class="form-control" name="content" rows="5" placeholder="내용 입력" value="${vo.content }">
                </textarea>
             </div>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" name="tags" placeholder="태그 입력" value="${vo.tags }" />
              </div>
              <table class="table">
	           <tr>
	             <td class="text-right">
	              <input type=button value="파일 추가" class="btn btn-xs btn-danger" id="add">
	              <input type=button value="삭제" class="btn btn-xs btn-info" id="remove">
	             </td>
	           </tr>
          	</table>
          <table class="table" id="fileView">
          </table>
          <div class="text-center">
          	<button class="genric-btn success-border circle">수정하기</button>
			<a href="#" class="genric-btn danger-border circle" onclick="javascript:history.back()">취소</a>
		</div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
 </body>
 </html> 