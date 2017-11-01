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

<script src="<%=cp%>/resource/js/menu_detail/common.js" type="text/javascript"></script>
<script src="<%=cp%>/resource/js/menu_detail/cid.generate.js" type="text/javascript"></script>
<link href="<%=cp%>/resource/css/menu_detail/optimizer.css" rel="stylesheet" type="text/css">
<title>${dto.pdName} - 펫치즈</title>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>

    <div<%--id="wrap"--%>>
        <div<%--id="container"--%>>
            <div id="contents">
                <!-- 상단 제품 정보  -->
                <div class="xans-element- xans-product xans-product-detail ">
                    <div class="detailArea">
                        <!-- 이미지 영역 -->
                        <div class="xans-element- xans-product xans-product-image imgArea">
                            <div class="keyImg">
                                <img class="BigImage " alt="" src="<%=cp%>/resource/images/product_contents/1/31_shop1_468859.jpg">
                            </div>
                        </div>
                        <!-- //이미지 영역 -->
                        <!-- 상세정보 내역 -->
                        <div class="infoArea">
                            <div class="icon">
                                <img class="icon_img" alt="추천" src="<%=cp%>/resource/images/product_detail_ui/ico_product_recommended.gif">
                                <img class="icon_img" alt="New" src="<%=cp%>/resource/images/product_detail_ui/ico_product_new.gif">
                            </div>
                            <h3>오리안심져키(50g)</h3>
                            <div class="xans-element- xans-product xans-product-detaildesign">
                                <table border="1" summary="">
                                    <caption>기본 정보</caption>
                                    <tbody>
                                        <tr class=" xans-record-">
                                            <th scope="row">
                                                <span style="color: rgb(85, 85, 85); font-size: 16px;">상품명</span>
                                            </th>
                                            <td>
                                                <span style="color: rgb(85, 85, 85); font-size: 16px;">오리안심져키(50g)</span>
                                            </td>
                                        </tr>
                                        <tr class=" xans-record-">
                                            <th scope="row">
                                                <span style="color: rgb(85, 85, 85); font-size: 12px;">제조사</span>
                                            </th>
                                            <td>
                                                <span style="color: rgb(85, 85, 85); font-size: 12px;">자체제작</span>
                                            </td>
                                        </tr>
                                        <tr class=" xans-record-">
                                            <th scope="row">
                                                <span style="color: rgb(0, 139, 204); font-size: 12px; font-weight: bold;">판매가</span>
                                            </th>
                                            <td>
                                                <span style="color: rgb(0, 139, 204); font-size: 12px; font-weight: bold;"><strong 
      id="span_product_price_text">3,600원 
