 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
 <script>

 $(document).ready(function(){
     boardList(); //페이지 로딩시 댓글 목록 출력 
 });
 
 $('[name=boardInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
            var insertData = $('[name=boardInsertForm]').serialize(); //boardInsertForm의 내용을 가져옴
            boardInsert(insertData); //Insert 함수호출(아래)
        });
         
         

        function boardList(){
            $.ajax({
                 type: "GET",
                 url: "get_list",
                 success: function(data) {
                     console.log(data);
                     for (var str in data) {
                         var tr = $("<tr></tr>").appendTo("#tbody");
                         $("<td></td>").text(data[str]['bno']).appendTo(tr);
                         $("<td></td>").text(data[str]['subject']).appendTo(tr);
                         $("<td></td>").text(data[str]['content']).appendTo(tr);   
                         $("<td></td>").text(FormatToUnixtime(data[str]['reg_date'])).appendTo(tr);
                         $("<td></td>").append('<a onclick="boardDelete(' + data[str]['bno'] + ');"> 삭제 </a>').appendTo(tr);   

        				//$(tr).attr("onclick","location.href='/detail/" + data[str]['bno'] + "'");
                     }                 
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
            a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="boardUpdateProc('+bno+');">수정</button> </span>';
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
                    	$("#tbody").html();
                    	boardList(); //게시글 삭제후 목록 출력 
                    }
                }
            });
        }
 </script>