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
<title>Insert title here</title>

<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css"
	type="text/css">
<!-- main+menu용 CSS(규혁) -->
<link rel="stylesheet" href="<%=cp%>/resource/css/style.css"
	type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css"
	type="text/css">
<style type="text/css">
.carttable {
	border-collapse: collapse;
	border-spacing: 0px;
	border-top: 1px solid #cccccc;
	border-left: 1px solid #cccccc;
	margin: 10px auto 9px;
	width: 1140px;
}
.carttable th {
	height: 37px;
	border-bottom: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	text-align: center;
}

.carttable td {
	text-align: center;
	border-bottom: 1px solid #cccccc;
}
.delinfo{
	border-collapse: collapse;
	border-spacing: 0px;
	border: 1px solid #cccccc;
	margin: 10px auto 9px;
	width: 1140px;
}
.delinfo th {
	width: 100px;
	height: 37px;
	border-bottom: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	text-align: center;
	background: #eeeeee;
}

.delinfo td {
	text-align: left;
	padding:10px 10px;
	border-bottom: 1px solid #cccccc;
}
.carttable3{
	border-collapse: collapse;
	border-spacing: 0px;
	border: 1px solid #cccccc;
	margin: 10px auto 9px;
	width: 1140px;
}
.carttable3 td {
	text-align: left;
	padding:10px 10px;
	border-bottom: 1px solid #cccccc;
}

.carttable4{
	border-collapse: collapse;
	border-spacing: 0px;
	border: 1px solid #cccccc;
	margin: 10px auto 9px;
	width: 1140px;
}
.carttable4 td {
	text-align: left;
	padding:10px 10px;
}

.userInfo {
	border: 5px solid #eeeeee;
	width: 1150px;
	height: 90px;
	margin-bottom: 50px;
	padding: 5px 5px 5px 10px;
}

.carttable2 {
	border-collapse: collapse;
	border-spacing: 0px;
	border: 1px solid black;
	width: 1140px;
	margin: 10px auto;
}

.carttable2 th {
	height: 40px;
	text-align: center;
	background-color: #f5f5f5;
}

.carttable2 td {
	height: 60px;
	text-align: center;
	border-right: 1px solid #eeeeee;
}



.stepImg {
	width: 1100px;
	height: 50px;
	margin: 20px auto 30px;
}
</style>

<script type="text/javascript">
function payCom() {
	var f = document.cartForm;
	var str;
	
	str=f.takerName.value;
	str=str.trim();
	
	if(!str){
		alert("받는사람을 입력하세요!");
		f.takerName.focus();
		return;
	}
	
	str=f.add0.value;
	str=str.trim();
	if(!str){
		alert("우편번호를 입력하세요");
		f.add0.focus();
		return;
	}
	
	str=f.add1.value;
	str=str.trim();
	if(!str){
		alert("주소를 입력하세요");
		f.add1.focus();
		return;
	}
	
	str=f.add2.value;
	str=str.trim();
	if(!str){
		alert("상세주소를 입력하세요");
		f.add2.focus();
		return;
	}
	
	
	 str = f.tel2.value;
	 str = str.trim();
	 if(!str) {
	        alert("전화번호를 입력하세요. ");
	        f.tel2.focus();
	        return;
	    }
	 if(!/^(\d+)$/.test(str)) {
	        alert("숫자만 가능합니다. ");
	        f.tel2.focus();
	        return;
	    }
	 
	 str=f.tel3.value;
	 str=str.trim();
	 if(!str){
		 alert("전화번호를 입력하세요. ");
	     f.tel2.focus();
	     return;
	 }
	 if(/^(\d+)&/.test(str)){
		alert("숫자만입력가능합니다.");
		f.tel3.focus();
		return;
	 }
	 
	 
	 var id= "${sessionScope.member.userId}";
	 
	 if(!id)
		 f.action="<%=cp%>/odprocess/pay_complete_no.do";
	 else
	     f.action="<%=cp%>/odprocess/pay_complete.do";
	
	 
	 f.submit();
}
function newInfo() {
	var f = document.cartForm;
	
	f.takerName.value="";
	f.add0.value="";
	f.add1.value="";
	f.add2.value="";
	f.tel2.value="";
	f.tel3.value="";
	
	return;	
}
function sameInfo() {
	var f = document.cartForm;
	
	
	f.takerName.value="${mdto.userName}";
	
	f.add0.value="${mdto.addr0}";
	f.add1.value="${mdto.addr1}";
	f.add2.value="${mdto.addr2}";
	f.tel2.value="${mdto.tel2}";
	f.tel3.value="${mdto.tel3}";
	return;
}

