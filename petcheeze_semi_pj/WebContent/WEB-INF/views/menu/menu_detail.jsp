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
<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">	<!-- menu용 CSS(규혁) -->

<link href="<%=cp%>/resource/css/menu_detail/optimizer.css" rel="stylesheet" type="text/css">

<title>${dto.pdName} - 펫치즈</title>
<script type="text/javascript">
var quantity;
var totalquantity;

var pdMil;
var mileageprice;

var pdPrice;
var quantityprice;
var totalprice;

function init () {
	pdMid="${dto.pdMil}";
	pdPrice="${dto.pdPrice}";
	quantity=document.getElementById("quantity");
	document.getElementById("quantity").innerHTML=quantity.value;
	document.getElementById("mileage_price").innerHTML="${dto.pdMil}";
	document.getElementById("quantity_price").innerHTM="${dto.pdPrice}";
	document.getElementById("total_price").innerHTML="${dto.pdPrice}";
	change();
}

function add () {
	quantity = document.getElementById("quantity");
	
	quantity.value++ ;
	
	document.getElementById("total_quantity").innerHTML = quantity.value;
	document.getElementById("mileage_price").innerHTML = parseInt(quantity.value) * "${dto.pdMil}";
	document.getElementById("quantity_price").innerHTML = parseInt(quantity.value) * parseInt(pdPrice);
	document.getElementById("total_price").innerHTML = parseInt(quantity.value) * parseInt(pdPrice);
}

function del () {
	quantity = document.getElementById("quantity");
	
		if (quantity.value > 1) {
			quantity.value-- ;
			
			document.getElementById("total_quantity").innerHTML = quantity.value;
			document.getElementById("mileage_price").innerHTML = parseInt(quantity.value) * "${dto.pdMil}";
			document.getElementById("quantity_price").innerHTML = parseInt(quantity.value) * parseInt(pdPrice);
			document.getElementById("total_price").innerHTML = parseInt(quantity.value) * parseInt(pdPrice);
		}
}

function change () {
	quantity = document.getElementById("quantity");
		if (quantity.value < 1) {
			quantity.value = 1;
		}
}  

function product_submit(num) {
	var cnt = document.getElementById("quantity").value;
	if(num="1"){
		var f="${sessionScope.member.userId}";
		if(!f){
			location.href ="<%=cp%>/cart/insertno.do?pdcode=${dto.pdCode}&pdkindcode=${dto.pdKindcode}&cnt="+cnt;
		}else{
			location.href ="<%=cp%>/cart/insertCart_ok.do?pdcode=${dto.pdCode}&pdkindcode=${dto.pdKindcode}&cnt="+cnt;
		}
		
	}
	else if(num="2"){
		location.href = "<%=cp%>/cart/list.do?pdcode=${dto.pdCode}&cnt="+cnt;
	}
}

function alertm() {
	alert("준비중입니다.");
}

</script>
</head>
<body onload="init();">

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

