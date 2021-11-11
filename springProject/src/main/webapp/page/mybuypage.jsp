<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
  margin: 0px auto;
  width:1000px;
}
</style>
</head>
<body>
<br><br><br><br><br><br><br><br>
<div class="bgded overlay">
  <div id="breadcrumb" class="hoc clear"> 
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear">
  <div class="row">
    <h1>구매내역</h1>
    <hr>
    <table class="table">
     <tr>
      <th class="text-center"></th>
      <th class="text-center">상품명</th>
      <th class="text-center">수량</th>
      <th class="text-center">금액</th>
      <th class="text-center">합계금액</th>
      <th class="text-center">배송비</th>
      <th class="text-center">비고</th>
     </tr>
     <c:forEach var="vo" items="${list }">
          <c:if test="${vo.ischeck==1 }">
       <tr>
         <td class="text-center">
          <img src="${vo.product_poster}" style="width:30px;height:30px">
         </td>
         <td>${vo.product_name }</td>
         <td class="text-center">${vo.amount}</td>
         <td class="text-center">${vo.product_price}원</td>
         <td class="text-center">${vo.amount*vo.product_price+3000}원</td>
         <td class="text-center">3000원</td>
         <td class="text-center inline">
           <span style="color:red">구매완료</span>
         </td>
       </tr>
          </c:if>
     </c:forEach>
    </table>
  </div>
  </main>
</div>
</body>
</html>