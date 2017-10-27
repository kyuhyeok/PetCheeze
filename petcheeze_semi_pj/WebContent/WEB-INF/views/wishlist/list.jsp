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
<title>Insert title here</title>
<style type="text/css">
.wishTable {
	margin: 40px auto;
}

.wishTable {
	border-collapse: collapse;
	border-spacing: 0px;
	border-top: 1px solid #cccccc;
	border-left: 1px solid #cccccc;
	margin: 30px auto 9px;
	width: 1140px;
}

.wishTable th {
	height: 37px;
	border-bottom: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	text-align: center;
}

.wishTable td {
	text-align: center;
	border-bottom: 1px solid #cccccc;
}
</style>
</head>
<body>


	<div style="width: 1150px; margin: 50px auto;">
		<form name="wishlistForm">

			<ul style="margin: 50px auto 20px;">
				<li style="list-style: none; text-align: center;">WISH LIST</li>
			</ul>

			<table class="wishTable">
				<tr>
					<th><input type="checkbox"></th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>적립금</th>
					<th>배송구분</th>
					<th>배송비</th>
					<th width="350px">합계</th>
					<th>선택</th>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td align="center"><input type="image"
						src="<%=cp%>/resource/images/soganp_image.GIF"
						style="height: 80px;"></td>
					<td>황태파우더</td>
					<td>5000원</td>
					<td>116원</td>
					<td>기본배송</td>
					<td>5000원<br>조건
					</td>
					<td>11600원</td>
					<td style="border-right: 1px solid #cccccc">
						<button class="myButton" style="width: 120px;">주문하기</button> <br>
						<button class="myButton" style="width: 120px;">관심상품등록</button> <br>
						<button class="myButton" style="width: 120px;">삭제</button>
					</td>
				</tr>
			</table>

			<table style="width: 1140px;">
				<tr>
					<td style="height: 50px;">&nbsp;선택상품을
						<button type="button" class="odbtn">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							삭제하기
						</button>
						<button type="button" class="wibtn">장바구니담기</button>
					</td>
					<td align="right">
						<button type="button" class="wibtn">전체상품주문</button>
						<button type="button" class="wibtn">관심상품주문</button>
					</td>
				</tr>
			</table>

			<div align="center">
				<a>-page 1-</a>
			</div>
		</form>
	</div>


</body>
</html>