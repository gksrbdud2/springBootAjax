<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
</head>
<body>
 
<div class="container"> 
	<h2> 게시글 상세 </h2>
      <div class="form-group">
        <label>제목</label>
        <p>${detail.subject}</p>
      </div>
      <div class="form-group">
        <label>작성날짜</label>
        <p>${detail.reg_date}</p>
      </div>
      <div class="form-group">
        <label>내용</label>
        <p>${detail.content}</p>
      </div>
      <button class="btn btn-default" onclick="location.href='/list'" style="float:left;">목록</button>
      <div style="float:right;"> 
    	  <button class="btn btn-primary" onclick="location.href='/update/${detail.bno}'">수정</button>
		  <button class="btn btn-danger" onclick="location.href='/delete/${detail.bno}'">삭제</button>
	  </div>
</div>
 
 
<%@ include file="bootstrap.jsp" %>
</body>
</html>