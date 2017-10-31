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

<h1><p align="center"  style="width: 1150px; margin:10px auto;">M Y &nbsp;P A G E</p></h1>

<c:if test="${empty sessionScope.member}">
<table style="border: 1px solid silver; width: 1150px; 
height: 92px; margin: 30px auto; border-collapse: collapse;border-spacing: 0px; text-align: justify;" >
<tr align="center">
<td style="border: 1px solid silver; width:92px ;" >
<input type="image" src="<%=cp%>/resource/images/img_member_default.gif" style="max-width: 100%;max-height: 100%; padding-top: 4px;">
</td>
<td style="padding: 10px 10px ">
<p style="text-align: left;">저희 쇼핑몰을 이용해 주셔서 감사합니다. ${dto.userName} 님은 [일반회원] 회원이십니다.</p>
</td>
</tr>
</table>
</c:if>



<table style="width: 767px; height: 86px; margin: 20px auto 0px; border: 1px solid;
border-collapse: collapse;border-spacing: 0px; text-align: justify;" >
<tr>
<td style="float: left; width: 109.25px; height: 24px; margin-left:50px; margin-top: 15px; " >>&nbsp;가용적립금</td>
<td style="float: left; width: 140.63px; height: 24px;  margin-top: 15px; text-align: right;">0원</td>
<td style="float: left; width: 50px; height: 24px; margin-left:10px; margin-top: 15px; border-right: 1px solid silver;">
<input type="image" src="<%=cp%>/resource/images/btn_result.gif"></td>
<td style="float: left; width: 109.25px; height: 24px; margin-left:50px; margin-top: 15px; " >>&nbsp;총적립금</td>
<td style="float: left; width: 140.63px; height: 24px;  margin-top: 15px; text-align: right;">0원</td>
<td style="float: left; width: 50px; height: 24px; margin-left:10px; margin-top: 15px;"></td>

</tr>
<tr>
<td style="float: left; width: 109.25px; height: 24px; margin-left:50px; margin-bottom: 15px; " >>&nbsp;사용적립금</td>
<td style="float: left; width: 140.63px; height: 24px;  margin-bottom: 15px; text-align: right;">0원</td>
<td style="float: left; width: 50px; height: 24px; margin-left:10px; margin-bottom: 15px; border-right: 1px solid silver;">
<td style="float: left; width: 109.25px; height: 24px; margin-left:50px; margin-bottom: 15px; " >>&nbsp;총주문</td>
<td style="float: left; width: 140.63px; height: 24px;  margin-bottom: 15px; text-align: right;">0원</td>
<td style="float: left; width: 50px; height: 24px; margin-left:10px; margin-bottom: 15px;"></td>

</tr>
</table>

<div align="center" style="width: 767px;  margin: 30px auto;">

<table style="width: 229px; height: 229px; margin-left: 30px;margin-top:20px;
border-collapse: collapse;border-spacing: 0px; text-align: justify; float: left;" >
<tr>
<td align="center">
	<img src="<%=cp%>/resource/images/mypage_01.png" 
	     onmouseover="this.src='<%=cp%>/resource/images/mypage_01_r.png';" 
	     onmouseout="this.src='<%=cp%>/resource/images/mypage_01.png';" 
	     onclick="javascript:location.href='<%=cp%>/order/order_list.do';">
</td>
</tr>
</table>

<table style="width: 229px; height: 229px; margin-left: 5px;margin-top:20px; 
border-collapse: collapse;border-spacing: 0px; text-align: justify; float: left;" >
<tr>
<td align="center">
	<img src="<%=cp%>/resource/images/mypage_02.png" 
	onmouseover="this.src='<%=cp%>/resource/images/mypage_02_r.png';" 
	onmouseout="this.src='<%=cp%>/resource/images/mypage_02.png';" 
	onclick="javascript:location.href='<%=cp%>/order/order_list.do';">
</td>
</tr>
</table>

<table style="width: 229px; height: 229px; margin-left: 5px;margin-top:20px; 
border-collapse: collapse;border-spacing: 0px; text-align: justify; float: left;" >
<tr>
<td align="center">
	<img src="<%=cp%>/resource/images/mypage_03.png" 
	onmouseover="this.src='<%=cp%>/resource/images/mypage_03_r.png';" 
	onmouseout="this.src='<%=cp%>/resource/images/mypage_03.png';" 
	onclick="javascript:location.href='<%=cp%>/order/order_list.do';">
</td>
</tr>
</table>

</div>

<div align="center" style="width: 767px;  margin: 0px auto; ">

<table style="width: 229px; height: 229px; margin-left: 30px;margin-top:5px; margin-bottom:100px;
border-collapse: collapse;border-spacing: 0px; text-align: justify; float: left;" >
<tr>
<td align="center">
	<img src="<%=cp%>/resource/images/mypage_04.png" 
	onmouseover="this.src='<%=cp%>/resource/images/mypage_04_r.png';" 
	onmouseout="this.src='<%=cp%>/resource/images/mypage_04.png';" 
	onclick="javascript:location.href='<%=cp%>/order/milege.do';">
</td>
</tr>
</table>

<table style="width: 229px; height: 229px; margin-left: 5px;margin-top:5px;margin-bottom:100px;
border-collapse: collapse;border-spacing: 0px; text-align: justify; float: left;" >
<tr>
<td align="center">
	<img src="<%=cp%>/resource/images/mypage_05.png" 
	onmouseover="this.src='<%=cp%>/resource/images/mypage_05_r.png';" 
	onmouseout="this.src='<%=cp%>/resource/images/mypage_05.png';" 
	onclick="javascript:location.href='<%=cp%>/bbs/board.do';">
</td>
</tr>
</table>

<table style="width: 229px; height: 229px; margin-left: 5px;margin-top:5px;margin-bottom:100px;
border-collapse: collapse;border-spacing: 0px; text-align: justify; float: left;" >
<tr>
<td align="center">
	<img  src="<%=cp%>/resource/images/mypage_06.png" 
	onmouseover="this.src='<%=cp%>/resource/images/mypage_06_r.png';" 
	onmouseout="this.src='<%=cp%>/resource/images/mypage_06.png';" 
	onclick="javascript:location.href='<%=cp%>/order/address.do';">
</td>
</tr>
</table>

</div>


	<div class="footer" >
	    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

</body>
</html>