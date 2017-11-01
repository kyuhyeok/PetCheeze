<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<!--작성자 : 규혁 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetCheeze</title>

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">
<style type="text/css">
.contents {
    clear: both;
    margin: 0px auto 15px;
    min-height: 450px;
    width: 1150px;
}
.menu_title {
    color: #4a5164;
    letter-spacing: 8px;
    text-align: center;
    margin: 10px auto 27px;
    padding: 10px;
    min-height: 30px;
    font-size: 12px;
    font-weight: bold;
    background: 2px no-repeat;
}
</style>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	
<div class="contents">
	<div class="menu_title">
	    <h2><span>
		<c:choose>
			<c:when test="${pdkindcode eq '2'}">져키(육포)</c:when>
			<c:when test="${pdkindcode eq '4'}">뼈&껌</c:when>
			<c:when test="${pdkindcode eq '1'}">영양파우더</c:when>
			<c:when test="${pdkindcode eq '3'}">세트메뉴</c:when>
			<c:when test="${pdkindcode eq '5'}">말이&큐브&땡</c:when>
		</c:choose>
	    </span></h2>
	</div>

<jsp:include page="/WEB-INF/views/menu/menu_list.jsp"/>

<%-- 
<div class="contents">
	<div class="menu_content">
	    <div class="function">
	        <p class="prdCount">Total <strong>5</strong> items</p>
	        <ul class="order">
	            <li class="order_li"><a href="#">NEW</a></li>
	            <li class="order_li"><a href="#">NAME</a></li>
	            <li class="order_li"><a href="#">LOW PRICE</a></li>
	            <li class="order_li"><a href="#">HIGH PRICE</a></li>
	        </ul>
	    </div>
	    <ul class="menu_list">
	        <li class="menu_list_li">
	            <div class="box">
	                <a href="/product/detail.html?product_no=31&cate_no=24&display_group=1"><img src="//www.petcheeze.co.kr/web/product/medium/201701/31_shop1_468859.jpg" class="thumb"/></a>
	                <p class="name_box">
	                    <a href="/product/detail.html?product_no=31&cate_no=24&display_group=1"><span class="name">오리안심져키(50g)</span></a>
	                </p>
	
	                <ul>
	                    <li class="detail_box">
	                        <span class="name">자체제작</span></li>
	                    <li class="detail_box">
	                        <span class="price">3,600원</span></li>
	                    <li class="detail_box">
	                        <span class="name">배송비 : 5,000원</span></li>
	                    <li class="detail_box">
	                        <span class="name">배송방법 : 택배</span></li>
	                </ul>
	                <div class="status">
	                    <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_recommended.gif" class="icon" alt="추천" /> <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_new.gif" class="icon" alt="New" />
	                </div>
	            </div>
	        </li>
	    </ul>
	</div>
	<div class="menu_paging">
		${paging}
	</div>
</div>
--%>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</body>
</html>