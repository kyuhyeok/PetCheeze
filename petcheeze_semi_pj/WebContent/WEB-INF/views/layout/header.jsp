<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
//엔터 처리
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form,body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
	        }
	     });
});
</script>


   <div class="header-top">
        <div style="padding-top: 8px;  float: left ;">
            <c:if test="${empty sessionScope.member}">
                <a href="<%=cp%>/member/login.do">로그인</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/member/member.do">회원가입</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/member/#">장바구니</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/member/#">주문</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/member/#">마이페이지</a>                
            </c:if>
            <c:if test="${not empty sessionScope.member}">
                <span style="color:blue;">${sessionScope.member.userName}</span>님
                    &nbsp;|&nbsp;
                    <a href="<%=cp%>/member/logout.do">로그아웃</a>
                    &nbsp;|&nbsp;
                    <a href="<%=cp%>/#">정보수정</a>
            </c:if>
 
        </div>


</div>

    <div class="header-bottom">

            <a href="<%=cp%>/" style="text-decoration: none;display:block; margin-left:260px; margin-right:260px;">
                <img src="resource\images\펫치즈.PNG" style="max-width: 300px; max-height: 300px; display:block; margin-bottom:10px; margin-left:auto; margin-right:auto;">
            </a>
    </div> 


<div class="menu">
    <ul class="nav">
        <li>
            <a href="#" style="margin:auto;">육포</a>
        </li>
        
        <li>
            <a href="#" style="margin:auto;">뼈&껌</a>
        </li>       

        <li>
            <a href="#" style="margin:auto;">영양파우더</a>        
        </li>

        <li>
            <a href="#" style="margin:auto;">말이&큐브</a>        
        </li>
        
        <li>
            <a href="#" style="margin:auto;">세트메뉴</a>   
        </li>

        <li>
        	 <a href="#" style="margin:auto;">공지사항</a>
        </li> 
      
</div>
<div class="body-space"></div>