</strong><INPUT name="product_price" id="product_price" type="hidden"></span>
                                            </td>
                                        </tr>
                                        <tr class=" xans-record-">
                                            <th scope="row">
                                                <span style="color: rgb(85, 85, 85); font-size: 12px;">적립금</span>
                                            </th>
                                            <td>
                                                <span style="color: rgb(85, 85, 85); font-size: 12px;"><span id="span_mileage_text">36원 
      (1%)
      <p></p></span></span>
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
                                                <span style="color: rgb(85, 85, 85); font-size: 12px;"><span class="delv_price_B"><INPUT name="delivery_cost_prepaid" id="delivery_cost_prepaid" type="hidden" value="P"><strong>5,000원</strong> 
      (50,000원 이상 구매 시 무료)</span></span>
                                            </td>
                                        </tr>
                                        <tr class=" xans-record-">
                                            <th scope="row">
                                                <span style="color: rgb(85, 85, 85); font-size: 12px;">수량</span>
                                            </th>
                                            <td>
                                                <span style="color: rgb(85, 85, 85); font-size: 12px;"><span id="NewProductQuantityDummy"><span 
      class="quantity"><INPUT name="quantity_name" id="quantity" style="border: 1px solid rgb(188, 188, 188); border-image: none; width: 30px; height: 18px;" type="text"><img 
      class="QuantityUp" alt="수량증가" src="<%=cp%>/resource/images/product_detail_ui/btn_basketUp.gif"><img 
      class="QuantityDown" alt="수량감소" src="<%=cp%>/resource/images/product_detail_ui/btn_basketDown.gif"></span></span>
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
                                            <th scope="col">상품명</th>
                                            <th scope="col">상품수</th>
                                            <th scope="col">가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>오리안심져키(50g)</td>
                                            <td>
                                                <span class="quantity"><INPUT name="quantity_opt[]" id="quantity" type="text" value="1"> 
                                         <A href="http://petcheeze.co.kr/product/detail.html?product_no=31&amp;cate_no=24&amp;display_group=1#none"><img 
      class="QuantityUp up" alt="수량증가" src="<%=cp%>/resource/images/product_detail_ui/btn_count_up.gif"></A> 
                                          <A href="http://petcheeze.co.kr/product/detail.html?product_no=31&amp;cate_no=24&amp;display_group=1#none"><img 
      class="QuantityDown down" alt="수량감소" src="<%=cp%>/resource/images/product_detail_ui/btn_count_down.gif"></A> 
                                      </span> </td>
                                            <td class="right">
                                                <span class="quantity_price">3600</span>
                                                <span class="mileage ">(<img 
      src="<%=cp%>/resource/images/product_detail_ui/ico_product_point.gif"> &nbsp;<span 
      class="mileage_price">36</span>)</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="3">
                                                <strong>Total Price</strong> :
                                                <span class="total"><strong><em>0</em></strong> (0EA)</span>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- //참고 -->
                            <!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->

                            <div class="xans-element- xans-product xans-product-action ">
                                <div class="btnArea">
                                    <A class="first " onclick="product_submit(1, '/exec/front/order/basket/', this)" href="http://petcheeze.co.kr/product/detail.html?product_no=31&amp;cate_no=24&amp;display_group=1#none">
                                        <img onmouseover="this.src='/web/upload/oneday/buynow_bt_r.png'" onmouseout="this.src='/web/upload/oneday/buynow_bt.png'" alt="BUY NOW" src="<%=cp%>/resource/images/product_detail_ui/buynow_bt.png">
                                    </A>
                                    <A onclick="product_submit(2, '/exec/front/order/basket/', this)" href="http://petcheeze.co.kr/product/detail.html?product_no=31&amp;cate_no=24&amp;display_group=1#none">
                                        <img alt="ADD CART" src="<%=cp%>/resource/images/product_detail_ui/addcart_bt.png">
                                    </A>
                                    <A onclick="add_wishlist_nologin('/member/login.html');" href="http://petcheeze.co.kr/product/detail.html?product_no=31&amp;cate_no=24&amp;display_group=1#none">
                                        <img alt="WISH LIST" src="<%=cp%>/resource/images/product_detail_ui/wishlist_bt.png">
                                    </A>
                                </div>
                            </div>
                            <!-- //참고 -->
                        </div>
                    </div>
                </div>
                <!-- //상단 제품 정보 -->
                <div class="xans-element- xans-product xans-product-additional ">
                    <!-- 상품상세정보 -->
                    <div id="prdDetail">
                        <!-- <ul class="link">
            <li class="selected"><a href="#prdDetail">상품상세정보</a></li>
            <li><a href="#prdPayment">상품결제정보</a></li>
            <li><a href="#prdDelivery">배송정보</a></li>
            <li><a href="#prdChange">교환 및 반품정보</a></li>
            <li><a href="#prdService">서비스문의</a></li>
            <li><a href="#prdReview">상품사용후기</a></li>
            <li><a href="#prdQnA">상품Q&amp;A</a></li>
            <li><a href="#prdRelated">관련상품</a></li>
        </ul>-->
                        <div class="cont">
                            <H3></H3>
                            <p>
                                <br>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"><strong><em><span style="font-family: 궁서,Gungsuh;"><span 
