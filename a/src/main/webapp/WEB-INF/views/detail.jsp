<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
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

	<!--  댓글  -->
    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${detail.bno}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
 
	<%@ include file="comment.jsp" %>
	<%@ include file="bootstrap.jsp" %>
</body>
</html>