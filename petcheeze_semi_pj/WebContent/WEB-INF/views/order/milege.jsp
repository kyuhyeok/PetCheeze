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


<table style="width: 1150px; height: 90px; margin: 30px auto 0px; border: 5px solid #EAEAEA;
border-collapse: collapse;border-spacing: 0px;" >
<tr style="width: 1150px; height: 25px;">
<td style="width: 250px; height: 18px; padding-left:50px; padding-top: 7px; " >>&nbsp;총적립금</td>
<td style="width: 275px; height: 18px;  padding-top: 7px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="width: 250px; height: 18px; padding-left:50px; padding-top: 7px; " >>&nbsp;사용가능 적립금</td>
<td style="width: 275px; height: 18px;  padding-top: 7px; text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

<tr style="width: 1150px; height: 25px; ">
<td style="width: 250px; height: 25px; padding-left:50px;  " >>&nbsp;총적립금</td>
<td style="width: 275px; height: 25px;   text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="width: 250px; height: 25px; padding-left:50px;  " >>&nbsp;사용가능 적립금</td>
<td style="width: 275px; height: 25px;   text-align: right; " >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

<tr style="width: 1150px; height: 25px;">
<td style="width: 250px; height: 25px; padding-left:50px;  " >>&nbsp;총적립금</td>
<td style="width: 250px; height: 25px;   text-align: right;" >0원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="width: 250px; height: 25px; padding-left:50px;  " ></td>
<td style="width: 275px; height: 25px;   text-align: right; " ></td>
</tr>
</table>


<table style="width: 1150px; height: 40px; margin-top:20px;border:1px solid siver; margin-left:auto; margin-right:auto; 
border-collapse: collapse;border-spacing: 0px; text-align:center; border: 1px solid silver; background: #f2f2f2;">


<tr>

<td style="float: left; width: 199px; height: 30px; border-right: 1px solid silver; padding-top: 10px;"  ><a>적립내역보기</a></td>
<td style="float: left; width: 199px; height: 30px; border-right: 1px solid silver; padding-top: 10px;" ><a>미사용적립내역보기</a></td>
<td style="float: left; width: 199px; height: 30px; border-right: 1px solid silver; padding-top: 10px; " ><a>미사용쿠폰/회원등급적립내역</a></td>
<td style="float: left; width: 544px; height: 30px;  padding-top: 10px; " ></td>

</tr>

</table>


<table style="width: 1150px; height: 30px; margin-top:20px;border:1px solid siver; margin-left:auto; margin-right:auto; 
border-collapse: collapse;border-spacing: 0px; text-align:center; border: 1px solid silver; ">
<tr style="border-collapse: collapse;border-spacing: 0px;">
<td style="width: 199px; height: 20px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;  "  >주문날짜</td>
<td style="width: 199px; height: 20px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >적립금</td>
<td style="width: 199px; height: 20px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >관련 주문</td>
<td style="width: 545px; height: 20px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >적립내용</td>
</tr>
<tr style="border-collapse: collapse;border-spacing: 0px;"> 
<td style="width: 199px; height: 20px; border: 1px solid silver; border-right: 1px solid silver; padding-top: 5px; padding-bottom:5px;"  >2017.10.30</td>
<td style="width: 199px; height: 20px; border: 1px solid silver; border-right: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >3,000원</td>
<td colspan="2" style=" height: 20px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >신규회원 적립금</td>
</tr>

</table>


<div align="center" style="margin-top: 30px;">
<input type="image" src="<%=cp%>/resource/images/btn_page_first.gif">
<input type="image" src="<%=cp%>/resource/images/btn_page_prev.gif">

<input type="image" src="<%=cp%>/resource/images/btn_page_next.gif">
<input type="image" src="<%=cp%>/resource/images/btn_page_last.gif">
</div>

<table style="width: 1150px; height: 40px; margin-top:20px;border:1px solid siver; margin-left:auto; margin-right:auto; 
border-collapse: collapse; border-spacing: 0px; text-align:center; border: 1px solid silver; margin-bottom: 50px;">
<tr style="border-collapse: collapse; border-spacing: 0px; ">
<td style="  width: 1150px;  height: 26px; padding-top: 10px; text-align: left; border: 1px solid silver; padding-left: 10px; "  ><b>적립금 안내</b></td>

</tr>
<tr style="border-collapse: collapse;border-spacing: 0px;"> 
<td style="float: left; width: 100%; height: 25px; padding-top: 5px; text-align: left; margin-left: 10px;"  >① 주문으로 발생한 적립금은 배송완료 후 20일 부터 실제 사용 가능한 적립금으로 전환됩니다. 배송완료 시점으로부터 20일 동안은 미가용 적립금으로 분류됩니다.</td>
<td style="float: left; width: 100%; height: 25px; text-align: left; margin-left: 10px;"  >② 미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.</td>
<td style="float: left; width: 100%; height: 25px; text-align: left; margin-left: 10px;"  >③ 사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</td>
</tr>

</table>


	<div class="footer" >
	    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

</body>
</html>