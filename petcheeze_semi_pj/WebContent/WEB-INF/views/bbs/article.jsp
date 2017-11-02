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

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css"
	type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript">

function deleteBoard(num) {
<c:if test="${sessionScope.member.userId=='admin@aaa.aaa'}">
    var page = "${page}";
    var query = "num="+num+"&page="+page;
    var url = "<%=cp%>/bbs/delete.do?" + query;

    if(confirm("게시글을 삭제하시겠습니까 ? "))
    	location.href=url;
</c:if>    

}

function updateBoard(num) {
<c:if test="${sessionScope.member.userId=='admin@aaa.aaa'}">
    var page = "${page}";
    var query = "num="+num+"&page="+page;
    var url = "<%=cp%>/bbs/update.do?" + query;

	if (confirm("게시글을 수정하시겠습니까 ? "))
		location.href = url;

	</c:if>
}
</script>
</head>
<body>

	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div>
		<form name="articleForm" method="post">
			<div class="body-container"
				style="width: 1030px; border: 1px solid #ffeab3; border-top: 3px solid #ffd700; padding: 20px 40px;">
				<div class="body-title">
					<h3>
						<span style="font-family: Webdings"></span> 고객센터
					</h3>
					<span style="font-family: sans-serif; font-size: 18px"> </span>&nbsp;ㅣ&nbsp;&nbsp;펫치즈에서
					제공하는 다양한 제품과 서비스를 소개합니다
				</div>

				<div
					style="width: 1030px; margin: 0px auto; border-bottom: 1px solid #ffeab3; border-top: 1px solid #fff2d2;">
					<div class="table-responsive" style="clear: both;">
						<div class="bbs-article">
							<table style="width: 100%; margin: 0px auto;">
								<thead>
									<tr>
										<th colspan="2"
											style="color: #ffbf00; font-size: 21px; text-align: center; padding: 21px 10px;">
											${dto.subject}</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td
											style="color: #aaa; text-align: left; border-bottom: 1px solid #ffeab3; padding: 0 0 10px 5px;">
											&nbsp;이름 : ${sessionScope.member.userName}</td>

										<td
											style="color: #aaa; text-align: right; border-bottom: 1px solid #ffeab3; padding: 0 5px 10px 0;">
											입력일&nbsp;:&nbsp;${dto.created}&nbsp;<br>조회
											:&nbsp;${dto.hitCount}&nbsp;
										</td>
									</tr>
									<tr style="border-bottom: #d5d5d5 solid 1px;">
										<td colspan="2" style="padding: 10px; min-height: 280px;">${dto.content}</td>
									</tr>
									<tr>

										<td colspan="2"
											style="padding: 10px; border-top: #d5d5d5 solid 1px; border-bottom: #d5d5d5 solid 1px;">
											<span style="display: inline-block; min-width: 45px;">이전글</span>
											: <c:if test="${not empty preReadDto }">
												<a
													href="<%=cp%>/bbs/article.do?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
											</c:if>
										</td>
									</tr>
									<tr>
										<td colspan="2"
											style="padding: 10px; border-bottom: #d5d5d5 solid 1px;">
											<span style="display: inline-block; min-width: 45px;">다음글</span>
											: <c:if test="${not empty nextReadDto }">
												<a
													href="<%=cp%>/bbs/article.do?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
											</c:if>
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr height="60">
										<td align="left" width="100">
											<c:if test="${sessionScope.member.userId=='admin@aaa.aaa'}">
												<button type="button" style="border: 1px solid #e9e8ea; height: 42px; text-align: center; width: 76px;"
													onclick="updateBoard('${dto.num}');">수정</button>
											</c:if> 
											<c:if test="${sessionScope.member.userId=='admin@aaa.aaa'}">
												<button type="button"
													style="border: 1px solid #e9e8ea; height: 42px; text-align: center; width: 76px;"
													onclick="deleteBoard('${dto.num}');">삭제</button>
											</c:if>
										</td>

										<td align="right" width="100">
											<button type="button"
												style="border: 1px solid #e9e8ea; height: 42px; text-align: center; width: 76px;"
												onclick="javascript:location.href='<%=cp%>/bbs/list.do?${query}';">
												목록으로</button>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>


	<div class="footer">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>