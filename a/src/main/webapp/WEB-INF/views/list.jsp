<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Listaaaa</title>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<style>
			th,td {text-align:left;}
	</style>
</head>
<body> 
	<div class="container">
		<h2> 게시글 목록 </h2>		
		<table class="table table-hover" id="mytable">
			 <colgroup>
               <col width="10%">
               <col width="50%">
               <col width="20%">
               <col width="10%">
               <col width="10%">
            </colgroup>
			<thead>
				<tr>
                       <th>No.</th>
                       <th>제목</th>
                       <th>작성일자</th>
                       <th>수정</th>
                       <th>삭제</th>
                </tr>
	         </thead>
	         <tbody id="tbody">
	         </tbody>
		</table>
		<div class="pagination-container">
	       	<nav>
	        	<div>
	            	<ul class="pagination" id="paging"></ul>
	            </div>
	        </nav>
		</div>
		<button data-toggle="modal" data-target="#modal_create" class="btn btn-primary" style="margin:20px 0;">CREATE</button>
	</div>
	
	<!-- create Modal -->
	<form name="boardInsertForm">
		<div class="modal fade" id="modal_create" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		      	<h2 class="modal-title">게시글 등록</h2>
		      </div>
		      <div class="modal-body">
		              <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
		              <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
		      </div>
			  <div class="modal-footer">
	          	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	         	<input type="button" name="boardInsertBtn" class="btn btn-primary" value="등록완료" data-dismiss="modal">
	     	 </div>
		    </div>
		  </div>
		</div>
	</form>
	
	<!-- edit Modal -->
	<form name="boardEditForm">
		<div class="modal fade" id="modal_edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		      	<h2 class="modal-title">게시글 수정</h2>
		      </div>
		      <div id="pp" class="modal-body">

		      </div>
			  <div id="kk" class="modal-footer">
	     	 </div>
		    </div>
		  </div>
		</div>
	</form>

    <%@ include file="crud.jsp" %>  
	<%@ include file="bootstrap.jsp" %>     
</body>
</html>