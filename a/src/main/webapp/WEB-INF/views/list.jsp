<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Listaaaa</title>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<link rel="/test.css">
</head>
<body> 

	<div class="container">
		<h2> 게시글 목록 </h2>		
		<table class="table table-hover" id="mytable">
			<thead>
				<tr>
                       <th>No.</th>
                       <th>제목</th>
                       <th>내용</th>
                       <th>작성일자</th>
                </tr>
	         </thead>
	         <tbody id="tbody">
	         </tbody>
		</table>
		<div class="pagination-container" style="float:left;">
	       	<nav>
	        	<div>
	            	<ul class="pagination" id="paging"></ul>
	            </div>
	        </nav>
		</div>
		

	</div>

		<!--  ajax 등록,수정  -->
	    <div class="container">
	        <label for="content">글쓰기</label>
	        <form name="boardInsertForm">
	            <div class="input-group">
	               <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
	               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
	               <span class="input-group-btn">
	                    <button class="btn btn-primary" type="button" name="boardInsertBtn">등록</button>
	               </span>
	              </div>
	        </form>
	    </div>
	    
	    <div class="container">
	        <div class="boardList"></div>
	    </div>
	
<!--
        <form name="InsertForm">
            <div class="input-group">
                <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-primary" type="button" name="InsertBtn">CREATE</button>
               </span>
              </div>
        </form>
  -->
    <%@ include file="crud.jsp" %>  
	<%@ include file="bootstrap.jsp" %>     
</body>
</html>