<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 일기 등록하는 jsp입니다 -->

<form action="write.do" method="get">
제목<br><input type="text" name="title" ><br><br>
내용 <br><textarea rows=5 cols=50 name="contents"></textarea><br>

<input type="submit" value="등록"><br>

<select name="exer1" id="exer1">
	<option>상체</option>
	<option>하체</option>
</select>


</form>

</body>
</html>