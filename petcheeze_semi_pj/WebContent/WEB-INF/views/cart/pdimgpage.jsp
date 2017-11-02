<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function cntupdate(){
	alert("메롱")
	
}
function addcart(){
	var f = document.pdForm;
	
	f.action="<%=cp%>/cart/insertCart_ok.do";
	
	f.submit();
	
}
function addcartnomem() {
	var f=document.pdForm;
	
	f.action="<%=cp%>/cart/insertno.do";
	f.submit();
}

</script>

</head>
<body>

<div align="center">
<form name="pdForm" method="post">

상품 <input type="hidden" name="pdcode" value="11"><br>
페이지 <input type="hidden" name="page" value="1"> <br>
수량 : <input type="text" name="cnt"><br>

<c:if test="${not empty sessionScope.member}">
<button type="button" onclick="addcart()">장바구니담기</button><br>
</c:if>
<c:if test="${empty sessionScope.member}">
<button type="button" onclick="addcartnomem()">장바구니담기</button><br>
</c:if>
<button type="button" onclick="cntupdate()">수량변경</button><br>
</form>
</div>

</body>
</html>