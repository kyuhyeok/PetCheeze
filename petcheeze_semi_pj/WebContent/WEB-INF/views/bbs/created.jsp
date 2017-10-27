<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetCheeze</title>


<link rel ="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript">
	function sendOk() {
		var f=docment.boardForm;
		
		var str=f.subject.value;
		if(str){
			alert("제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		str=f.content.value;
		if(!str){
			alert("내용을 입력하세요.");
			f.content.focus();
			return;			
		}
		
		var mode="${mode}";
		if(mode=="created")
			f.action="<%=cp%>/bbs/created_ok.do";
			else if(mode=="update")
				f.action="<%=cp%>/bbs/update_ok.do";
						
			f.submit();
	}
</script>
</head>

<body>
<div class="header">
  <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div class="container">
	<div class="body-container" style="width:700px;">
		<div>
			<h3><span style="font-family: Webdings; width: 1100px;">2</span> 게시판 </h3>
		</div>
	</div>
</div>
</body>
</html>
