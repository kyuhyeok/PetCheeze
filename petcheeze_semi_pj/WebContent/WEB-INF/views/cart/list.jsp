<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">	<!-- main+menu용 CSS(규혁) -->
<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>


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





</style>


<script type="text/javascript">


function checkA(){  //전체체크
	var f = document.cartForm;
	
	if(f.checkOne==undefined)  //장바구니에 아무것도 안담겨있을때
		return;
	
	if(f.checkOne.length==undefined){  //장바구니에 하나만 담겨잇을때
			//체크박스가 한개인경우
			
		if(f.checkAll.checked)
			f.checkOne.checked=true;
		else
			f.checkOne.checked=false;
	
	} else{//체크박스가 여러개인경우
		
		for(var i=0;i<f.checkOne.length;i++){
			if(f.checkAll.checked)
				f.checkOne[i].checked=true;
			else 
				f.checkOne[i].checked=false;
			
		}
	}
}
function deleteCart(cartCode) {  //개별삭제
	f.action="<%=cp%>/cart/deleteOne.do";
	f.submit();
}
function deleteList() {  //체크한 리스트 삭제
	var f = document.cartForm;
	var cnt=0;
	
	if(f.checkOne==undefined)
		return;
	
	if(f.checkOne.length!=undefined){  //체크박스가 둘이상
		for(var i=0;i<f.checkOne.length;i++){
			if(f.checkOne[i].checked)
				cnt++;
		}
	}else{ //체크박스가 하나인경우
		if(f.checkOne.checked)
			cnt++;
	}
	if(cnt==0){
		alert("선택한 항목이 없습니다.");
		return;
	}
	
	if(confirm("선택한 항목을 삭제하시겟습니까?")){
		f.action="<%=cp%>/cart/deleteList.do";
		f.submit();
	}
		
}
function removeAll(){
	var f=document.cartForm;
	
	if(f.checkOne==undefined)
		return;
	
	if(confirm("장바구니를 비우시겠습니까?")){
	f.action="<%=cp%>/cart/removeAll.do";
	f.submit();
	}
}
function updateCnt(cartCode){
	alert("수량변경")
	var f = document.cartForm;
	var s = document.getElementById(cartCode);
	var cnt = s.value;
	cnt=cnt.trim();
	
	if(cnt==0||isNaN(cnt)||!cnt){
		alert("수량을 입력해주세요");
		s.focus();
		return;
	}
	
	f.action="<%=cp%>/cart/updateCart.do";
	f.submit();
}
function subToOrder() {
	var f = document.cartForm;
	
	if(f.checkOne==undefined)
		return;
	
	var cnt=0;
	
	if(f.checkOne.length!=undefined){  //체크박스가 둘이상
		for(var i=0;i<f.checkOne.length;i++){
			if(f.checkOne[i].checked)
				cnt++;
		}
	}else{ //체크박스가 하나인경우
		if(f.checkOne.checked)
			cnt++;
	}
	if(cnt==0){
		alert("선택한 항목이 없습니다.");
		return;
	}
	
	
	alert("주문창으로이동?");

	var id = "${sessionScope.member.userId}";
	if(!id)
		f.action="<%=cp%>/odprocess/odlist_no.do";
	else
	    f.action="<%=cp%>/odprocess/odlist.do";
	f.submit();
}
function subOrder() {
	var f = document.cartForm;
	if(f.checkOne==undefined)
		return;
	
	var id = "${sessionScope.member.userId}";
	
	if(!id)
		f.action="<%=cp%>/odprocess/odlist_all_no.do";
	else
	    f.action="<%=cp%>/odprocess/odlist_all.do";
	
	f.submit();
	
}
function updateCntNoMem(pdcode){//(비회원인경우)
	alert("메롱")
	var f = document.cartForm;
	var s = document.getElementById(pdcode);
	var cnt = s.value;
	cnt=cnt.trim();
	
	if(cnt==0||isNaN(cnt)||!cnt){
		alert("수량을 입력해주세요");
		s.focus();
		return;
	}	
	
	f.action="<%=cp%>/cart/updateCart_no.do";
	   
	f.submit();
}
function deleteList_no() {  //체크한 리스트 삭제  (비회원인경우)
	var f = document.cartForm;
	var cnt=0;
	
	if(f.checkOne==undefined)
		return;
	
	if(f.checkOne.length!=undefined){  //체크박스가 둘이상
		for(var i=0;i<f.checkOne.length;i++){
			if(f.checkOne[i].checked)
				cnt++;
		}
	}else{ //체크박스가 하나인경우
		if(f.checkOne.checked)
			cnt++;
	}
	if(cnt==0){
		alert("선택한 항목이 없습니다.");
		return;
	}
	
	if(confirm("선택한 항목을 삭제하시겟습니까?")){
		f.action="<%=cp%>/cart/deleteList_no.do";
		f.submit();
	}
		
}
function removeAll_no(){  //비회원인경우  장바구니비우기
	var f=document.cartForm;
	
	if(f.checkOne==undefined)
		return;
	
	if(confirm("장바구니를 비우시겠습니까?")){
	f.action="<%=cp%>/cart/removeAll_no.do";
	f.submit();
	}
}
$(function() {
	$('.bt_up').click(function() {
		var n= $('.bt_up').index(this);
		var num = $('.pd_cnt:eq('+n+')').val();
		num=$('.pd_cnt:eq('+n+')').val(num*1+1);
		var pdprice = $('.pd_price:eq('+n+')').val();
		alert(pdprice);
	})
	
})
</script>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>


