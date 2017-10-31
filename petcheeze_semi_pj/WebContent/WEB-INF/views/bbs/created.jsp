<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp=request.getContextPath();
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

<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript">

  // 좌우의 공백을 제거하는 함수
  if(typeof String.prototype.trim !== 'function') {
    String.prototype.trim = function() {
        var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
        return this.replace(TRIM_PATTERN, "");
    };
  }

  function sendBoard() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }
    	
        var mode="${mode}";
        if(mode=="created")
    		f.action="<%=cp%>/bbs/created_ok.do";
    	else if(mode=="update")
    		f.action="<%=cp%>/bbs/update_ok.do";

		return true;
	}
</script>

</head>

<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>

	<div class="container" role="main">
		<div class="body-container"
			style="width: 1060px; border: 1px solid #ffeab3; border-top: 3px solid #ffd700; padding: 20px 40px;">

			<div class="body-title">
				<h3>
					<span style="font-family: Webdings"></span> 고객센터
				</h3>
				<span style="font-family: sans-serif; font-size: 18px"></span>&nbsp;ㅣ&nbsp;&nbsp;펫치즈에서
				제공하는 제품과 서비스를 소개합니다
			</div>

			<form name="boardForm" method="post">
				<div>
					<table
						style="width: 1100px; margin: 20px auto 0px; border-spacing: 0px;">
						<tbody>
							<tr align="left" height="40">

								<td width="100"
									style="text-align: left; border-top: 1px solid #e7e8ea;">
									&nbsp;ㅣ&nbsp;제목</td>

								<td style="padding-left: 10px;">
								<input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;"
									value="${dto.subject}"></td>

								<td style="padding-left: 10px;">&nbsp;</td>

							</tr>

							<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
								
								<td width="100" style="text-align: left; border-top: 1px solid #e7e8ea;">&nbsp;ㅣ&nbsp;작성자</td>
								
								<td style="padding-left: 10px;"><p>${sessionScope.member.userName}</p></td>
							</tr>

							<tr align="left" style="border-bottom: 1px solid #cccccc;">
								<td width="100" style="text-align: left; border-top: 1px solid #e7e8ea; border-bottom: 1px solid #e7e8ea; padding-top: 5px;">
								&nbsp;ㅣ&nbsp;내용</td>
								<td valign="top" style="padding: 5px 0px 5px 10px;">
								<textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr height="200">
								<td colspan="4" align="center">
									
									<button type="submit" class="btn btn-primary" style="border: 1px solid #e7e8ea; height: 42px; text-align: center; width: 76px;"
										onclick="sendBoard();">${mode=="created"?"등록하기":"수정완료"}</button>
									
									<button type="reset" class="btn" style="border: 1px solid #e7e8ea; height: 42px; text-align: center; width: 76px;">다시입력</button>
									
									<button type="button" class="btn btn-danger" style="border: 1px solid #e7e8ea; height: 42px; text-align: center; width: 76px;"
										onclick="javascript:location.href='<%=cp%>/bbs/list.do';">${mode=="created"?"등록취소":"수정취소"}</button>
								
	                                  <c:if test="${mode=='update'}">
	                                      <input type="hidden" name="num" value="${dto.num}">
	                                      <input type="hidden" name="page" value="${page}">
	                                  </c:if>						
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
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
