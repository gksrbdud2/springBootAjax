 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
 <script>
		 $(document).ready(function() {    
			 boardList();
		     FormatToUnixtime(unixtime);		    
		});
		
		$('[name=boardInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
		          var insertData = $('[name=boardInsertForm]').serialize(); //boardInsertForm의 내용을 가져옴
		          boardInsert(insertData); //Insert 함수호출(아래)
		      });
	
		//유닉스 타임스템프를 년 월 일 시 분 초로 변경하기 위한 함수
		function FormatToUnixtime(unixtime) {
		   var u = new Date(unixtime);
		   return u.getUTCFullYear() +
		       '-' + ('0' + u.getUTCMonth()).slice(-2) +
		       '-' + ('0' + u.getUTCDate()).slice(-2) +
		       ' ' + ('0' + u.getUTCHours()).slice(-2) +
		       ':' + ('0' + u.getUTCMinutes()).slice(-2) +
		       ':' + ('0' + u.getUTCSeconds()).slice(-2)
		};     
		
		
		
		var dataPerPage = 5;    // 한 페이지에 나타낼 데이터 수..
		var pageCount = 5;  // 한 화면에 나타낼 페이지버튼 수
		var currentPage = 1;
		var table = '#mytable'
		var totalData = $(table+' tbody tr').length;
		
		//페이징처리
		function paging(totalData, dataPerPage, pageCount, currentPage){	   
		 $('#paging').html('')
		 var trnum=0
		 var maxRows = dataPerPage // 한 화면에 나타낼 데이터
		 var maxPageNum = pageCount; // 한 화면에 나타낼 페이지버튼 수
		 var totalRows = $(table+' tbody tr').length; //총 데이터 수
		 var pagenum = Math.ceil(totalRows/maxRows);
		 var pageGroup = Math.ceil(currentPage/maxPageNum);
		 var last = pageGroup*maxPageNum; // 화면에서 마지막 버튼 넘버
		 var nextPageNum = last-(maxPageNum-1); // 화면에서 첫번째 버튼 넘버
		 if (last > pagenum)
		      last = pagenum;
		 var first = nextPageNum;
		 var next = last+1;
		 var prev = first-1;
		
		 $(table+' tr:gt(0)').each(function(){
		    trnum++
		    if(trnum > maxRows){
		       $(this).hide()
		    }
		    if(trnum <= maxRows){
		       $(this).show()
		    }
		 })
		 if(prev > 0){
		      $('#paging').append(
		        '<a id="prev" class="btn btn-default pull-left" style="margin-right:10px">이전</a>'
		    )
		 }
		 for(var i=first; i<=last;){
		      $('#paging').append(
		         '<li data-page="'+(i)+'"> <span>'+i++ +'<span class="sr-only"> (current) </span></span></li>'
		         )
		 }  
		 if(last < pagenum){
		       $('#paging').append(
		         '<a id="next" class="btn btn-default pull-right" style="margin-left:10px">다음</a>'
		         )
		 }
		 if(first == 1){
		     $('#paging li:first-child').addClass('active')
		 }
		$('#paging li').on('click',function() {
		   var pageNum = $(this).attr('data-page');
		     var trIndex = 0;
		    
		    $('#paging li').removeClass('active')
		      $(this).addClass('active')
		      $(table+' tr:gt(0)').each(function(){
		       trIndex++
		         if(trIndex <= ((maxRows*pageNum)-maxRows) || trIndex > (maxRows*pageNum)){
		           $(this).hide()
		         }else{
		           $(this).show()
		         }
		   })
		})
		$('#paging a').on('click', function(){
		 var $item = $(this);
		 var $id = $item.attr("id");
		 var selectedPage = $item.text();
		 var item_paging = $('#paging li').last().attr('data-page');
		
		 item_paging++;
		
		 if($id == "next")              selectedPage = next;
		 if($id == "prev")             selectedPage = prev;
		 paging(totalData, dataPerPage, pageCount, selectedPage);
		 if(item_paging == next){ //넥스트 버튼을 누르면 일어나는 동작들
		    var set_paging = $('#paging li').attr('data-page');
		   
		    $('#paging li').first().trigger('click')
		    $('#paging li').removeClass('active')
		    $('#paging li').first().addClass('active')
		 }  
		})
		}
		
		//게시글 목록 
		function boardList(){
		    $.ajax({
	     	    type: "GET",
	            url: "get_list",
	            success: function(data) {
          		  var a =''; 
          		  
				  for (var str in data) {
		          	a += '<tr><td>' + data[str]['bno'] + '</td>';
		        	a += '<td>' + data[str]['subject'] + '</td>';
					a += '<td>' + data[str]['content'] + '</td>';
					a += '<td>' + FormatToUnixtime(data[str]['reg_date']) + '</td>';
					a += '<td><button class="btn btn-default" onclick="boardDelete(' + data[str]['bno'] + ');"> 삭제 </button></td></tr>';	
					
				  }

				$("#tbody").html(a);
			     paging(totalData, dataPerPage, pageCount, 1);
			         
		        },
				error: function(error) {
		        	alert("오류 발생" + error);
		        }
	    	});
		}

         
        //게시글 등록
        function boardInsert(insertData){
            $.ajax({
                url : '/insert',
                type : 'post',
                data : insertData,
                success : function(data){
                    if(data == 1) {
                        boardList(); //게시글 작성 후 게시글 목록 reload
                        $('[name=subject]').val('');
                        $('[name=content]').val('');
                    }
                }
            });
        }
         
        //게시글 수정 - 게시글 내용 출력을 input 폼으로 변경 
        function boardUpdate(bno, subject, content){
            var a ='';
            
            a += '<div class="input-group">';
            a += '<input type="text" class="form-control" name="content_'+bno+'" value="'+content+'"/>';
            a += '<span class="input-group-btn"><button class="btn btn-danger" type="button" onclick="boardUpdateProc('+bno+');">수정</button> </span>';
            a += '</div>';
            
            $('.boardContent'+bno).html(a);
            
        }
         
        //게시글 수정
        function boardUpdateProc(bno){
            var updateContent = $('[name=content_'+bno+']').val();
            
            $.ajax({
                url : '/updateProc',
                type : 'post',
                data : {'content' : updateContent, 'bno' : bno},
                success : function(data){
                    if(data == 1) boardList(); //댓글 수정후 목록 출력 
                }
            });
        }
         
        //게시글 삭제 
        function boardDelete(bno){
            $.ajax({
                url : '/delete/'+bno,
                type : 'post',
                success : function(data){
             
                    if(data == 1) {
                    	boardList(); //게시글 삭제후 목록 출력 
                    }
                }
            });
        }
 </script>