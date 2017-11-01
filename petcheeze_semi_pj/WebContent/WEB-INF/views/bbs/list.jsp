<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
		f.action="<%=cp%>/bbs/list.do";
		f.submit();
	}
</script>
</head>
<body>

	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="container">
		<div class="body-container"
			style="width: 1060px; border: 1px solid #ffeab3; border-top: 3px solid #ffd700; padding: 20px 40px;">
			<div class="body-title">
				<h3>
					<span style="font-family: Webdings"></span> 고객센터
				</h3>
				<span style="font-family: sans-serif; font-size: 18px"> </span>&nbsp;ㅣ&nbsp;&nbsp;펫치즈에서
				제공하는 다양한 제품과 서비스를 소개합니다
			</div>

			<div>
				<table
					style="width: 100%; margin: 15px 0px 5px; border-spacing: 0px;">
					<tr height="35">
						<td align="left" width="50%">
							<button type="button" class="btn btn-default btn-sm wbtn"
							style="border: 1px solid #e9e8ea; height: 32px; text-align: center; width: 76px;"
							onclick="javascript:location.href='<%=cp%>/bbs/list.do';">새로고침</button>
						</td>

						<td align="right" width="50%">
							<form name="searchForm" method="post">
								<select name="searchKey" class="selectField">
									<option value="alSUBJECT">제목</option>
									<option value="alcotent">내용</option>
									<option value="alDATE">등록일</option>
								</select> <input type="text" name="searchValue" class="boxTF">
								<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();" 
								style="border: 1px solid #e7e8ea; height: 32px; text-align: center; width: 32px;">
									검색</button>
							</form>
						</td>
					</tr>
				</table>

				<table
					style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
					<thead>
						<tr align="center" bgcolor="#eeeeee" height="35"
							style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
							<th style="width: 60; color: #7f7f7f;">번호</th>
							<th style="color: #7f7f7f;">제목</th>
							<th style="width: 40; color: #7f7f7f;">글쓴이</th>
							<th style="width: 50; color: #7f7f7f;">날짜</th>
							<th style="width: 50; color: #7f7f7f;">조회수</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;">
								<td class="text-center">${dto.listNum}</td>
								<td align="left" style="padding-left: 10px;"><a href='${articleUrl}&num=${dto.num}'>${dto.subject}</a></td>
								<td class="text-center"><p>${sessionScope.member.userName}</p></td>
								<td class="text-center">${dto.created}</td>
								<td class="text-center">${dto.hitCount}</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<div style="text-align: center; min-height: 50px; line-height: 50px; border-bottom: 1px solid #cccccc;">
					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					<c:if test="${dataCount==0 }">
			                   등록된 게시물이 없습니다.
			         </c:if>
					<c:if test="${dataCount!=0 }">
			               ${paging}
			         </c:if>
			         </table>
				</div>
				

				<table style="width: 100%; margin: 10px auto; border-spacing: 10px;">

					<tr height="40">
						<td align="center" width="100">
							<c:if test="${sessionScope.member.userId=='admin'}">
							<button type="button" style="border: 1px solid #c0c0c0; height: 42px; text-align: center; width: 76px;"
								onclick="javascript:location.href='<%=cp%>/bbs/created.do';">글쓰기</button>
							</c:if>
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
	<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>