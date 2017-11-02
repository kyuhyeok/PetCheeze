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
				<li style="list-style: none; text-align: center;">c a r t</li>
			</ul>
			<div align="center">
				<img class="stepImg" src="<%=cp%>/resource/images/img_step2.gif">
			</div>

			<c:if test="${not empty sessionScope.member}">
				<div class="userInfo">
					<div
						style="border-right: 1px solid #eeeeee; width: 105px; height: 50px; float: left; margin: 10px 3px; padding-top: 10px; padding-left: 20px;">혜택정보</div>
					<div style="float: left;">
						<div
							style="width: 1000px; height: 32px; clear: both; padding-left: 10px; padding-top: 5px; border-bottom: 1px solid #cccccc">
							${sessionScope.member.userName}님</div>
						<div
							style="width: 1000px; height: 32px; clear: both; padding-left: 10px; padding-top: 5px;">
							<span>가용적립금 : </span> <span style="color: #ff8aa9;">3000원</span>
							<span>쿠폰 : </span> <span style="color: #ff8aa9;">0개</span>
						</div>
					</div>
				</div>
			</c:if>


			<div style="width:1140px;text-align: right; color: red; height:30px; margin-bottom: 10px; vertical-align: middle;" align="center">
			  &nbsp;상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.
			 &nbsp;&nbsp; 
			 
			 <a href="<%=cp%>/cart/list.do">
			 <img align="middle" src="<%=cp%>/resource/images/btn_prev.gif" style="cursor: pointer;">
			 </a>
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
				
				
<c:if test="${mode=='check'}">

				<c:forEach var="dto" items="${cartlist}">
				
					<tr>

						<td align="center" height="90px;">
						 <img src="<%=cp%>/resource/images/product_contents/${dto.pdcode}/${dto.pdimage}" style="height: 80px;">
						</td>
						<td style="border-right: 1px solid #cccccc;text-align: left; padding-left: 20px;">${dto.pdname}</td>
						<td style="border-right: 1px solid #cccccc">
							<div style="text-align: center;">
								<div>
									<input type="hidden" name="cartCode" value="${dto.cartCode}">
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
</c:if>
<c:if test="${mode=='nocheck'}">
					<tr>

						<td align="center">
						 <img src="<%=cp%>/resource/images/product_contents/${dto.pdcode}/${dto.pdimage}" style="height: 80px;">
						</td>
						<td style="border-right: 1px solid #cccccc;">${dto.pdname}</td>
						<td style="border-right: 1px solid #cccccc">
							<div style="text-align: center;">
								<div>
									<input type="hidden" name="cartCode" value="${dto.cartCode}">
									${dto.cartCnt}
								</div>
			
							</div>

						</td>
						<td> <fmt:formatNumber value="${dto.pdprice}" pattern="#,###" /> </td>
						<td>${dto.pdmil}</td>
						<td>기본배송</td>
						<td style="border-right: 1px solid #cccccc">
						<c:if test="${totPrice>=50000}">무료</c:if> 
						<c:if test="${totPrice<50000}">5,000원<br>조건</c:if></td>
						<td style="border-right: 1px solid #cccccc">
							<fmt:formatNumber value="${dto.cartCnt*dto.pdprice}" pattern="#,###" />
						원</td>

					</tr>
