<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/multipartSubmit" method="post" enctype="multipart/form-data">
    <input type="file" name="fileupload" /><br/>
    <input type="text" name="txt" /><br/>
    <input type="submit" value="POST전송"/>
</form>
</body>
</html>