style="color: rgb(0, 0, 0);"><span style="font-family: 궁서,Gungsuh;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: Comic Sans MS;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: helvetica;"><span style="font-family: Meiryo;"><span style="font-family: Comic Sans MS;"><br></span></span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </em>
                                </strong>
                                </span>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"><strong><em><span style="font-family: 궁서,Gungsuh;"><span 
style="color: rgb(0, 0, 0);"><span style="font-family: 궁서,Gungsuh;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: Comic Sans MS;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: helvetica;"><span style="font-family: Meiryo;"><span style="font-family: Comic Sans MS;"><br></span></span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </em>
                                </strong>
                                </span>
                            </p>
                            <p>
                                <img style="width: 598px; height: 960px;" src="<%=cp%>/resource/images/product_contents/1/copy(1475992713)-KakaoTalk_20161008_153217967.jpg" vspace="0" hspace="5">
                                <strong><em><font 
face="Comic Sans MS"><br></font></em></strong>
                            </p>
                            <span style="font-size: 14pt;"><strong><em><span 
style="font-family: 궁서,Gungsuh;"><span style="color: rgb(0, 0, 0);"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: 궁서,Gungsuh;"><span style="font-family: Comic Sans MS;"><span 
style="font-family: 궁서,Gungsuh;"><span style="font-family: helvetica;"><span 
style="font-family: Meiryo;"><span style="font-family: Comic Sans MS;">
<p align="left"><br></p>
<p></p></span>
                            <p></p>
                            </span>
                            <p></p>
                            </span>
                            <p></p>
                            </span>
                            <p></p>
                            </span>
                            <p></p>
                            </span>
                            <p></p>
                            </span>
                            <p></p>
                            </span>
                            <p></p>
                            </span>
                            <p></p>
                            </em>
                            <p></p>
                            </strong>
                            <p></p>
                            </span>
                            <span style="font-size: 14pt;"><span style="font-family: 궁서,Gungsuh;"><span 
style="color: rgb(0, 0, 0);"><span style="font-family: 궁서,Gungsuh;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: Comic Sans MS;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: helvetica;"><span style="font-family: Meiryo;"><span style="font-family: Comic Sans MS;">
<p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;"><span 
style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; font-style: italic; font-weight: bold; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">마음을 담다</span></span>
                            </p>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <!--[if !supportEmptyParas]-->&nbsp;
                                <!--[endif]-->
                                <o:p></o:p>
                            </p>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; font-style: italic; font-weight: bold; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;"><span 
style="font-size: 16pt;">Hand Made Food</span></span>
                                <span style="background: rgb(255, 255, 255); color: rgb(255, 170, 0); font-family: Sandoll 미생; font-size: 22pt; font-style: italic; font-weight: bold; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 18pt;"><span 
style="font-size: 20pt;">펫치즈</span></span>
                                </span>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"><strong><em><span style="font-family: 궁서,Gungsuh;"><span 
style="color: rgb(0, 0, 0);"><span style="font-family: 궁서,Gungsuh;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: Comic Sans MS;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: helvetica;"><span style="font-family: Meiryo;"><span style="font-family: Comic Sans MS;"><span 
style="font-family: Comic Sans MS;"><span style="color: rgb(255, 170, 0);"><span 
style="font-size: 20pt;"><span 
style="font-size: 22pt;"><br></span></span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </em>
                                </strong>
                                </span>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"><strong><em><span style="font-family: 궁서,Gungsuh;"><span 
style="color: rgb(0, 0, 0);"><span style="font-family: 궁서,Gungsuh;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: Comic Sans MS;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: helvetica;"><span style="font-family: Meiryo;"><span style="font-family: Comic Sans MS;"><span 
style="font-family: Comic Sans MS;"><span style="color: rgb(255, 170, 0);"><span 
style="font-size: 20pt;"><span 
style="font-size: 22pt;"></span></span>
                                </span>
                                <span style="background-color: rgb(255, 239, 0);">﻿</span>﻿</span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                <span style="font-family: 궁서,Gungsuh;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: Comic Sans MS;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: helvetica;"><span style="font-family: Meiryo;"><span style="font-family: Comic Sans MS;"><span 