<div style="width: 1150px; margin: 50px auto;">

<form name="cartForm" method="post">

<ul style="margin: 50px auto 20px;">
	<li style="list-style: none; text-align: center;">c a r t</li>
</ul>

<div align="center">
	<img class="stepImg" src="<%=cp%>/resource/images/img_step1.gif">
</div>

<c:if test="${not empty sessionScope.member}">
<div class="userInfo">
	<div style="border-right: 1px solid #eeeeee; width: 105px; height:50px; float: left; margin: 10px 3px; padding-top: 10px; padding-left: 20px; ">혜택정보</div>
	<div style="float: left;">
		<div style="width : 1000px;height:32px; clear: both; padding-left: 10px; padding-top: 5px; border-bottom: 1px solid #cccccc">
		 ${sessionScope.member.userName}님
		</div>
		<div style="width : 1000px;height:32px; clear: both; padding-left: 10px; padding-top: 5px;">
		<span>가용적립금 : </span>
		<span style="color: #ff8aa9;">3000원</span>   
		<span>쿠폰 : </span>
		<span style="color: #ff8aa9;">0개</span>  
		</div>
	</div>
</div>
</c:if>

<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="#">국내배송상품</a></li>
  <li role="presentation"><a href="<%=cp%>/cart/pdpage.do">상품목록</a></li>
</ul>

<table class="carttable">
	<tr style="border: 1px solid #cccccc; height: 38px;background: #eeeeee;" >
		<td colspan="10" style="text-align: left;">
		 <span style="font-weight: bold;">
		  &nbsp;일반상품 (${dataCount}) 
		</span>
		</td>
	
	</tr>
	<tr>
		<th>
			<input type="checkbox" name="checkAll" value="all" onclick="checkA();">
		</th>
		<th>이미지</th>
		<th width="400px">상품정보</th>
		<th>수량</th>
		<th>판매가</th>
		<th>적립금</th>
		<th>배송구분</th>
		<th>배송비</th>
		<th width="91px">합계</th>
		<th width="107px">선택</th>	
	</tr>
	
<c:if test="${not empty sessionScope.member}">	
	 <c:forEach var="dto" items="${list}">
	
	<tr height="94px">
		<td>
			<input type="checkbox" name="checkOne" value="${dto.cartCode}">
		</td>
		<td align="center">
		 <img src="<%=cp%>/resource/images/product_contents/${dto.pdcode}/${dto.image}" style="height: 80px;width: 80px;">
		</td>
		<td>
			${dto.pdName}
		</td>
		<td>
		  <div style="text-align: center;">
			<div>
				<input type="hidden" name="cartCode" value="${dto.cartCode}">
				<input type="text" class="pd_cnt" name="${dto.cartCode}" id="${dto.cartCode}" value="${dto.cartCnt}" style="height: 26px; width: 26px; text-align: center;">
				
			</div>
			<div style="clear: both;">		
			  <img src="<%=cp%>/resource/images/changecnt.gif" style="cursor: pointer; margin-top: 5px;" onclick="updateCnt('${dto.cartCode}')"><br>
			</div>
		  </div>	
			
		</td>
		<td>
			<fmt:formatNumber value="${dto.pdPrice}" pattern="#,###" />
		</td>
		<td>${dto.pdMil}</td>
		<td>기본배송</td>
		<td style="border-right: 1px solid #cccccc">
		
		 <c:if test="${totPrice>=50000}">무료</c:if>
		 <c:if test="${totPrice<50000}">5,000원<br>조건</c:if>
		</td>
		<td style="border-right: 1px solid #cccccc"><fmt:formatNumber value="${dto.cartCnt*dto.pdPrice}" pattern="#,###" />원</td>
		<td style="border-right: 1px solid #cccccc">
		  <a href="<%=cp%>/odprocess/oddirect.do?cartCode=${dto.cartCode}">
		     <img src="<%=cp%>/resource/images/ordergo.gif" style="cursor: pointer;"><br>
		  </a>
		  <img src="<%=cp%>/resource/images/addwishlist.gif" style="cursor: pointer;"><br>
		  <a href="<%=cp%>/cart/deleteOne.do?cartCode=${dto.cartCode}">
		     <img src="<%=cp%>/resource/images/deleteone.gif" style="cursor: pointer;">
		  </a>
		</td>	
	 </tr>
	</c:forEach>