<div<%--id="wrap"--%>>
    <div<%--id="container"--%>>
        <div class="contents">
            <!-- 상단 제품 정보  -->
            <div class="xans-element- xans-product xans-product-detail ">
                <div class="detailArea">
                    <!-- 이미지 영역 -->
                    <div class="xans-element- xans-product xans-product-image imgArea">
                        <div class="keyImg">
                            <img class="BigImage " alt="" src="<%=cp%>/resource/images/product_contents/${dto.pdCode}/${dto.pdImage}">
                        </div>
                    </div>
                    <!-- //이미지 영역 -->
                    <!-- 상세정보 내역 -->
                    <div class="infoArea">
                        <div class="icon">
                            <!--img class="icon_img" alt="추천" src="<%=cp%>/resource/images/product_detail_ui/ico_product_recommended.gif"-->
                            <c:if test="${dto.pdNew=='1'}">
                            	<img class="icon_img" alt="New" src="<%=cp%>/resource/images/product_detail_ui/ico_product_new.gif">
                            </c:if>
                        </div>
                        <h3>${dto.pdName}</h3>
                        <div class="xans-element- xans-product xans-product-detaildesign">
                            <table border="1" summary="">
                                <caption>기본 정보</caption>
                                <tbody>
                                    <tr class=" xans-record-">
                                        <th scope="row">
                                            <span style="color: rgb(85, 85, 85); font-size: 16px;">상품명</span>
                                        </th>
                                        <td>
                                            <span style="color: rgb(85, 85, 85); font-size: 16px;">${dto.pdName}</span>
                                        </td>
                                    </tr>
                                    <tr class=" xans-record-">
                                        <th scope="row">
                                            <span style="color: rgb(85, 85, 85); font-size: 12px;">제조사</span>
                                        </th>
                                        <td>
                                            <span style="color: rgb(85, 85, 85); font-size: 12px;">${dto.pdMaker}</span>
                                        </td>
                                    </tr>
                                    <tr class=" xans-record-">
                                        <th scope="row">
                                            <span style="color: rgb(0, 139, 204); font-size: 12px; font-weight: bold;">판매가</span>
                                        </th>
                                        <td>
                                            <span style="color: rgb(0, 139, 204); font-size: 12px; font-weight: bold;">
                                            <strong id="span_product_price_text">${dto.pdPrice}원</strong>
                                            <input name="product_price" id="product_price" value="${dto.pdPrice}" type="hidden"></span>
                                        </td>
                                    </tr>
                                    <tr class=" xans-record-">
                                        <th scope="row">
                                            <span style="color: rgb(85, 85, 85); font-size: 12px;">적립금</span>
                                        </th>
                                        <td>
                                            <span style="color: rgb(85, 85, 85); font-size: 12px;">
                                            	<span id="span_mileage_text">${dto.pdMil}원 (1%)</span>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr class=" xans-record-">
                                        <th scope="row">
                                            <span style="color: rgb(85, 85, 85); font-size: 12px;">배송방법</span>
                                        </th>
                                        <td>
                                            <span style="color: rgb(85, 85, 85); font-size: 12px;">택배</span>
                                        </td>
                                    </tr>
                                    <tr class=" xans-record-">
                                        <th scope="row">
                                            <span style="color: rgb(85, 85, 85); font-size: 12px;">배송비</span>
                                        </th>
                                        <td>
                                            <span style="color: rgb(85, 85, 85); font-size: 12px;">
                                            <span class="delv_price_B">
                                            <!--input name="delivery_cost_prepaid" id="delivery_cost_prepaid" type="hidden" value="P"-->
                                            <strong>5,000원</strong>(50,000원 이상 구매 시 무료)
                                            </span>
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="totalProducts">
                            <p class="info ">
                                <img alt="" src="<%=cp%>/resource/images/product_detail_ui/ico_information.gif"> 수량을 선택해주세요.</p>
                            <table border="1" summary="">
                                <caption>상품 목록</caption>
                                <colgroup>
                                    <col style="width: 284px;">
                                    <col style="width: 80px;">
                                    <col style="width: 110px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" >상품명</th>
                                        <th scope="col">상품수</th>
                                        <th scope="col">가격</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><!-- 수량변경 -->
                                        <td>오리안심져키(50g)</td>
                                        <td>
                                            <span class="quantity">
	                                            <input name="quantity_opt[]" id="quantity" type="text" value="1" onchange="change();"> 
			                                    <a href="#none">
			                                    	<img class="QuantitiUp up" onclick="add();" alt="수량증가" src="<%=cp%>/resource/images/product_detail_ui/btn_count_up.gif">
			                                    </a> 
			                                    <a href="#none">
			                                    	<img class="QuantitiDown down" onclick="del();" alt="수량감소" src="<%=cp%>/resource/images/product_detail_ui/btn_count_down.gif">
			                                    </a> 
             								</span> 
             						</td>
                                        <td class="right">
                                            <span id="quantity_price">${dto.pdPrice}</span>원
                                            <span class="mileage">(
                                            <img src="<%=cp%>/resource/images/product_detail_ui/ico_product_point.gif"> &nbsp;
                                            <span id="mileage_price"></span>원)</span>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="3">
                                            <strong>Total Price</strong> :
                                            <span>
                                            <strong id="total_price"></strong><strong>원</strong> 
                                            (<span id="total_quantity">1</span>개)</span>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- 구매, 장바구니, 위시리스트 -->

                        <div class="xans-element- xans-product xans-product-action ">
                            <div class="btnArea">
                                <A class="first " onclick="product_submit('1')" href="#none">
                                    <img alt="BUY NOW" src="<%=cp%>/resource/images/product_detail_ui/buynow_bt.png">
                                </A>
                                <A onclick="product_submit('2')" href="#none">
                                    <img alt="ADD CART" src="<%=cp%>/resource/images/product_detail_ui/addcart_bt.png">
                                </A>
                                <A href="#none">
                                    <img alt="WISH LIST" src="<%=cp%>/resource/images/product_detail_ui/wishlist_bt.png" onclick="alertm();">
                                </A>
                            </div>
                        </div>
                        <!-- //구매, 장바구니, 위시리스트 -->
                    </div>
                </div>
            </div>
            <!-- //상단 제품 정보 -->
            <div class="xans-element- xans-product xans-product-additional ">
                <!-- 상품상세정보 -->
                <div id="prdDetail">
                    <div class="cont">
                        <br>
                        <img style="width: 598px; height: 960px;" src="<%=cp%>/resource/images/product_contents/copy(1475992713)-KakaoTalk_20161008_153217967.jpg" vspace="0" hspace="5">
                        <br>
                            <span style="font-family: Comic Sans MS;">
	                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
		                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; font-style: italic; font-weight: bold; mso-fareast-font-family: Sandoll 미생;">
		                            <span style="font-size: 16pt;">마음을 담다</span>
		                            </span>
	                       	 	</p>
		                        <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
		                            <!--[if !supportEmptyParas]-->&nbsp;
		                            <!--[endif]-->
		                        </p>
	                        	<p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
	                            <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; font-style: italic; font-weight: bold; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;">
	                            	<span style="font-size: 16pt;">Hand Made Food</span>
	                            </span>
	                            <span style="background: rgb(255, 255, 255); color: rgb(255, 170, 0); font-family: Sandoll 미생; font-size: 22pt; font-style: italic; font-weight: bold; mso-fareast-font-family: Sandoll 미생;">
		                            <span style="font-size: 18pt;">
		                            <span style="font-size: 20pt;">펫치즈</span></span>
	                            </span>
	                        	</p>
                        	</span>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
	                    <br>
	                    <br>
	                    <br>
	                    <br>
                        <img style="width: 500px; height: 500px;" src="<%=cp%>/resource/images/product_contents/${dto.pdCode}/01.jpg" vspace="0" hspace="5">
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <span style="font-size: 16pt;"><!--StartFragment--></span>
                        <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
                            <span style="font-size: 16pt;">오리안심은 저지방</span></span>
                            <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;">
                            <span style="font-size: 16pt;">,</span></span>
                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
                            <span style="font-size: 16pt;">고단백 식품으로 필수아미노산과 불포화지방산이</span></span>
                        </p>
                        <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                            <span style="font-size: 16pt;"></span>
                            <span style="font-size: 16pt;"><!--[if !supportEmptyParas]--></span>
                            <span style="font-size: 16pt;">&nbsp;</span>
                            <span style="font-size: 16pt;"><!--[endif]--></span>
                            <span style="font-size: 16pt;">  </span>
                        </p>
                        <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
                            <span style="font-size: 16pt;">풍부하여 체내에 쌓인 지방을 배출하여 혈액순환에 도움을 주고</span></span>
                        </p>
                        <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                            <span style="font-size: 16pt;"></span>
                            <span style="font-size: 16pt;"><!--[if !supportEmptyParas]--></span>
                            <span style="font-size: 16pt;">&nbsp;</span>
                            <span style="font-size: 16pt;"><!--[endif]--></span>
                            <span style="font-size: 16pt;">  </span>
                        </p>
                        <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
                            <span style="font-size: 16pt;">강아지</span></span>
                            <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;">
                            <span style="font-size: 16pt;">,</span></span>
                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
                            <span style="font-size: 16pt;">고양이에게 면역력을 증가시켜주고</span></span>
                            <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;">
                            <span style="font-size: 16pt;">, </span></span>
                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
                            <span style="font-size: 16pt;">원기회복에도 좋습니다</span></span>
                            <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;">
                            <span style="font-size: 16pt;">.</span></span>
                        </p>
                            <br>
                            <img style="width: 500px; height: 500px;" src="<%=cp%>/resource/images/product_contents/${dto.pdCode}/02.jpg" vspace="0" hspace="5">
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                        <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"><!--StartFragment--></span>
						<p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
						<span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
						<span style="font-size: 16pt;">알러지가 적은 식품이기 떄문에 체질 개선에 도움을 주며</span></span>
                        </p>
                        <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                            <span style="font-size: 16pt;"></span>
                            <span style="font-size: 16pt;"><!--[if !supportEmptyParas]--></span>
                            <span style="font-size: 16pt;">&nbsp;</span>
                            <span style="font-size: 16pt;"><!--[endif]--></span>
                            <span style="font-size: 16pt;">  </span>
                        </p>
                        <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
                            <span style="font-size: 16pt;">고양이</span></span>
                            <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;">
                            <span style="font-size: 16pt;">,</span></span>
                            <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
                            <span style="font-size: 16pt;">강아지들에게 기호성이 좋습니다</span></span>
                            <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;">
                            <span style="font-size: 16pt;">.</span></span>
                        </p>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
                            <img style="width: 500px; height: 500px;" src="<%=cp%>/resource/images/product_contents/${dto.pdCode}/03.jpg" vspace="0" hspace="5">
                                <br>
                        <p>
                            <font face="궁서" size="5">&nbsp;&nbsp;&nbsp;&nbsp;
                                <span style="font-family: Sandoll 미생; mso-fareast-font-family: Sandoll 미생;">
                                <span style="font-size: 16pt;">
                                <span style="font-size: 18pt;">
                                <span style="background-color: rgb(255, 239, 0);">펫치즈</span>의</span>
                                </span>
                                </span>
                                <span style="font-size: 16pt;">
                                <span style="font-size: 18pt;">&nbsp;</span></span>
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
	                                <span style="font-size: 16pt;">
	                                <span style="font-size: 18pt;">모든 간식은 </span></span>
                                </span>
                                <span style="background: rgb(255, 255, 255); color: rgb(255, 0, 0); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
	                                <span style="font-size: 16pt;">
	                                <span style="font-size: 18pt;">무</span></span>
                                </span>
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
	                                <span style="font-size: 16pt;">
	                                <span style="font-size: 18pt;">색소 </span></span>
                                </span>
                                <span style="background: rgb(255, 255, 255); color: rgb(255, 0, 0); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
	                                <span style="font-size: 16pt;">
	                                <span style="font-size: 18pt;">무</span></span>
                                </span>
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
	                                <span style="font-size: 16pt;">
	                                <span style="font-size: 18pt;">방부제 </span></span>
                                </span>
                                <span style="background: rgb(255, 255, 255); color: rgb(255, 0, 0); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
	                                <span style="font-size: 16pt;">
	                                <span style="font-size: 18pt;">무</span></span>
                                </span>
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;">
	                                <span style="font-size: 16pt;">
	                                <span style="font-size: 18pt;">첨가물 입니다</span></span>
                                </span>
                                <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;">
	                                <span style="font-size: 16pt;">
	                                <span style="font-size: 18pt;">.</span></span>
                                </span>
                            </font>
                        </p>
                        <br>
                            <font face="궁서" size="5">원재료/원산지 :오리안심(국내산)</font>
                        <br>
                        <br>
                    </div>
                </div>
                <!-- //상품상세정보 -->
                <!-- 상품사용후기 -->
                <div id="prdReview">
                    <div class="board">
                        <h3>REVIEW</h3>
                        <p class="desc">상품의 사용후기를 적어주세요.</p>
                        <p class="nodata">게시물이 없습니다</p>
                        <p class="btnArea">
                        <a href="#">
                        <span class="sherbetbt_b white">WRITE</span></a>
                        <a href="#">
                        <span class="sherbetbt_b white">LIST</span></a> </p>
                    </div>
                </div>
                <!-- //상품사용후기 -->
                <!-- 상품 Q&A -->
                <div id="prdQnA">
                    <div class="board">
                        <h3>Q&amp;A</h3>
                        <p class="desc">상품에 대해 궁금한 점을 해결해 드립니다.</p>
                        <p class="nodata">게시물이 없습니다</p>
                        <p class="btnArea">
                            <a href="#">
                            <span class="sherbetbt_b white">WRITE</span></a>
                            <a href="#">
                            <span class="sherbetbt_b white">LIST</span></a> </p>
                    </div>
                </div>
                <!-- //상품Q&A -->
            </div>
        </div>
    </div>
</div>

<!-- //참고 -->
<div id="multi_option" style="display: none;"></div>
<form id="frm_image_zoom" style="display: none;"></form>
<!--script src="오리안심져키(50g)%20-%20펫치즈_files/optimizer.js" type="text/javascript"/-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</body>

</html>
