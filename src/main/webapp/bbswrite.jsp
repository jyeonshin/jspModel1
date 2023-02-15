<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	if(login == null){
		%>
		<script>
		alert('로그인 해 주십시오');
		location.href = "login.jsp";
		</script>
		<%
	}	
%>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbs write</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</head>
<body>

<h1>글쓰기</h1>

<div align="center">

<form action="bbswriteAf.jsp" id="frm" method="post">

<table border="1">
<col width="200"><col width="400">

<tr>
	<th>아이디</th>
	<td>
		<%-- <input type="text" name="id" size="50px" value="<%=login.getId() %>" readonly="readonly"> --%>
		
		<%=login.getId() %>
		<input type="hidden" name="id" value="<%=login.getId() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" id="title" name="title" size="50px" placeholder="제목기입">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50px" id="content" name="content" placeholder="내용기입"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<!-- <input type="submit" value="글쓰기"> -->
		<button type="button">글쓰기</button>
	</td>
</tr>

</table>
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	$("button").click(function() {
		
		if($("#title").val().trim() == "" ){
			alert("제목을 기입해 주십시오");
			return;
		}else if($("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}else{
			$("#frm").submit();
		}		
	});	
});
</script>


</body>
</html>







