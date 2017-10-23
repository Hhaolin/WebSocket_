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
  function qm(){
		var name = $("#name").val();
		name =name.replace(/\s/g,'');
	 	if(name==""){
			alert("取名啊，瞎点个鸡巴毛");
		 	return false;
		 }
	 	window.location.href="NewFile.jsp?name="+name; 
	  }
</script>
</head>
<body>
  <div>
    <input type="text" id ="name">
    <button onclick = "qm()" value="提交">提交</button>
  </div>
</body>
</html>