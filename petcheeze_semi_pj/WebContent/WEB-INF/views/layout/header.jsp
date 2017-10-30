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
        <div style="padding-top: 10px;  float: right ;">
            <c:if test="${empty sessionScope.member}">
                <a href="<%=cp%>/member/login.do">로그인</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/member/member.do">회원가입</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/cart/nomem_cart.do">장바구니</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/order/order_list.do">주문</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/member/mypage.do">마이페이지</a>                
            </c:if>
             <c:if test="${not empty sessionScope.member}">
                <span style="color:blue;">${sessionScope.member.userName}</span>님
                    &nbsp;|&nbsp;
                    <a href="<%=cp%>/member/logout.do">로그아웃</a>
                    &nbsp;|&nbsp;
                    <a href="<%=cp%>/member/update.do">정보수정</a>
                      &nbsp;|&nbsp;
                <a href="<%=cp%>/cart/nomem_list.do">장바구니</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/order/order_list.do">주문</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/member/mypage.do">마이페이지</a> 
            </c:if>
  
        </div>
</div>


<div class="menu">
    <ul class="nav">
        <li>
            <a href="#" style="margin:45px 45px; text-align:center; font-size: 17px;">육포</a>
        </li>
        
        <li>
            <a href="#" style="margin:45px 45px; text-align:center;font-size: 17px;">뼈&amp;껌</a>
        </li>       

        <li>
            <a href="#" style="margin:45px 45px; text-align:center;font-size: 17px;">영양파우더</a>        
        </li>

        <li>
            <a href="#" style="margin:45px 45px; text-align:center;font-size: 17px;">말이&amp;큐브</a>        
        </li>
        
        <li>
            <a href="#" style="margin:45px 45px; text-align:center;font-size: 17px;">세트메뉴</a>   
        </li>

        <li>
        	 <a href="<%=cp%>/bbs/list.do" style="margin:35px 35px; text-align:center;font-size: 17px;">공지사항&amp;이벤트</a>
        </li> 
      </ul>
</div>

    <div class="header-bottom">

            <a href="<%=cp%>/" style="text-decoration: none; display:block; margin: 0px auto;">
            <br>
            <br>
                <img src="<%=cp%>/resource/images/petcheeze.PNG" style="max-width: 400px; max-height: 400px; display:block; margin: 0px auto;">
            </a>
    </div><br><br> 