style="font-family: Comic Sans MS;">﻿</span></span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                <span style="font-family: 궁서,Gungsuh;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: Comic Sans MS;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: helvetica;"><span style="font-family: Meiryo;"><span style="font-family: Comic Sans MS;"><span 
style="font-family: Comic Sans MS;">﻿</span></span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </span>
                                </em>
                                </strong>
                                </span>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"><span 
style="font-family: 궁서,Gungsuh;">﻿</span>﻿</span>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"></span>&nbsp;</p>
                            <p>
                                <span style="font-size: 14pt;">&nbsp;</span>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p></p>
                            <p></p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p></p>
                            <p></p>
                            <p></p>
                            <p>
                                <br>
                            </p>
                            <img style="width: 500px; height: 500px;" src="<%=cp%>/resource/images/product_contents/1/1484734345-1.jpg" vspace="0" hspace="5">
                            <p></p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <span style="font-size: 14pt;"><span 
style="font-family: 궁서,Gungsuh;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-size: 16pt;"><!--StartFragment--></span>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">오리안심은 저지방</span></span>
                                <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;"><span 
style="font-size: 16pt;">,</span></span>
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">고단백 식품으로 필수아미노산과 불포화지방산이</span></span>
                            </p>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <span style="font-size: 16pt;"></span>
                                <span style="font-size: 16pt;"><!--[if !supportEmptyParas]--></span>
                                <span style="font-size: 16pt;">&nbsp;</span>
                                <span style="font-size: 16pt;"><!--[endif]--></span>
                                <span style="font-size: 16pt;">  </span>
                                <o:p></o:p>
                            </p>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">풍부하여 체내에 쌓인 지방을 배출하여 혈액순환에 도움을 주고</span></span>
                            </p>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <span style="font-size: 16pt;"></span>
                                <span style="font-size: 16pt;"><!--[if !supportEmptyParas]--></span>
                                <span style="font-size: 16pt;">&nbsp;</span>
                                <span style="font-size: 16pt;"><!--[endif]--></span>
                                <span style="font-size: 16pt;">  </span>
                                <o:p></o:p>
                            </p>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">강아지</span></span>
                                <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;"><span 
style="font-size: 16pt;">,</span></span>
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">고양이에게 면역력을 증가시켜주고</span></span>
                                <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;"><span 
style="font-size: 16pt;">, </span></span>
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">원기회복에도 좋습니다</span></span>
                                <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;"><span 
style="font-size: 16pt;">.</span></span>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: 궁서,Gungsuh;"></span></span>
                                </span>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"><span style="font-family: 궁서,Gungsuh;"><span 
style="font-family: 궁서,Gungsuh;">﻿</span></span>
                                </span>
                            </p>
                            <p>
                                <span style="font-size: 14pt;"><span 
style="font-family: 궁서,Gungsuh;"></span></span>
                            </p>
                            <span style="font-size: 14pt;"><span 
style="font-family: 궁서,Gungsuh;">
<p><br></p>
<p><br></p>
<p><br></p>
<p><br></p>
<p><br></p>
<p><br></p>
<p><br></p>
<p><br></p></span>
                            <p>
                                <br>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            <span style="font-size: 14pt;">
<p><br></p><span style="font-family: 궁서,Gungsuh;">
<p><br></p>
<p><br></p></span>
                            <p></p>
                            </span>
                            <p>
                                <font face="굴림" size="3"> </font>
                            </p>
                            <p>
                                <font face="굴림" size="3">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p></p>
                            <p></p>
                            <p></p>
                            <p></p>
                            <p>
                                <br>
                            </p>
                            <img style="width: 500px; height: 500px;" src="오리안심져키(50g)%20-%20펫치즈_files/copy(1484734357)-3.jpg" vspace="0" hspace="5">
                            <p></p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"><br></span>
                            </p>
                            <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"><!--StartFragment-->