</c:if>
<c:if test="${empty sessionScope.member}">
  <c:forEach var="dto" items="${pdlist}">
	
	<tr height="94px">
		<td>
			<input type="checkbox" name="checkOne" value="${dto.pdcode}">
		</td>
		<td align="center">
		   <img src="<%=cp%>/resource/images/product_contents/${dto.pdcode}/${dto.image}" style="height: 80px;width: 80px;">
			
		</td>
		<td style="border-right: 1px solid #cccccc;">
			${dto.pdName}
		</td>
		<td style="border-right: 1px solid #cccccc">
		  <div style="text-align: center;">
			<div>
				<input type="hidden" name="pdcode" value="${dto.pdcode}">
				<input type="text" name="${dto.pdcode}" id="${dto.pdcode}" value="${dto.cartCnt}" style="height: 26px; width: 26px; text-align: center;">
			</div>
			<div style="clear: both;">	
			 <img src="<%=cp%>/resource/images/changecnt.gif" style="cursor: pointer; margin-top: 5px;" onclick="updateCntNoMem('${dto.pdcode}')"><br>	
			</div>
		  </div>	
			
		</td>
		<td>
		 <input type="hidden" class="pd_price" value="${dto.pdPrice}">
		   <fmt:formatNumber value="${dto.pdPrice}" pattern="#,###" />
		</td>
		<td>${dto.pdMil}</td>
		<td>기본배송</td>
		<td style="border-right: 1px solid #cccccc">
		
		 <c:if test="${totPrice>=50000}">무료</c:if>
		 <c:if test="${totPrice<50000}">5,000원<br>조건</c:if>
		</td>
		<td style="border-right: 1px solid #cccccc">
		  <fmt:formatNumber value="${dto.cartCnt*dto.pdPrice}" pattern="#,###" />원
		</td>
		<td style="border-right: 1px solid #cccccc">
		
		   <a href="<%=cp%>/odprocess/oddirect_no.do?pdCode=${dto.pdcode}">
		     <img src="<%=cp%>/resource/images/ordergo.gif" style="cursor: pointer;"><br>
		  </a>
		  <img src="<%=cp%>/resource/images/addwishlist.gif" style="cursor: pointer;"><br>
		  <a href="<%=cp%>/cart/deleteOne_no.do?pdCode=${dto.pdcode}">
		     <img src="<%=cp%>/resource/images/deleteone.gif" style="cursor: pointer;">
		  </a>
	
		</td>	
	 </tr>
	</c:forEach>

</c:if>



	<tr height="50px" style="background: #eeeeee">
		<td colspan="2" style="text-align: left;">&nbsp;[기본배송]</td>
		<td colspan="7" style="text-align: right;">상품구매금액 <fmt:formatNumber value="${totPrice}" pattern="#,###" /> + 
		 <c:if test="${totPrice>=50000}">배송비 0 = &nbsp;</c:if>
		 <c:if test="${totPrice<50000}">배송비 5,000 = &nbsp;</c:if>
		</td>
		<td style="border-right: 1px solid #cccccc;">
		 <c:if test="${totPrice>=50000}"> 합계 : <fmt:formatNumber value="${totPrice}" pattern="#,###" />원</c:if>
		 <c:if test="${totPrice<50000}"> 합계 :<fmt:formatNumber value="${totPrice+5000}" pattern="#,###" />원</c:if>
		</td>
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
  	  	<c:if test="${not empty sessionScope.member }">
  	  	 <img src="<%=cp%>/resource/images/deletecheck.gif" onclick="deleteList()" style="cursor: pointer;">
  	    </c:if>
  	    <c:if test="${empty sessionScope.member}">
  	      <img src="<%=cp%>/resource/images/deletecheck.gif" onclick="deleteList_no()" style="cursor: pointer;">
  	    </c:if>
  	  </td>
  	  <td align="right">
  	  
  	  <c:if test="${not empty sessionScope.member}">
  	  	<img src="<%=cp%>/resource/images/removeall.gif" onclick="removeAll()" style="cursor: pointer;">
	  </c:if>
	  <c:if test="${empty sessionScope.member}">
  	  	<img src="<%=cp%>/resource/images/removeall.gif" onclick="removeAll_no()" style="cursor: pointer;">
	  </c:if>
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
		  <td><fmt:formatNumber value="${totPrice}" pattern="#,###" /> 원</td>
		  <td>
		  <c:if test="${totPrice>=50000}">+0원</c:if>
		  <c:if test="${totPrice<50000}">+5,000원</c:if>
		  </td>
		  <td style="border-right: 1px solid black;">
		    <c:if test="${totPrice>=50000}"><fmt:formatNumber value="${totPrice}" pattern="#,###" />원</c:if>
		    <c:if test="${totPrice<50000}"><fmt:formatNumber value="${totPrice+5000}" pattern="#,###" />원</c:if>
		  </td>
	</table>

	<div style="text-align: center; margin: 30px auto 70px;">
	
		 <img src="<%=cp%>/resource/images/btn_order_all.gif" onclick="subOrder()" style="cursor: pointer;">
		 <img src="<%=cp%>/resource/images/btn_order_select.gif" onclick="subToOrder()" style="cursor: pointer;">
		<span style="text-align:right;">
		<a href="<%=cp%>/main.do">
		 <img src="<%=cp%>/resource/images/goingshop.gif" style="cursor: pointer;" >
		</a>
		</span>
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