</c:if>
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

		<div>
			<span style="align-content: center; color: red;">&nbsp;&nbsp;*</span>필수사항		
		</div>
		<table class="delinfo">  <!-- 배송지정보 -->
			<tr>
			  <th>배송지 선택
			  <span style="align-content: center; color: red;">*</span>
			  </th>
			  <td>
			    <input type="radio" name="addname" value="sameInfo"onclick="sameInfo()" ${empty sessionScope.member? "disabled='disabled'":"checked='checked'"}><label> 회원 정보와 동일</label>
			  	<input type="radio" name="addname" value="newAdd"  onclick="newInfo()" ${not empty sessionScope.member? "":"checked='checked'"}><label> 새로운배송지</label>
			  	<input type="button" value="주소록보기" ${empty sessionScope.member? "disabled='disabled'":""}>
			  </td>
			</tr>
			<c:if test="${empty sessionScope.member}">
			 <tr>
			  <th>이메일
			  <span style="align-content: center; color: red;">*</span>
			  </th>
			  <td>
			  	<input type="text" name="takerEmail" maxlength="4" style="height: 20px;">
			  </td>
			</tr>
			</c:if>
			
			<tr>
			  <th>받으시는분
			  <span style="align-content: center; color: red;">*</span>
			  </th>
			  <td>
			  	<input type="text" name="takerName" maxlength="4" style="height: 20px;" value="${mdto.userName}">
			  </td>
			</tr>
			<tr>
			  <th>주소
			  <span style="align-content: center; color: red;">*</span>
			  </th>
			  <td>
			  	<input type="text" name="add0" style="width: 50px; height: 20px; margin-top: 3px;" value="${mdto.addr0}"> - <input type="button" value="우편번호"><br>
			  	<input type="text" name="add1" style="width: 300px; height: 20px; margin-top: 3px;" value="${mdto.addr1}"><br>
			  	<input type="text" name="add2" style="width: 300px; height: 20px; margin-top: 3px;"  value="${mdto.addr2}"><br>
			
			  </td>
			</tr>
			<tr>
			  <th>휴대전화
			  <span style="align-content: center; color: red;">*</span>
			  </th>
			  <td>
			  	<select name="tel1" style="width: 64px;">
			  	  <option value="010" selected="selected">010</option>
			  	  <option value="011">011</option>
			  	  <option value="016">016</option>
			  	  <option value="017">017</option>
			  	  <option value="018">018</option>
			  	  <option value="019">019</option>
			  	</select>
			  	-
			  	<input type="text" name="tel2" style="width: 70px;" value="${mdto.tel2}">
			  	-
			  	<input type="text" name="tel3" style="width: 70px;" value="${mdto.tel3}">
			  </td>
			</tr>
			<tr>
			  <th>배송메세지</th>
			  <td>
			    <textarea rows="3" cols="50" name="memo"></textarea>
			  </td>
			</tr>
		
		
		</table>



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
			
			<table class="carttable3" style="margin-bottom: 30px;">
				<tr>
				  <td style="background: #eeeeee; font-weight: bold; border-right: 1px solid #cccccc">총 할인 금액</td>
				  <td>0원</td>
				</tr>
				<tr>
				  <td style="background: #eeeeee; font-weight: bold; border-right: 1px solid #cccccc">총 부가결제금액</td>
				  <td>0원</td>
				</tr>
				<tr>
				  <td style="border-right: 1px solid #cccccc">적립금</td>
				  <td>
				    <input type="text" name="useMil" value="0">원 
				    <span style="font-size: 12px;">
				    &nbsp;&nbsp;(총 사용가능 적립금: 3000원 )
				    <br><br>
						- 적립금은 최소 0 이상일 때 결제가 가능합니다.<br>
						- 최대 사용금액은 제한이 없습니다.<br>
						- 적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.
				    </span>
				    
				  </td>
				</tr>		
						
			</table>
			
		<div style="margin-top: 10px; margin-bottom: 10px;">
		&nbsp;&nbsp;&nbsp;결제수단	
		</div>
		
		<div style="border: 1px solid black; margin-bottom: 100px; min-height: 370px;">
		
		 <div style="float: left; height: 98px;">
			<div style="border-bottom-style: double; border-bottom-color: #cccccc;  padding: 17px 20px 20px 20px; width: 860px;height: 15px;">
			  <input type="hidden" name="orderCode" value="${dto.ordercode}">
			  <input type="radio" name="paymethod" value="paycard" checked="checked"> <label>카드결제</label>
		  	  <input type="radio" name="paymethod" value="payaccount"> <label>무통장 입금</label>
			</div>
			<!-- 결제수단에 따라 내용이 달라짐 -->
			<div>
			  
			  <table style="padding: 17px 20px 20px 20px;">
			    <tr>
			      <td>입금자명 : </td>
			      <td>
			        <input type="text" name="deposit"  style="height: 20px;">
			      </td>
			    </tr>
			    <tr>
			      <td>입금은행 : </td>
			      <td>
			      	<select name="bank" style="height: 25px;">
			      	  <option selected="selected" value="">::선택::</option>
			      	  <option value="kb">국민은행:192222-01-0121322 김갑두</option>
			      	  <option value="nh">농협:192222-01-0121322 김갑두</option>
			      	</select>
			      </td>
			    </tr>
			  </table>
			  
			</div>
		 </div>
		 
		 <div style="float: left; border-left: 1px solid; height: 370px; width: 240px;" align="right">
		  <div><span style="font-weight: bold;">카드결제</span> 최종 결제 금액 </div>
		  
		  <div><span style="font-weight: bold;color: pink; font-size: 25px;">
		   <c:if test="${totPrice>=50000}"><fmt:formatNumber value="${totPrice}" pattern="#,###"/>
		     <input type="hidden" name="totPrice" value="${totPrice}">
		   </c:if>
		   <c:if test="${totPrice<50000}"><fmt:formatNumber value="${totPrice+5000}" pattern="#,###"/>
		    <input type="hidden" name="totPrice" value="${totPrice+5000}">
		    </c:if>
		  </span><span style="color: pink;">원</span></div>
		  <div style="margin-top: 10px;">
		     <img src="<%=cp%>/resource/images/paycom.gif" onclick="payCom()" style="cursor: pointer;">
		  </div>
		  <div>
		    <table style="margin-top: 30px;">
		     <tr>
		       <td>총 적립예정금액</td>
		       <td>1607원</td>
		     </tr>
		     <tr>
		       <td>회원 적립금</td>
		       <td>0원</td>
		     </tr>
		     <tr>
		       <td>쿠폰 적립금</td>
		       <td>0원</td>
		     </tr>
		    </table>
		  
		  </div>
		 </div>
	</div>
		
		</form>
		<div style="border: 1px solid #cccccc; background: tomato;" >
		<span style="font-weight: bold;">무이자 할부 이용안내</span><br>
		
		무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.<br>
		무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.<br>
		

		</div>
		
	</div>

</body>


</html>









