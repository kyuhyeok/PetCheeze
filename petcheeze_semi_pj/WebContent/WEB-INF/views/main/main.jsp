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
<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">	<!-- main+menu용 CSS(규혁) -->

</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	
<div class="contents">
    <div class="main1">
        <div class="main1_1">
    		<a href="#none">
    		    <img src="<%=cp%>/resource/images/main_image.jpg" style="width:770px"/>
    		</a>
    	</div>  
        <div class="main1_2">        
            <div class="main1_2_board">
                <div class="board_sj">
                    <h2>
                    	<a href="<%=cp%>/bbs/list.do">notice</a>
                    </h2>
                </div>
                <c:forEach var="dto" items="${allamlist}">
                <p style="text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;width:350px;overflow:hidden;color:#4a4542; font-size:14px; padding: 3px 5px">
                <a href="<%=cp%>/bbs/article.do?page=1&num=${dto.num}">${dto.subject}</a>
                </p>
                </c:forEach>
            </div>
            <div class="main1_2_board">
                <div class="board_sj">
                    <h2>
                    	<a href="#">event</a>
                    </h2>
                </div>
                <span style="vertical-align: middle; color: #cccccc">준비중입니다.</span>
            </div>
            <div class="main1_2_board">
                <div class="board_sj">
                    <h2>
                    	<a href="#">Review</a>
                    </h2>
                </div>
                <span style="vertical-align: middle; color: #cccccc">준비중입니다.</span>
            </div>
        </div>
    </div>

	<div class="bestbox_title">BEST ITEM</div>
	<div class="bestbox_content">
	    <ul style="margin:0 auto; padding: 0 auto;">
	    	<c:forEach var="dto" items="${best}">
		        <li class="prdList">
		        	<a href="<%=cp%>/menu/menu_detail.do?pdkindcode=${dto.pdKindcode}&pdcode=${dto.pdCode}">
		            <img src="<%=cp%>/resource/images/product_contents/${dto.pdCode}/${dto.pdImage}" class="main_thumb"/>
		            </a>
		        </li>
	        </c:forEach>
		</ul>
		
	</div>
	
	<div class="bestbox_title">NEW ARRIVAL</div>
	<!-- new arrival menu list -->
	<jsp:include page="/WEB-INF/views/menu/menu_list.jsp"/>
	
	<div class="footer">
	    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
</div>    

</body>
</html>