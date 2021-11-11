<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
 var websocket;
 function connection()
 {
	 // websocket 등록 
	 websocket=new WebSocket("ws://localhost:8080/web/chat-ws.do");
	 websocket.onopen=onOpen;
	 websocket.onmessage=onMessage;
	 websocket.onclose=onClose;
	 
 }
 function onOpen(event)
 {
	 // 서버 연결
	 alert("채팅 서버와 연결되었습니다!!");
 }
 function onMessage(event)
 {
	 // 서버에 값을 전송
	 var data=event.data;
	 if(data.substring(0,4)=="msg:")
	 {
	     // 100 LOGIN , 200 방만들기 
	     appendMessage(data.substring(4));
	 }
 }
 function onClose(event)
 {
	 // 종료
	 alert("채팅서버와 연결 종료되었습니다!!");
 }
 function disconnection()
 {
	 // 서버연결 해제
	 websocket.close();
 }
 function send()
 {
	 // 전송 
	 var name=$('#name').text();
	 /* if(name.trim()=="")
	 {
		 $('#name').focus();
		 return;
	 } */
	 var msg=$('#sendMsg').val();
	 if(msg.trim()=="")
	 {
		 $('#sendMsg').focus();
		 return;
	 }
	 websocket.send("msg:["+name+"]"+msg);
	 $('#sendMsg').val("");
	 $('#sendMsg').focus();
	 
 }
 function appendMessage(msg)
 {
	 // 채팅문자열을 결합 
	 $('#recvMsg').append(msg+"<br>");
	 var ch=$('#chatArea').height();
	 var m=$('#recvMsg').height()-ch;
	 $('#chatArea').scrollTop(m);
 }
 
 $(function(){
	 $('#startBtn').click(function(){
		 connection();
	 });
	 $('#endBtn').click(function(){
		 disconnection();
	 });
	 $('#sendBtn').click(function(){
		 send();
	 })
	 $('#sendMsg').keydown(function(key){
		 if(key.keyCode==13)
		 {
		    send();	 
		 }
	 })
 })
</script>

</head>
<body>
  <div style="height:100px"></div>
  <div class="wrapper row3">
   <main class="container"> 
    <h1 style="text-align: center;">채팅</h1>
     <div class="row" style="margin: 0px auto;width:450px">
       <table class="table">
       <tr>
        <td class="inline">
        	ID : <i id=name>${sessionScope.id }</i>
        	<input type="button" id="endBtn" value="퇴장" class="btn btn-sm btn-danger" style="float: right">
         	<input type="button" id="startBtn" value="입장" class="btn btn-sm btn-primary" style="float: right">
         	<span style="float: right;padding-right: 10px"> 상품명 : ${title }</span>
        </td>
      </tr>
      <tr>
        <td>
         <div id="chatArea" style="height: 400px;overflow-y:auto;border:1px solid black;">
           <div id="recvMsg"></div>
         </div>
        </td>
      </tr>
      <tr>
        <td class="inline">
         <input type=text id="sendMsg" size=66 class="input-sm">
         <input type=button id="sendBtn" value="전송" class="btn btn-sm btn-success">
        </td>
      </tr>
     </table>
   </div>
  </main>
  </div>
</body>
</html>