<p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;"><span 
style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">알러지가 적은 식품이기 떄문에 체질 개선에 도움을 주며</span></span>
                            </p>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <span style="font-size: 16pt;"></span>
                                <span style="font-size: 16pt;"><!--[if !supportEmptyParas]--></span>
                                <span style="font-size: 16pt;">&nbsp;</span>
                                <span style="font-size: 16pt;"><!--[endif]--></span>
                                <span style="font-size: 16pt;">  </span>
                                <o:p></o:p>
                            </p>
                            <p class="0" style="background: rgb(255, 255, 255); mso-pagination: none; mso-padding-alt: 0pt 0pt 0pt 0pt;">
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">고양이</span></span>
                                <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;"><span 
style="font-size: 16pt;">,</span></span>
                                <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;">강아지들에게 기호성이 좋습니다</span></span>
                                <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;"><span 
style="font-size: 16pt;">.</span></span>
                            </p>
                            </span>
                            <p>
                                <br>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"></span>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"></span>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"></span>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"><br></span>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"><br></span>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"><br></span>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"><br></span>
                            </p>
                            <p>
                                <span style="font-family: 궁서,Gungsuh; font-size: 14pt;"><br></span>
                            </p>
                            <font size="3">
                                <p>
                                    <br>
                                </p>
                                <p>
                                    <br>
                                </p>
                            </font>
                            <font size="3">
                                <p>
                                    <br>
                                </p>
                                <p></p>
                            </font>
                            <p>
                                <span style="font-size: 14pt;"><strong><span 
style="font-family: 궁서,Gungsuh;"><br></span>
                                </strong>
                                </span>
                            </p>
                            <span style="font-size: 14pt;"><strong><em>
<p><br></p>
<p></p></em>
<p></p></strong>
<p></p></span>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p>
                                <br>
                            </p>
                            <p></p>
                            <p></p>
                            <p></p>
                            <p>
                                <font size="3"></font>
                            </p>
                            <p>
                                <br>
                            </p>
                            <img style="width: 500px; height: 500px;" src="오리안심져키(50g)%20-%20펫치즈_files/copy(1484734379)-2.jpg" vspace="0" hspace="5">
                            <p></p>
                            <p>
                                <font size="3">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span style="font-family: Sandoll 미생; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;"><span style="font-size: 18pt;"><span style="background-color: rgb(255, 239, 0);">펫치즈</span>의</span>
                                    </span>
                                    </span>
                                    <span style="font-size: 16pt;"><span 
style="font-size: 18pt;">&nbsp;</span></span>
                                    <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;"><span style="font-size: 18pt;">모든 간식은 
</span></span>
                                    </span>
                                    <span style="background: rgb(255, 255, 255); color: rgb(255, 0, 0); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;"><span 
style="font-size: 18pt;">무</span></span>
                                    </span>
                                    <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;"><span style="font-size: 18pt;">색소 
</span></span>
                                    </span>
                                    <span style="background: rgb(255, 255, 255); color: rgb(255, 0, 0); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;"><span 
style="font-size: 18pt;">무</span></span>
                                    </span>
                                    <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;"><span style="font-size: 18pt;">방부제 
</span></span>
                                    </span>
                                    <span style="background: rgb(255, 255, 255); color: rgb(255, 0, 0); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;"><span 
style="font-size: 18pt;">무</span></span>
                                    </span>
                                    <span style="background: rgb(255, 255, 255); font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생;"><span 
style="font-size: 16pt;"><span style="font-size: 18pt;">첨가물 
입니다</span></span>
                                    </span>
                                    <span lang="EN-US" style="background: rgb(255, 255, 255); letter-spacing: 0pt; font-family: Sandoll 미생; font-size: 14pt; mso-fareast-font-family: Sandoll 미생; mso-ascii-font-family: Sandoll 미생; mso-font-width: 100%; mso-text-raise: 0pt;"><span 
