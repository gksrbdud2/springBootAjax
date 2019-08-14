<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
// input type="name" 의 value값을 가져옴
String fileupload = request.getParameter("fileupload");
// input type="subject" 의 value값을 가져옴
String txt = request.getParameter("txt");
// 중복방지용으로 만들어져 넘겨진 파일명을 가져옴
String filename = request.getParameter("filename");
// 본래의 파일명을 가져옴
String filesize = request.getParameter("filesize");
%>
<h3>업로드 파일 확인</h3>
파일 : <%=fileupload %><br/>
제목 : <%=txt %><br/>
사이즈 : <%=filesize %><br/>
<!-- 파일 다운로드 링크 클릭시 다운로드 될 수 있도록 fileDown1.jsp 페이지에서 처리 뒤에 쿼리문자열을 통해 중복 방지용 이름 fileName1 값을 같이 넘겨준다. -->
파일1 다운로드 : <a id="downA" href="#"><%=filename%></a>
<script type="text/javascript">
//영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
// 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
document.getElementById("downA").addEventListener("click", function(event) {
event.preventDefault(); // a 태그의 기본 동작을 막음
event.stopPropagation(); // 이벤트의 전파를 막음
// fileName1을 utf-8로 인코딩한다.
var fName = encodeURIComponent("<%=filename%>");
// 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
window.location.href = "fileDown.jsp?filename="+fName;
});
</script>

</body>
</html>