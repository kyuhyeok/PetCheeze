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

<h4><p align="center"  style="width: 1150px; margin:10px auto;">O R D E R</p></h4>


<table style="width: 1150px; height: 40px; margin-top:20px;border:1px solid siver; margin-left:auto; margin-right:auto; 
border-collapse: collapse;border-spacing: 0px; text-align:center; border: 1px solid silver; background: #f2f2f2;">


<tr>

<td style="float: left; width: 199px; height: 30px; border-right: 1px solid silver; padding-top: 10px;"  ><a>주문내역조회(0)</a></td>
<td style="float: left; width: 199px; height: 30px; border-right: 1px solid silver; padding-top: 10px;" ><a>취소/반품/교환 내역(0)</a></td>
<td style="float: left; width: 544px; height: 30px;  padding-top: 10px; " ></td>

</tr>

</table>


<table style="width: 1150px; height: 90px; margin: 30px auto 0px; border: 5px solid #EAEAEA;
border-collapse: collapse;border-spacing: 0px; font-size: 12px;" >
<tr>
<td style="margin-left: 20px; margin-top: 25px; width: 39px; height: 24px;  float: left; border: 1px solid silver; text-align: center; background: #f2f2f2;" >오늘</td>
<td style="margin-top: 25px; width: 39px; height: 24px;  float: left; border: 1px solid silver; text-align: center; background: #f2f2f2;" >1주일</td>
<td style="margin-top: 25px; width: 39px; height: 24px;  float: left; border: 1px solid silver; text-align: center; background: #f2f2f2;" >1개월</td>
<td style="margin-top: 25px; width: 39px; height: 24px;  float: left; border: 1px solid silver; text-align: center; background: #f2f2f2;" >3개월</td>
<td style="margin-top: 25px; width: 39px; height: 24px;  float: left; border: 1px solid silver; text-align: center; background: #f2f2f2;" >6개월</td>
<td style="margin-left: 20px; margin-top: 25px; float: left; text-align: right; " ><input type="text" style="height: 22px;width: 150px;"></td>
<td style="float: left; margin-left: 5px; margin-top: 30px;text-align: right; " ><input type="image" src="<%=cp%>/resource/images/ico_cal.gif"></td>
<td style="float: left; margin-left: 5px; margin-top: 28px;text-align: right;" >~</td>
<td style="margin-left: 10px; margin-top: 25px; float: left; text-align: right; " ><input type="text" style="height: 22px;width: 150px;"></td>
<td style="float: left; margin-left: 5px; margin-top: 30px;text-align: right; " ><input type="image" src="<%=cp%>/resource/images/ico_cal.gif"></td>
<td style="float: left; margin-left: 10px; margin-top: 27px;text-align: right; " ><input type="image" src="<%=cp%>/resource/images/btn_search.gif"></td>

</tr>

</table>

<ul style="width: 1150px; margin: 30px auto 0px;">
<li style="color: silver;"><h5>- 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</h5></li>
<li style="color: silver;"><h5>- 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</h5></li>
</ul>


<p style="width: 1150px; margin: 60px auto 0px;"><b>주문 상품 정보</b></p>

<table style="width: 1150px; height: 30px; margin-top:20px;border:1px solid siver; margin-left:auto; margin-right:auto; 
border-collapse: collapse;border-spacing: 0px; text-align:center; border: 1px solid silver; ">
<tr style="border-collapse: collapse;border-spacing: 0px;">
<td style="width: 135px; height: 52px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;  "  >주문날짜<br>[주문번호]</td>
<td style="width: 93px; height: 52px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >이미지</td>
<td style="width: 526px; height: 52px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >상품정보</td>
<td style="width: 61px; height: 52px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >수량</td>
<td style="width: 111px; height: 52px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;  "  >상품구매금액</td>
<td style="width: 111px; height: 52px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >주문처리상태</td>
<td style="width: 111px; height: 52px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >취소/교환/반품</td>
</tr>
<tr style="border-collapse: collapse;border-spacing: 0px;"> 
<td colspan="7" style="width: 199px; height: 150px; border: 1px solid silver; border-right: 1px solid silver; padding-top: 5px; padding-bottom:5px;"  ><b>주문내역이 없습니다</b></td>
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