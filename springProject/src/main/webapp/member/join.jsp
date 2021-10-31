<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aaa : 회원 가입 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script type="text/javascript">
function postfind()
{
	new daum.Postcode({
		oncomplete : function(data){
			$('#post').val(data.zonecode);
			$('#addr1').val(data.address);
		}
	}).open();
}
</script>
<script type="text/javascript">
$(function()
{	
	$('#idBtn').click(function(){
		$("#dialog_idcheck").dialog({
	    	autoOpen:false,
	        width : 450,
	        height : 170,
	        modal : true
		}).dialog("open");
	});

	$('#idcanBtn').click(function(){
		$('#dialog_idcheck').dialog("close");
	});
	
	$('#idcheckBtn').click(function(){
		let id = $('#id_check').val();
		if(id.trim() == "")
		{
			$('#id_check').focus();
			return;
		}   
		$.ajax({
			type : 'get',
		    url : '../member/idcheck.do',
		    data : {"id" : id},
		    success : function(res)
		    {
				let result = res.trim();
			    if(result == 0)
			    {
					alert("사용 가능한 아이디입니다!"); 
				    $('#okBtn').show();
			    }
			    else
			    {
				    alert("이미 사용 중인 아이디입니다!\n다시 입력하세요.");
				    $('#id_check').val("");
				    $('#id_check').focus();
			    }
			}
		})
	});
	
	$('#okBtn').click(function(){
		let id = $('#id_check').val();
	    $('#id_1').val(id);
	    $('#dialog_idcheck').dialog("close");
    });
	
    $('#joinBtn').click(function(){
	   
    });
    
    $('#tel1BoxDirect').hide();
    
    $('#tel1Box').change(function() {
    	if($('#tel1Box').val() == "direct") {
        	$('#tel1BoxDirect').show();
        }
    	else
    	{
        	$('#tel1BoxDirect').hide();
        }
	});​
    
})
</script>
</head>

<body>

	<div class="bgded overlay">
		<div id="breadcrumb" class="hoc clear"> 
		</div>
	</div>
	
	<div style="height:112px"></div>
	
	<div class="wrapper row3">
		<main class="hoc container clear"> 
			<h1 class="text-center">회원 가입</h1>
			<form method=post action="join_ok.do" id="joinFrm">
			<table class="table">
				<tr>
					<th align="right" width=20%>아이디</th>
					<td width=80% class="inline">
						<input type=text name=id size=15 class="input-sm" readonly id=id_1>
						<input type=button class="btn btn-sm" id="idBtn" value="중복체크">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>비밀번호</th>
					<td width=80% class="inline">
						<input type=password name=pwd size=15 class="input-sm">
						&nbsp;&nbsp;비밀번호 확인 : <input type=password name=pwd2 size=15 class="input-sm">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>이름</th>
					<td width=80% class="inline">
						<input type=text name=name size=15 class="input-sm">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>성별</th>
					<td width=80% class="inline">
						<input type="radio" name=sex value="남자" checked>남자
						<input type="radio" name=sex value="여자">여자
					</td> 
				</tr>
				<tr>
					<th align="right" width=20%>생년월일</th>
					<td width=80% class="inline">
						<input type="date" size=20 name=birthday>
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>이메일</th>
					<td width=80% class="inline">
						<input type=text name=email size=50 class="input-sm">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>우편번호</th>
					<td width=80% class="inline">
						<input type="text" name=post size=10 readonly id=post class="input-sm">
						<input type=button class="btn" value="우편번호검색" onclick="postfind()">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>주소</th>
					<td width=80% class="inline">
						<input type=text name=addr1 size=50 class="input-sm" readonly id=addr1>
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>상세주소</th>
					<td width=80% class="inline">
						<input type=text name=addr2 size=50 class="input-sm">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>전화번호</th>
					<td width=80% class="inline">
						<!-- <input type=text name=tel1 size=10 class="input-sm" readonly value="010">-  -->
						
						<select id="tel1Box" name="tel1">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="070">070</option>
							<option value="02">02</option>
							<option value="direct">직접입력</option>
						</select>
						<input type="text" id="tel1BoxDirect" name="tel1BoxDirect"/>
						
						<input type=text name=tel2 size=20 class="input-sm">
					</td>
				</tr>
				<!-- 
				<tr>
					<th align="right" width=20%>소개</th>
					<td width=80% class="inline">
						<textarea rows="10" cols="55" name=content></textarea>
					</td>
				</tr>
				 -->
				<tr>
					<td colspan="2" align="center">
						<input type=submit class="btn" value="가입" id="joinBtn">
						<input type=button class="btn" value="취소" 
						 onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
			</form>
		</main>
	</div>

	<!-- ID 중복체크  -->
	<div id="dialog_idcheck" title="아이디 중복체크" style="display:none">
		<table class="table">
			<tr>
    			<th width=20% align="right">ID</th>
    			<td width=80% class="inline">
					<input type=text id="id_check" size=15 class="input-sm">
					<input type=button value="중복체크" id="idcheckBtn">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type=button value="확인" id="okBtn" style="float:left; display:none">
					<input type=button value="취소" id="idcanBtn" style="float:left">
				</td>
			</tr>
		</table>
 	</div>
 	
</body>
</html>