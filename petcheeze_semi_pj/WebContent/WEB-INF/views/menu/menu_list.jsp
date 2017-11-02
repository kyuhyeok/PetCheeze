<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
	String pagenum="1";
	if(request.getParameter("page")!=null)
		pagenum=request.getParameter("page");
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">	<!-- menu용 CSS(규혁) -->
<!--작성자 : 규혁 -->
<div class="menu_content">
	<c:if test="${type=='menu'}">
	    <div class="function" style="margin: 17px 0 20px ;">
	        <p class="prdCount">Total <strong>${dataCount}</strong> items</p>
	        <ul class="order">
	            <li class="order_li"><a href="<%=cp%>/menu/menu.do?pdkindcode=${pdkindcode}&sort=new">NEW</a></li>
	            <li class="order_li"><a href="<%=cp%>/menu/menu.do?pdkindcode=${pdkindcode}&sort=name">NAME</a></li>
	            <li class="order_li"><a href="<%=cp%>/menu/menu.do?pdkindcode=${pdkindcode}&sort=lowprice">LOW PRICE</a></li>
	            <li class="order_li"><a href="<%=cp%>/menu/menu.do?pdkindcode=${pdkindcode}&sort=highprice">HIGH PRICE</a></li>
	        </ul>
	    </div>
    </c:if>
    <ul class="menu_list">
	<c:forEach var="dto" items="${list}">
        <li class="menu_list_li">
            <div class="box">
                <a href="${menu_detail_url}?page=${page}&pdkindcode=${pdkindcode}&pdcode=${dto.pdCode}">
                	<img src="<%=cp%>/resource/images/product_contents/${dto.pdCode}/${dto.pdImage}" class="thumb"/>
               	</a>
                <p class="name_box">
                    <a href="${menu_detail_url}?page=${page}&pdkindcode=${pdkindcode}&pdcode=${dto.pdCode}">
                    	<span class="name">${dto.pdName}</span>
                    </a>
                </p>
                <ul>
                    <li class="detail_box">
                        <span class="name">${dto.pdMaker}</span></li>
                    <li class="detail_box">
                        <span class="price"><fmf:formatNumber value="${dto.pdPrice}" pattern="###,##0"/>원</span></li>
                    <li class="detail_box">
                        <span class="name">배송비 : 5,000원</span></li>
                    <li class="detail_box">
                        <span class="name">배송방법 : 택배</span></li>
                </ul>
                <div class="status">
                    <!--img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_recommended.gif" class="icon" alt="추천" /-->
	                <c:if test="${dto.pdNew=='1'}">
                    	<img src="<%=cp%>/resource/images/product_detail_ui/ico_product_new.gif" class="icon" alt="New" />
	                </c:if>
                </div>
            </div>
        </li>
   	</c:forEach>
    </ul>
</div>
<c:if test="${type=='menu'}">
	<div class="menu_paging">
		${paging}
	</div>
</c:if>