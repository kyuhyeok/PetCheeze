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

<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">	<!-- menu용 CSS(규혁) -->
<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	
<div class="contents">
	<div class="menu_title">
	    <h2><span>져키(육포)</span></h2>
	</div>
	<div class="menu_content">
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
	    <span class="menu_paging_btn"><a href="#none"><img src="/web/upload/oneday/btn_page_first.gif" alt="첫 페이지"/></a> </span>
	    <span class="menu_paging_btn"><a href="#none"><img src="/web/upload/oneday/btn_page_prev.gif" alt="이전 페이지"/></a></span>
	    <span class="menu_paging_num"><a href="#">1</a></span>
	    <span class="menu_paging_btn"><a href="#none"><img src="/web/upload/oneday/btn_page_next.gif" alt="다음 페이지"/></a> </span>
	    <span class="menu_paging_btn"><a href="#none"><img src="/web/upload/oneday/btn_page_last.gif" alt="마지막 페이지"/></a> </span>
	</div>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</body>
</html>