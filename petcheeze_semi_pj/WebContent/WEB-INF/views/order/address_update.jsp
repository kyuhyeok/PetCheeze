<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp=request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=cp%>/resource/css/menu.css" type="text/css">	<!-- main+menu용 CSS(규혁) -->
<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">

<script type="text/javascript">


function memberOk() {
	var f = document.memberForm;
	var str;
	
	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return false;
    }
    f.userName.value = str;

    
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return false;
    }

    str = f.tel2.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel2.focus();
        return false;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return false;
    }

    str = f.tel3.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel3.focus();
        return false;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return false;
    }
    

    var admode="${admode}";
    if(admode=="add") {
    	f.action = "<%=cp%>/member/address_update.do";
    } else if(admode=="adapt") {
    	f.action = "<%=cp%>/member/update_ok.do";
    }
	
    return true;

}


function changeEmail() {
    var f = document.memberForm;
    var str;

    var str=f.selectEmail.value;

    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
    
    return true;

    
}



</script>


</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>


<div>

<form name="memberForm" method="post" onsubmit="return memberOk();">

<c:choose>
<c:when test="${admode=='add'}">
<h1><p align="center"  style="width: 1150px; margin:5px auto;">ADDRESS ADD</p></h1>
</c:when>
<c:when test="${admode=='adapt'}">
<h1><p align="center"  style="width: 1150px; margin:5px auto;">ADDRESS ADAPT</p></h1>
</c:when>
</c:choose>


<table style="width: 1150px; height: 50px; margin: 0px auto 30px; border-collapse: collapse;border-spacing: 0px; text-align: justify;" >
<tr>
<td style="text-align: center;"><b><h5>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</h5></b></td>

</tr>
</table>

<table style="border: 1px solid silver; width: 1150px; 
height: 50px; margin: 0px auto; border-collapse: collapse; border-spacing: 0px; text-align: justify;" >
<!-- 아이디 -->

<tr>
<td  style="border: 1px solid silver; width:200px ; padding: 10px 10px;" ><h5>배송지명</h5></td>
<td style="padding: 10px 10px;border: 1px solid silver;">
<input type="text"  name="userName" ${admode=="adapt" ? "value="adlist.userName:""} style="height: 22px; float: left;"${admode=="adapt" ? "readonly='readonly' ":""}>
</td>
</tr>
<!-- 이름 -->
<tr>
<td  style="border: 1px solid silver; width:200px ; padding: 10px 10px;" ><h5>성명</h5></td>
<td style="padding: 10px 10px;border: 1px solid silver;">
<input type="text"  name="userName" ${admode=="adapt" ? "value="adlist.userName:""} style="height: 22px; float: left;"${admode=="adapt" ? "readonly='readonly' ":""}>
</td>
</tr>
<!-- 주소 -->
<tr >
<td rowspan="3" style="border: 1px solid silver; width:200px ; padding: 10px 10px;" ><h5>주소</h5></td>
<td style="padding: 10px 10px;border: 1px solid silver;">
<input type="text"  ${admode=="adapt" ? "value="adlist.addr0:""}  name="addr0" style="height: 22px; width:75px;" >
-<img  src="<%=cp%>/resource/images/btn_zipcode.gif"  name="zipcode" style=" margin-left: 5px;" >
</td>
</tr>
<tr>

<td style="padding: 10px 10px;border: 1px solid silver;">
<input type="text"  name="addr1" ${admode=="adapt" ? "value="adlist.addr1:""} style="height: 22px; width:150px; float: left;"> <h5>&nbsp;기본주소</h5>
</td>
</tr>
<tr>

<td style="padding: 10px 10px;border: 1px solid silver;">
<input type="text"  name="addr2" ${admode=="adapt" ? "value="adlist.addr2:""}  style="height: 22px; width:300px; float: left;"> <h5>&nbsp;나머지 주소</h5>
</td>
</tr>
<!-- 일반전화 -->
<tr>
<td  style="border: 1px solid silver; width:200px ; padding: 10px 10px;" ><h5>휴대전화</h5></td>
<td style="padding: 10px 10px;border: 1px solid silver;">
<select name="tel1" style="height: 22px; width:50px; ">

<option value="010"  ${admode=="adapt"&adlist.tel1=="010" ? "selected='selected'" : ""}>010</option>
<option value="011" ${admode=="adapt"&adlist.tel1=="011" ? "selected='selected'" : ""}>011</option>
<option value="016" ${admode=="adapt"&adlist.tel1=="016" ? "selected='selected'" : ""}>016</option>
<option value="017" ${admode=="adapt"&adlist.tel1=="017" ? "selected='selected'" : ""}>017</option>
<option value="018" ${admode=="adapt"&adlist.tel1=="018" ? "selected='selected'" : ""}>018</option>
<option value="019" ${admode=="adapt"&adlist.tel1=="019" ? "selected='selected'" : ""}>019</option>

</select>

-<input type="text"  ${admode=="adapt" ? "value="adlist.tel2:""} name="tel2" style="height: 22px; width:100px;margin-left: 5px">
-<input type="text"  ${admode=="adapt" ? "value="adlist.tel3:""} name="tel3" style="height: 22px; width:100px;margin-left: 5px">
</td>
</tr>


</table>



<div align="center" style="width: 1150px;height: 250px; margin: 30px auto ; ">


<c:choose >
	<c:when  test="${admode=='add'}">
	<img style=" float: right;" onclick="javascript:location.href='<%=cp%>/main/main.do';" src="<%=cp%>/resource/images/btn_address_cancel.gif">
	<input type="image" src="<%=cp%>/resource/images/btn_address_register2.gif" style=" float: right;" >
	</c:when>
	<c:when test="${admode=='adapt'}">
	<img   style=" float: right; margin-left: 5px" onclick="javascript:location.href='<%=cp%>/main/main.do';" src="<%=cp%>/resource/images/btn_address_cancel.gif">
	<input style=" float: right;" type="image" src="<%=cp%>/resource/images/btn_address_modify2.gif">
	</c:when>
</c:choose>

</div>

</form>

</div>

	<div class="footer">
	    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

</body>
</html>