style="font-size: 16pt;"><span 
style="font-size: 18pt;">.</span></span>
                                    </span>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">원재료/원산지 :오리안심(국내산)</font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <font face="궁서" size="5">
                                    <br>
                                </font>
                            </p>
                            <p>
                                <img style="width: 745px; height: 828px;" src="오리안심져키(50g)%20-%20펫치즈_files/copy(1477543735)-A.jpg" vspace="0" hspace="5">
                            </p>
                            <p>
                                <font face="궁서" size="5"></font>
                            </p>
                            <font face="궁서" size="5">
                                <p>
                                    <br>
                                </p>
                                <p>
                                    <br>
                                </p>
                            </font>
                            <p>
                                <br>
                            </p>
                        </div>
                    </div>
                    <!-- //상품상세정보 -->
                    <!-- 상품결제정보 -->
                    <div id="prdPayment">
                        <!-- <ul class="link">
            <li><a href="#prdDetail">상품상세정보</a></li>
            <li class="selected"><a href="#prdPayment">상품결제정보</a></li>
            <li><a href="#prdDelivery">배송정보</a></li>
            <li><a href="#prdChange">교환 및 반품정보</a></li>
            <li><a href="#prdService">서비스문의</a></li>
            <li><a href="#prdReview">상품사용후기</a></li>
            <li><a href="#prdQnA">상품Q&amp;A</a></li>
            <li><a href="#prdRelated">관련상품</a></li>
        </ul>-->
                        <!--<div class="cont">
            <h3></h3>
            <p><br></p>        </div> -->
                    </div>
                    <!-- //상품결제정보 -->
                    <!-- 배송정보 -->
                    <div id="prdDelivery">
                        <!-- <ul class="link">
            <li><a href="#prdDetail">상품상세정보</a></li>
            <li><a href="#prdPayment">상품결제정보</a></li>
            <li class="selected"><a href="#prdDelivery">배송정보</a></li>
            <li><a href="#prdChange">교환 및 반품정보</a></li>
            <li><a href="#prdService">서비스문의</a></li>
            <li><a href="#prdReview">상품사용후기</a></li>
            <li><a href="#prdQnA">상품Q&amp;A</a></li>
            <li><a href="#prdRelated">관련상품</a></li>
        </ul>-->
                        <!-- <div class="cont">
            <h3>배송정보</h3>
            <ul class="delivery">
                <li>배송 방법 : 택배</li>
                <li>배송 지역 : 전국지역</li>
                <li>배송 비용 : 5,000원</li>
                <li>배송 기간 : 3일 ~ 7일</li>
                <li>배송 안내 : <p><br></p></li>
            </ul>
        </div>-->
                    </div>
                    <!-- //배송정보 -->
                    <!-- 교환 및 반품정보 -->
                    <div id="prdChange">
                        <!--  <ul class="link">
            <li><a href="#prdDetail">상품상세정보</a></li>
            <li><a href="#prdPayment">상품결제정보</a></li>
            <li><a href="#prdDelivery">배송정보</a></li>
            <li class="selected"><a href="#prdChange">교환 및 반품정보</a></li>
            <li><a href="#prdService">서비스문의</a></li>
            <li><a href="#prdReview">상품사용후기</a></li>
            <li><a href="#prdQnA">상품Q&amp;A</a></li>
            <li><a href="#prdRelated">관련상품</a></li>
        </ul>-->

                        <div class="cont">
                            <H3></H3>
                            <p>
                                <br>
                            </p>
                        </div>
                    </div>
                    <!-- //교환 및 반품정보 -->
                    <!-- 서비스문의 -->
                    <div id="prdService">
                        <!--  <ul class="link">
            <li><a href="#prdDetail">상품상세정보</a></li>
            <li><a href="#prdPayment">상품결제정보</a></li>
            <li><a href="#prdDelivery">배송정보</a></li>
            <li><a href="#prdChange">교환 및 반품정보</a></li>
            <li class="selected"><a href="#prdService">서비스문의</a></li>
            <li><a href="#prdReview">상품사용후기</a></li>
            <li><a href="#prdQnA">상품Q&amp;A</a></li>
            <li><a href="#prdRelated">관련상품</a></li>
        </ul>-->
                        <!--   <div class="cont">
            <h3>서비스문의</h3>
            <p><br></p>        </div>-->
                    </div>
                    <!-- //서비스문의 -->
                    <!-- 상품사용후기 -->
                    <div id="prdReview">
                        <!--  <ul class="link">
            <li><a href="#prdDetail">상품상세정보</a></li>
            <li><a href="#prdPayment">상품결제정보</a></li>
            <li><a href="#prdDelivery">배송정보</a></li>
            <li><a href="#prdChange">교환 및 반품정보</a></li>
            <li><a href="#prdService">서비스문의</a></li>
            <li class="selected"><a href="#prdReview">상품사용후기</a></li>
            <li><a href="#prdQnA">상품Q&amp;A</a></li>
            <li><a href="#prdRelated">관련상품</a></li>
        </ul>-->

                        <div class="board">
                            <H3>REVIEW</H3>
                            <p class="desc">상품의 사용후기를 적어주세요.</p>
                            <p class="nodata">게시물이 없습니다</p>
                            <p class="btnArea">
                                <A href="http://petcheeze.co.kr/board/product/write.html?board_no=4&amp;product_no=31&amp;cate_no=24&amp;display_group=1"><span 
