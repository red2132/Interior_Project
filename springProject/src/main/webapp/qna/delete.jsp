<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
       <form method="post" action="../qna/delete_ok.do">
	       <table class="table">
	         <tr>
	           <td class="inline">
                      비밀번호:<input type=password name=pwd size=20 class="input-sm" id="pwd">
	                  <input type=hidden name=no value="${no }" id="no">
	                  <input type=hidden name=page value="${page }" id="page">
	           </td>
	         </tr>
	         <tr>
	           <td class="text-center">
	             <button class="btn btn-sm btn-success">삭제</button>
	             <input type=button value="취소" class="btn btn-sm btn-success"
	             onclick="javascript:history.back()">
	           </td>
	         </tr>
	       </table>
       </form>
     </div>
</body>
</html>