<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();  
String socPath="ws://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
 <script type="text/javascript">
 function init(){
	 var width  = $(window).width();
     var height  = $(window).height();
     $("#content").css("height",height*0.8);
     $("#content").css("width",width*0.95);
     $("#sendtext").css("height",height*0.2);
     $("#sendtext").css("width",width);
 	 $("#sendmessage").css("width",width*0.8);
    }

 //监听窗口变动的
 $(window).resize(function(){
	 init();
	})  
 	  var websocket = null ;
 	  var name = null;
 function lj(){
	 init();
	 name = $("#namevalue").val();
	 var wsuri = "<%=socPath%>socketTest/"+name; 
     if('WebSocket' in window){
		websocket = new WebSocket(wsuri);

	}
     else{
		alert("No Support");
     }
    
     websocket.onopen = function(){
    	 sendValue("大家好，我来了");
     }
     websocket.onerror = function(){
		console.log("error");
       }
     websocket.onmessage = function(even){
        var date = new Date();
		var mo =parseInt(date.getMonth())+1;
		time = date.getHours()+":"+ date.getMinutes()+":"+date.getSeconds(); 
		var value = even.data;
		var text = date.getFullYear()+"-"+mo+"-"+date.getDate()+" "+time+"<br/><span>"+even.data+"</span><br/>"
		$("#content").append(text);
		var div =document.getElementById("content");
    	div.scrollTop =  div.scrollHeight;
    	 //alert("x:"+ div.scrollTop+"div.scrollHeight:"+div.scrollHeight);
      }
     websocket.onclose = function(even){
		console.log("close");
     }
       
	 }
 	 
 	
    function send(){
    	 checkName();
         var value =  document.getElementById("sendmessage").value;
    	 websocket.send(value);
    	 document.getElementById("sendmessage").value="";
    	
     }
     function sendValue(value){
         websocket.send(value);
     }
     function checkName(){
		var name = $("#namevalue").val();
		name =name.replace(/\s/g,'');
		if(name==""){
			alert("名字为空了,先取名");
 			window.location.href="index.jsp"; 
			return false;
		}
     }
    
    
 </script>
</head>
<body onload="lj()">
 <input type="hidden" id="namevalue"  value="${param.name}"/>
 <div id="content" style="overflow: auto"></div>
 <div id="sendtext"  align = "center">
 	<input type="text" id= "sendmessage" height="50px">
 	<button id="sendbutton" onclick="send()">send</button>
   </div>
</body>
</html>