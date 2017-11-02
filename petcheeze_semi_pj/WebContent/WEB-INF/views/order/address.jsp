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

<h4><p align="center"  style="width: 1150px; margin:10px auto;">ADDRESS</p></h4>
<h5><p align="center"  style="width: 1150px; margin:10px auto;">자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p></h5>

<c:forEach var="adlist" items="${adlist}"> 

<table style="width: 1150px; height: 30px; margin-top:20px;border:1px solid siver; margin-left:auto; margin-right:auto; 
border-collapse: collapse;border-spacing: 0px; text-align:center; border: 1px solid silver; font-size: 12px; ">
<tr style="border-collapse: collapse;border-spacing: 0px;">
<td style="width: 27px; height: 36px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;  "  ><input type="checkbox" value></td>
<td style="width: 91px; height: 36px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;  "  >주소록 고정</td>
<td style="width: 106px; height: 36px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >배송지명</td>
<td style="width: 106px; height: 36px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >수령인</td>
<td style="width: 131px; height: 36px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >휴대전화</td>
<td style="width: 500px; height: 36px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >주소</td>
<td style="width: 87px; height: 36px; border: 1px solid silver; padding-top: 5px; padding-bottom:5px;" >수정</td>
</tr>
<tr style="border-collapse: collapse;border-spacing: 0px;"> 
<td style="width: 27px; height: 38px;  padding-top: 5px; padding-bottom:5px;  "  ><input type="checkbox" value></td>
<td style="width: 91px; height: 38px;  padding-top: 5px; padding-bottom:5px;  "  ><input type="image" src="<%=cp%>/resource/images/btn_address_clear.gif"></td>
<td style="width: 106px; height: 38px;  padding-top: 5px; padding-bottom:5px;" >${adlist.userName}</td>
<td style="width: 106px; height: 38px;  padding-top: 5px; padding-bottom:5px;" >${adlist.userName}</td>

<td style="width: 131px; height: 38px;  padding-top: 5px; padding-bottom:5px;" >${adlist.tel}</td>
<td style="width: 500px; height: 38px;  padding-top: 5px; padding-bottom:5px;" >(${adlist.addr0})${adlist.addr1} ${adlist.addr0}</td>
<td style="width: 87px; height: 38px;  padding-top: 5px; padding-bottom:5px;" ><input type="image" src="<%=cp%>/resource/images/btn_address_modify.gif"></td>
</tr>
</table>
</c:forEach>

<div style="margin: 10px auto; width: 1150px; border-collapse: collapse;border-spacing: 0px;">
<span style="float: left;"> <input  type="image" src="<%=cp%>/resource/images/btn_address_delete.gif"></span>
<span style="float: right;"> <input  type="image" src="<%=cp%>/resource/images/btn_address_register.gif"></span>

</div>
<br>

<div align="center" style="margin: 30px auto; border-collapse: collapse;border-spacing: 0px;">
<input type="image" src="<%=cp%>/resource/images/btn_page_first.gif">
<input type="image" src="<%=cp%>/resource/images/btn_page_prev.gif">

<input type="image" src="<%=cp%>/resource/images/btn_page_next.gif">
<input type="image" src="<%=cp%>/resource/images/btn_page_last.gif">
</div>

<table style="width: 1150px; height: 40px; margin-top:20px;border:1px solid siver; margin-left:auto; margin-right:auto; 
border-collapse: collapse; border-spacing: 0px; text-align:center; border: 1px solid silver; margin-bottom: 50px;">
<tr style="border-collapse: collapse; border-spacing: 0px; ">
<td style="  width: 1150px;  height: 26px; padding-top: 5px; text-align: left; border: 1px solid silver; padding-left: 10px; "  ><b>배송주소록 유의사항</b></td>

</tr>
<tr style="border-collapse: collapse;border-spacing: 0px;"> 
<td style="float: left; width: 100%; height: 25px; padding-top: 10px; text-align: left; margin-left: 10px;"  >① 배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</td>
<td style="float: left; width: 100%; height: 25px; padding-bottom: 10px;text-align: left; margin-left: 10px;"  >② 자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</td>
</tr>

</table>


	<div class="footer" >
	    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

</body>
</html>