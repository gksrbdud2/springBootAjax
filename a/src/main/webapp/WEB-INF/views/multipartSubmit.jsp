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
// input type="name" �� value���� ������
String fileupload = request.getParameter("fileupload");
// input type="subject" �� value���� ������
String txt = request.getParameter("txt");
// �ߺ����������� ������� �Ѱ��� ���ϸ��� ������
String filename = request.getParameter("filename");
// ������ ���ϸ��� ������
String filesize = request.getParameter("filesize");
%>
<h3>���ε� ���� Ȯ��</h3>
���� : <%=fileupload %><br/>
���� : <%=txt %><br/>
������ : <%=filesize %><br/>
<!-- ���� �ٿ�ε� ��ũ Ŭ���� �ٿ�ε� �� �� �ֵ��� fileDown1.jsp ���������� ó�� �ڿ� �������ڿ��� ���� �ߺ� ������ �̸� fileName1 ���� ���� �Ѱ��ش�. -->
����1 �ٿ�ε� : <a id="downA" href="#"><%=filename%></a>
<script type="text/javascript">
//���������� �׳� �ٿ�ε� Ŭ���� �����۵������� �ѱ����ϸ��� ���������� ������� ���ڵ� ������ �߻��� �� �ִ�. �ѱ��� ���� �����۵����� ���� �� ����
// ����, �������ڿ��� �ѱ��� ���� ���� �׻� ���ڵ��� �ؼ� �����ֵ��� ����.
document.getElementById("downA").addEventListener("click", function(event) {
event.preventDefault(); // a �±��� �⺻ ������ ����
event.stopPropagation(); // �̺�Ʈ�� ���ĸ� ����
// fileName1�� utf-8�� ���ڵ��Ѵ�.
var fName = encodeURIComponent("<%=filename%>");
// ���ڵ��� �����̸��� �������ڿ��� ���Խ��� �ٿ�ε� �������� �̵�
window.location.href = "fileDown.jsp?filename="+fName;
});
</script>

</body>
</html>