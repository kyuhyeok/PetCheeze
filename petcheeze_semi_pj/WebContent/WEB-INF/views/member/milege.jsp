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
<title>Insert title here</title>

<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">	<!-- main+menu용 CSS(규혁) -->
<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">

<script type="text/javascript">


</script>


</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>


<div>

<form name="memberForm" method="post">

<h4><p align="center"  style="width: 1150px; margin:10px auto;">적립금</p></h4>
<h5><p align="center"  style="width: 1150px; margin:10px auto;">고객님의 사용가능 적립금 금액 입니다.</p></h5>


<table style="width: 1150px; height: 121px; margin: 20px auto 0px; border: 5px solid silver;
border-collapse: collapse;border-spacing: 0px; text-align: justify;" >
<tr style="width: 1130px; height: 18px;">
<td style="float: left; width: 250px; height: 18px; margin-left:50px; margin-top: 15px; " >>&nbsp;총적립금</td>
<td style="float: left; width: 250px; height: 18px;  margin-top: 15px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="float: left; width: 250px; height: 18px; margin-left:50px; margin-top: 15px; " >>&nbsp;사용가능 적립금</td>
<td style="float: left; width: 250px; height: 18px;  margin-top: 15px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

<tr style="width: 1130px; height: 18px; ">
<td style="float: left; width: 250px; height: 18px; margin-left:50px; margin-top: 10px; " >>&nbsp;총적립금</td>
<td style="float: left; width: 250px; height: 18px;  margin-top: 10px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="float: left; width: 250px; height: 18px; margin-left:50px; margin-top: 10px; " >>&nbsp;사용가능 적립금</td>
<td style="float: left; width: 250px; height: 18px;  margin-top: 10px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

<tr style="width: 1130px; height: 18px;">
<td style="float: left; width: 250px; height: 18px; margin-left:50px; margin-top: 10px; " >>&nbsp;총적립금</td>
<td style="float: left; width: 250px; height: 18px;  margin-top: 10px; text-align: right;" >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="float: left; width: 250px; height: 18px; margin-left:50px; margin-top: 10px; " >>&nbsp;사용가능 적립금</td>
<td style="float: left; width: 250px; height: 18px;  margin-top: 10px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>


<table style="width: 1150px; height: 40px; margin: 20px auto 0px; border: 1px solid silver;
border-collapse: collapse;border-spacing: 0px; text-align: justify;" >
<tr style="width: 1130px; height: 18px;">
<td style="float: left; width: 250px; height: 18px; margin-left:50px; margin-top: 15px; " >>&nbsp;총적립금</td>
<td style="float: left; width: 250px; height: 18px;  margin-top: 15px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="float: left; width: 250px; height: 18px; margin-left:50px; margin-top: 15px; " >>&nbsp;사용가능 적립금</td>
<td style="float: left; width: 250px; height: 18px;  margin-top: 15px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

</table>



	<div class="footer" >
	    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

</body>
</html>