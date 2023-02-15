<%@page import="dto.MemberDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int seq = Integer.parseInt( request.getParameter("seq") );
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	BbsDto dto = BbsDao.getInstance().getBbs(seq);
%>

<div align="center">

<h2>부모글</h2>

<table border="2">
<col width="200"><col width="500">
<tr>
	<th>작성자</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=dto.getReadcount() %></td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50" readonly><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<h2>답글</h2>

<form action="answerAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">

<table border="1">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" size="50" readonly="readonly" value="<%=login.getId() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">
	</td>	
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="작성완료">
	</td>
</tr>
</table>
</form>

</div>


</body>
</html>