class="sherbetbt_b white">WRITE</span></A>
                                <A href="http://petcheeze.co.kr/board/product/list.html?board_no=4"><span 
class="sherbetbt_b white">LIST</span></A> </p>
                        </div>
                    </div>
                    <!-- //상품사용후기 -->
                    <!-- 상품 Q&A -->
                    <div id="prdQnA">
                        <!-- <ul class="link">
            <li><a href="#prdDetail">상품상세정보</a></li>
            <li><a href="#prdPayment">상품결제정보</a></li>
            <li><a href="#prdDelivery">배송정보</a></li>
            <li><a href="#prdChange">교환 및 반품정보</a></li>
            <li><a href="#prdService">서비스문의</a></li>
            <li><a href="#prdReview">상품사용후기</a></li>
            <li class="selected"><a href="#prdQnA">상품Q&amp;A</a></li>
            <li><a href="#prdRelated">관련상품</a></li>
        </ul>-->

                        <div class="board">
                            <H3>Q&amp;A</H3>
                            <p class="desc">상품에 대해 궁금한 점을 해결해 드립니다.</p>
                            <p class="nodata">게시물이 없습니다</p>
                            <p class="btnArea">
                                <A href="http://petcheeze.co.kr/board/product/write.html?board_no=6&amp;product_no=31&amp;cate_no=24&amp;display_group=1"><span 
class="sherbetbt_b white">WRITE</span></A>
                                <A href="http://petcheeze.co.kr/board/product/list.html?board_no=6&amp;link_product_no=31"><span 
