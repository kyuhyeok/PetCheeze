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
	width: 100px;
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
.userInfo{
	border: 5px solid #eeeeee;
	width: 1150px; 
	height: 90px;
	margin-bottom: 50px;
	padding: 5px 5px 5px 10px;

}
.carttable2{
	border-collapse: collapse;
	border-spacing: 0px;
	border: 1px solid black;
	width: 1140px;
	margin: 30px auto;
}
.carttable2 th{
	height: 40px;
	text-align: center;
	background-color: #f5f5f5;
}
.carttable2 td{
	height: 60px;
	text-align: center;
	border-right: 1px solid #eeeeee;
}
.stepImg{
	width: 1100px;
	height : 50px;
	margin: 20px auto 30px;
}


.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
	background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
	background-color:#f9f9f9;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	padding:8px 19px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
	background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
	background-color:#e9e9e9;
}
.myButton:active {
	position:relative;
	top:1px;
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


<ul style="margin: 50px auto 20px;">
	<li style="list-style: none; text-align: center;">c a r t</li>
</ul>

<div align="center">
	<img class="stepImg" src="<%=cp%>/resource/images/img_step1.gif">
</div>

<div class="userInfo">
	<div style="border-right: 1px solid #eeeeee; width: 105px; height:50px; float: left; margin: 10px 3px; padding-top: 10px; padding-left: 20px; ">혜택정보</div>
	<div style="float: left;">
		<div style="width : 1000px;height:32px; clear: both; padding-left: 10px; padding-top: 5px; border-bottom: 1px solid #cccccc">박가람님</div>
		<div style="width : 1000px;height:32px; clear: both; padding-left: 10px; padding-top: 5px;">
		<span>가용적립금 : </span>
		<span style="color: #ff8aa9;">3000원</span>   
		<span>쿠폰 : </span>
		<span style="color: #ff8aa9;">0개</span>  
		</div>
	</div>
</div>



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
			<button class="myButton" style="width:120px;"> 주문하기</button><br>
			<button class="myButton" style="width:120px;">관심상품등록</button><br>
			<button class="myButton" style="width:120px;">삭제</button>
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

	<table class="carttable2">
		<tr height="40px">
		  <th>총 상품구매</th>
		  <th>총 배송비</th>
		  <th>결제예정금액</th>
		</tr>
		<tr height="60">
		  <td>33600원</td>
		  <td>+5000원</td>
		  <td style="border-right: 1px solid black;">38600원</td>
	</table>

	<div style="text-align: center; margin: 30px auto 70px;">
		 <input type="image" src="<%=cp%>/resource/images/byall.PNG">
		<input type="image" src="<%=cp%>/resource/images/checkby.PNG">
	</div>
	
	
  <div style="border: 2px solid #ededed; padding: 10px;">
	<div style="border-bottom: 2px solid #ededed; height: 30px;">이용안내</div>
	<div class="content">
        <h4>장바구니 이용안내</h4>
        <ul>
	<li class="item1">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
            <li class="item2">해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
            <li class="item3">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
            <li class="item4">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
            <li class="item5">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
            <li class="item6">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
        </ul>
	<h4>무이자할부 이용안내</h4>
        <ul>
	<li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
            <li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
            <li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
        </ul>
	</div>
  </div>

</form>
</div>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>