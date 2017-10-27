<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetCheeze</title>

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/";
		f.submit();
	}
</script>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	
	
<div class="container">
    <div class="body-container" style="width: 1060px; border: 1px solid #ffeab3; border-top:3px solid #ffd700;  padding: 20px 40px;">
        <div class="body-title">
            <h3><span style="font-family: Webdings"></span> 공지사항&nbsp;&amp;&nbsp;이벤트</h3>
            <span style="font-family: sans-serif; font-size: 18px"></span>&nbsp;ㅣ&nbsp;&nbsp;펫치즈의 소식과 이벤트를 소개합니다.
        </div>
        
        <div>
			<table style="width: 100%; margin: 15px 0px 5px; border-spacing: 0px;">
				<tr height="35">
				
					<td align="left" width="50%">
											
				    </td>
				    
				    <td align="right" width="50%">
				          <form name="searchForm" action="" method="post">
				              <select name="searchKey" class="selectField">
				                  <option value="subject">제목</option>
				                  <option value="userName">작성자</option>
				                  <option value="content">내용</option>
				                  <option value="created">등록일</option>
				            </select>
				            <input type="text" name="searchValue" class="boxTF">
				            <button type="button" class="btn" onclick="searchList()" 
				            style="border:1px solid #e7e8ea; height : 32px; text-align:center; width : 32px;">검색</button>
				        </form>
				     </td>
			     
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <th width="60" style="color: #787878;">번호</th>
			      <th style="color: #787878;">제목</th>
			      <th width="100" style="color: #787878;">작성자</th>
			      <th width="80" style="color: #787878;">작성일</th>
			      <th width="60" style="color: #787878;">조회수</th>
			  </tr>
			 
			  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
			      <td>1</td>
			      <td align="left" style="padding-left: 10px;">
			           <a href="#">제목입니다...</a>
			      </td>
			      <td>스프링</td>
			      <td>2010-10-10</td>
			      <td>1</td>
			  </tr>

			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			   <tr height="35">
				<td align="center">
			        1 2 3
				</td>
			   </tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 10px;">
					   
			<tr height="40">
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/';">새로고침</button>
				</td>
			
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/created.do';">글쓰기</button>
				</td>
					</tr>
			</table>
			
        </div>

    </div>
</div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>