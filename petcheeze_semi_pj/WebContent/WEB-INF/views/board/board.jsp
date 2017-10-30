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

<h4><p align="center"  style="width: 1150px; margin:10px auto;">MY&nbsp;BOARD</p></h4>


<div style="width:1150px; margin: 30px auto 0px;">분류 선택
<select style="height: 25px;">
	<option value="date">작성일자별</option>
	<option value="kind">분류별</option>
</select>

</div>

<table style="width: 1150px; height: 30px; margin-top:10px;margin-left:auto; margin-right:auto;
border-collapse: collapse;border-spacing: 0px; text-align:center; ">
<tr style="border-collapse: collapse;border-spacing: 0px; ">
<td style="width: 70px; height: 38px;  padding-top: 5px; padding-bottom:5px; border-top: 1px solid silver; border-bottom: 1px solid silver;">NO</td>
<td style="width: 135px; height: 38px;  padding-top: 5px; padding-bottom:5px; border-top: 1px solid silver; border-bottom: 1px solid silver;" >CATEGORY</td>
<td style="width: 576px; height: 38px;  padding-top: 5px; padding-bottom:5px; border-top: 1px solid silver; border-bottom: 1px solid silver;" >SUBJECT</td>
<td style="width: 84px; height: 38px;  padding-top: 5px; padding-bottom:5px; border-top: 1px solid silver; border-bottom: 1px solid silver;" >NAME</td>
<td style="width: 80px; height: 38px;  padding-top: 5px; padding-bottom:5px; border-top: 1px solid silver; border-bottom: 1px solid silver;"  >DATE</td>
<td style="width: 55px; height: 38px;  padding-top: 5px; padding-bottom:5px; border-top: 1px solid silver; border-bottom: 1px solid silver;" >HIT</td>
</tr>
<tr style="border-collapse: collapse;border-spacing: 0px; border-top:1px solid siver; border-bottom:1px solid siver;"> 
<td colspan="7" style=" height: 43px; padding-top: 5px; padding-bottom:5px; border-bottom: 1px solid silver;"  ><b>주문내역이 없습니다</b></td>
</tr>

</table>




<div align="center" style="margin-top: 30px;">
<input type="image" src="<%=cp%>/resource/images/btn_page_first.gif">
<input type="image" src="<%=cp%>/resource/images/btn_page_prev.gif">

<input type="image" src="<%=cp%>/resource/images/btn_page_next.gif">
<input type="image" src="<%=cp%>/resource/images/btn_page_last.gif">
</div>



	<div class="footer" >
	    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

</body>
</html>