class="sherbetbt_b white">LIST</span></A> </p>
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
    <script src="오리안심져키(50g)%20-%20펫치즈_files/optimizer.js" type="text/javascript"></script>

    <script type="text/javascript">
        var mobileWeb = false;
        var bUseElastic = false;
        var sSearchBannerUseFlag = 'F';
        var SHOP_CURRENCY_INFO = {
            "1": {
                "aShopCurrencyInfo": {
                    "currency_code": "KRW",
                    "currency_no": "410",
                    "currency_symbol": "\uffe6",
                    "currency_name": "South Korean won",
                    "currency_desc": "\uffe6 \uc6d0 (\ud55c\uad6d)",
                    "decimal_place": 0,
                    "round_method_type": "F"
                },
                "aShopSubCurrencyInfo": null,
                "aBaseCurrencyInfo": {
                    "currency_code": "KRW",
                    "currency_no": "410",
                    "currency_symbol": "\uffe6",
                    "currency_name": "South Korean won",
                    "currency_desc": "\uffe6 \uc6d0 (\ud55c\uad6d)",
                    "decimal_place": 0,
                    "round_method_type": "F"
                },
                "fExchangeRate": 1,
                "fExchangeSubRate": null,
                "aFrontCurrencyFormat": {
                    "head": "",
                    "tail": "\uc6d0"
                },
                "aFrontSubCurrencyFormat": {
                    "head": "",
                    "tail": ""
                }
            }
        };
        var mileage_val = '36';
        var mileage_generate_calc = '36';
        var basket_type = 'A0000';
        var product_name = '오리안심져키(50g)';
        var product_max_type = 'F';
        var has_option = 'F';
        var mileage_icon = '//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif';
        var mileage_icon_alt = '적립금';
        var price_unit_head = '';
        var price_unit_tail = '원';
        var option_push_button = 'F';
        var product_image_tiny = '201701/31_shop1_468859.jpg';
        var is_adult_product = 'F';
        var is_individual_buy = 'F';
        var is_soldout_icon = 'F';
        var link_product_detail = '/product/오리안심져키50g/31/display/1/';
        var product_min = '1';
        var order_limit_type = 'O';
        var product_max = '-1';
        var buy_unit_type = 'O';
        var buy_unit = '1';
        var product_price = '3600';
        var product_price_content = '';
        var is_selling_price = 'S';
        var product_price_mobile = '3600';
        var mobile_dc_price = '';
        var isMobileDcStatus = 'F';
        var product_price_ref = '';
        var currency_disp_type = 'P';
        var delvtype = 'A';
        $.data(document, 'SameImage', 'F');
        var _iPrdtPriceOrg = 3273;
        var _iPrdtPriceTax = 327;
        var qrcode_class = 'EC_Qrcode59f88388077e8';
        var qrcode_url = 'http://petcheeze.co.kr/product/detail.html?product_no=31';
        var sSocialUrl = "/exec/front/Product/Social/";
        var sIsMileageDisplay = 'T';
        EC_SHOP_FRONT_NEW_OPTION_COMMON.initObject();
        EC_SHOP_FRONT_NEW_OPTION_BIND.initChooseBox();
        EC_SHOP_FRONT_NEW_OPTION_DATA.initData();
        EC_SHOP_FRONT_NEW_LIKE_COMMON.init({
            "bIsUseLikeProduct": false,
            "bIsUseLikeCategory": false
        });
        EC_SHOP_FRONT_REVIEW_TALK_REVIEW_COUNT.bIsReviewTalk = 'F';
        var sMileageUnit = '[:가격:]원';
        var sIsDisplayNonmemberPrice = "F";
        var sNonmemberPrice = '-';
        var aOptionColorchip = [];
        var _iPrdtPriceOrg = 3273;
        var _iPrdtPriceTax = 327;
        var option_type = 'T';
        var product_code = 'P00000BE';
        var item_code = 'P00000BE000A';
        var item_count = '1';
        var item_listing_type = 'C';
        var product_option_price_display = 'T';
        var add_option_name = '';
        var iProductNo = '31';
        var iCategoryNo = '24';
        var iDisplayGroup = '1';
        var option_msg = '필수 옵션을 선택해 주세요.';
        var sLoginURL = 'login.html';
        var bPrdOptLayer = '';
        var sOptionType = 'T';
        var aReserveStockMessage = {
            "show_stock_message": "F",
            "Q": "[\uc7ac\uace0 : [:\uc218\ub7c9:]\uac1c][\ub2f9\uc77c\ubc1c\uc1a1]",
            "R": "[\uc7ac\uace0 : [:\uc218\ub7c9:]\uac1c][\uc608\uc57d\uc8fc\ubb38]",
            "N": "",
            "stock_message_replace_name": "[:\uc218\ub7c9:]"
        };
        var aLogData = {
            "log_server1": "eclog2-197.cafe24.com",
            "log_server2": "eclog2-197.cafe24.com",
            "mid": "enlys7"
        };

    </script>
    
<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

</body>

</html>
