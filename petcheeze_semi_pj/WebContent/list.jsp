<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	String cp = request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>cart</title>
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
<style type="text/css">
.carttable {
	border-collapse: collapse;
	border-spacing: 0px;
	border-top: 1px solid #cccccc;
	border-left: 1px solid #cccccc;
	margin: 30px auto 9px;
	width: 1140px;
}

.carttable th{
	height : 37px;
	border-bottom: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	text-align: center;
}
.carttable td {
	text-align: center;
	border-bottom: 1px solid #cccccc;
}

.odbtn{
	width: 90px;
	height: 30px;
	background-color: black;
	color:white;
	text-align: center;
	border-radius: 5px;

}
.wibtn{
	min-width: 90px;
	height: 30px;
	background: white;
	text-align: center;
	border-radius: 5px;
}
</style>
<script type="text/javascript">
function updateCnt(){
	
	
}

</script>
</head>
<body>


<div style="width: 1150px; margin: 50px auto;" >
<form name="cartForm">
<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="#">국내배송상품</a></li>
  <li role="presentation"><a href="#">해외배송상품</a></li>
</ul>

<table class="carttable">
	<tr style="border: 1px solid #cccccc; height: 38px;">
		<td colspan="10" style="text-align: left;">&nbsp;일반상품 </td>
	
	</tr>
	<tr>
		<th>
			<input type="checkbox">
		</th>
		<th>이미지</th>
		<th>상품정보</th>
		<th>수량</th>
		<th>판매가</th>
		<th>적립금</th>
		<th>배송구분</th>
		<th>배송비</th>
		<th width="350px">합계</th>
		<th>선택</th>	
	</tr>
	<tr>
		<td>
			<input type="checkbox">
		</td>
		<td align="center">
			<input type="image" src="<%=cp%>/resource/images/soganp_image.GIF" style="height: 80px;">
		</td>
		<td style="border-right: 1px solid #cccccc;">
			황태파우더
		</td>
		<td style="border-right: 1px solid #cccccc">
		  <div style="text-align: center;">
			<div>
				<input type="text" name="pdCount" value="1" style="height: 26px; width: 26px; text-align: center;">
			</div>
			<div style="clear: both;">
			 <button type="button" class="btn btn-default btn-xs" onclick="updateCnt()">변경</button>
			</div>
		  </div>	
			
		</td>
		<td>
			5000원
		</td>
		<td>116원</td>
		<td>기본배송</td>
		<td style="border-right: 1px solid #cccccc">5000원<br>조건</td>
		<td style="border-right: 1px solid #cccccc">11600원</td>
		<td style="border-right: 1px solid #cccccc">
			<button type="button" class="odbtn">
  				<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span> 주문하기
			</button><br>
			<button type="button" class="odbtn">관심상품등록</button><br>
			<button type="button" class="odbtn">삭제</button>
		</td>	
	</tr>
	<tr>
		<td colspan="8" style="text-align: left;">&nbsp;[기본배송] </td>
		<td style="text-align: right;">상품구매금액 33,600 + 배송비 5,000 = 합계 : &nbsp;</td>
		<td style="border-right: 1px solid #cccccc;">3860원</td>
	</tr>
  </table>
  <table style="width: 1140px;">
  	<tr height="40px">
  		<td colspan="2" style="border-bottom: 1px solid #cccccc">&nbsp;&nbsp;
  		  <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
  	      <span style="font-size:11px"> 할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</span>
  	    </td>
  	</tr>
  	<tr>
  	  <td style="height:50px;">
  	  	&nbsp;선택상품을 
  	  	<button type="button" class="odbtn">
  				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 삭제하기
		</button>
		<button type="button" class="wibtn">
  			해외배송 장바구니로 이동
		</button>
  	  </td>
  	  <td align="right">
  	   <button type="button" class="wibtn">
  			장바구니비우기
		</button>
  	  </td>
  	</tr>
  </table>

	<table class="carttable">
		<tr height="40px">
		  <th>총 상품구매</th>
		  <th>총 배송비</th>
		  <th>결제예정금액</th>
		</tr>
		<tr height="60">
		  <td>33600원</td>
		  <td>+5000원</td>
		  <td style="border-right: 1px solid #cccccc">38600원</td>
		</tr>	
	</table>


</form>
</div>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>