</script>
</head>
<body>

	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div style="width: 1150px; margin: 50px auto;">
		<form name="cartForm" method="post">

			<ul style="margin: 50px auto 20px;">
				<li style="list-style: none; text-align: center;">o r d e r</li>
			</ul>
			<div align="center">
				<img class="stepImg" src="<%=cp%>/resource/images/img_step4.gif">
			</div>

			<div align="center" style="margin-bottom: 90px">
			   <img class="stepImg" src="<%=cp%>/resource/images/com_ok.PNG" style="width: 100px; height: 100px;"><br>
			   <span style="font-size: 25px; font-weight: bold;">
			      		고객님의 주문이 완료 되었습니다.
			   </span><br><br>
				<span style="font-size: 15px">
				   주문내역 및 배송에 관한 안내는 주문조회 를 통하여 확인 가능합니다
				</span> 
			</div>
					
				
			<table class="carttable">
				<tr style="border: 1px solid #cccccc; height: 38px;">
					<td colspan="8" style="text-align: left; font-weight: bold;background: #eeeeeew">&nbsp;국내배송상품 주문내역</td>
				</tr>
				<tr>
					<th>이미지</th>
					<th width="400px">상품정보</th>
					<th>수량</th>
					<th width="100px">판매가</th>
					<th>적립금</th>
					<th>배송구분</th>
					<th width="90px">배송비</th>
					<th>합계</th>
				</tr>


				<c:forEach var="dto" items="${list}">
				
					<tr>

						<td align="center" height="90px;">
						 <img src="<%=cp%>/resource/images/product_contents/${dto.pdcode}/${dto.pdimage}" style="height: 80px;">
						</td>
						<td style="border-right: 1px solid #cccccc;text-align: left; padding-left: 20px;">${dto.pdname}</td>
						<td style="border-right: 1px solid #cccccc">
							<div style="text-align: center;">
								<div>
									${dto.cartCnt}
								</div>
			
							</div>

						</td>
						<td> <fmt:formatNumber value="${dto.pdprice}" pattern="#,###" /> </td>
					<c:if test="${empty sessionScope.member}">
					   <td> - </td>
					</c:if>
					<c:if test="${not empty sessionScope.member}">
					   <td>${dto.pdmil}</td>
					</c:if>
						
						<td>기본배송</td>
						<td style="border-right: 1px solid #cccccc">
						<c:if test="${totPrice>=50000}">무료</c:if> 
						<c:if test="${totPrice<50000}">5,000원<br>조건</c:if></td>
						<td style="border-right: 1px solid #cccccc">
						  <fmt:formatNumber value="${dto.cartCnt*dto.pdprice}" pattern="#,###" />
						원
						</td>

					</tr>
	
				</c:forEach>


				<tr height="50px" style="background: #eeeeee">
					<td style="text-align: left;">&nbsp;[기본배송]</td>
					<td colspan="6" style="text-align: right;">
					  <fmt:formatNumber value="${totPrice}" pattern="#,###"/> + 
					<c:if test="${totPrice>=50000}">배송비 0 = 합계 &nbsp;</c:if> 
					<c:if test="${totPrice<50000}">배송비 5,000 = 합계 : &nbsp;</c:if>
					</td>
					<td style="border-right: 1px solid #cccccc;"><c:if
							test="${totPrice>=50000}"><fmt:formatNumber value="${totPrice}" pattern="#,###"/>원</c:if> 
							
						<c:if  test="${totPrice<50000}"><fmt:formatNumber value="${totPrice+5000}" pattern="#,###" />원</c:if></td>
				</tr>
			</table>

<hr style="margin: 30px auto">

		
	



		<div style="margin-top: 30px;">
			<span style="align-content: center; color: red;">&nbsp;&nbsp;*</span>결제 예정 금액		
		</div>

			<table class="carttable2">
				<tr height="40px">
					<th width="400px">총 주문 금액 </th>
					<th>총 배송비</th>
					<th>총 결제예정 금액</th>
				</tr>
				<tr height="60">
					<td><fmt:formatNumber value="${totPrice}" pattern="#,###" />원</td>
					<td><c:if test="${totPrice>=50000}">+0원</c:if> <c:if
							test="${totPrice<50000}">+5,000원</c:if></td>
					<td style="border-right: 1px solid black;"><c:if
							test="${totPrice>=50000}"><fmt:formatNumber value="${totPrice}" pattern="#,###"/> 원</c:if> <c:if
							test="${totPrice<50000}"><fmt:formatNumber value="${totPrice+5000}" pattern="#,###" />원</c:if></td>
			</table>
			
				<table class="delinfo">  <!-- 배송지정보 -->
				
			<c:if test="${empty sessionScope.member}">
			 <tr>
			  <th>이메일
			  <span style="align-content: center; color: red;">*</span>
			  </th>
			  <td>
			  	${paydto.email}
			  </td>
			</tr>
			</c:if>
			
			<tr>
			  <th>받으시는분
			  <span style="align-content: center; color: red;">*</span>
			  </th>
			  <td>
			  	${paydto.taker}
			  </td>
			</tr>
			<tr>
			  <th>우편번호
			 
			  </th>
			  <td>
			  	  ${paydto.addr0}
			
			  </td>
			</tr>
			<tr>
			  <th>주소</th>
			  <td>
			  	 ${paydto.addr1} ${paydto.addr2}
			  </td>
			</tr>
			<tr>
			  <th>휴대전화
			  <span style="align-content: center; color: red;">*</span>
			  </th>
			  <td>
			  	${paydto.tel}
			  </td>
			</tr>
			<tr>
			  <th>배송메세지</th>
			  <td>
			    ${paydto.memo}
			  </td>
			</tr>
		
		
		</table>
		<div align="right">
		<a href="<%=cp%>/main.do">
		 <img src="<%=cp%>/resource/images/goingshop.gif" style="cursor: pointer;" >
		</a>
		</div>	
		
		
	</div>
		
		</form>
		
		
	</div>

</body>


</html>









