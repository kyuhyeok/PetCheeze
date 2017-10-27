<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>spring</title>



<style type="text/css">
.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 17px;
   color: #999999; font-size: 11pt;
}
.loginTF {
  width: 340px; height: 35px;
  padding: 5px;
  padding-left: 15px;
  border:1px solid #999999;
  color:#333333;
  margin-top:5px; margin-bottom:5px;
  font-size:14px;
  border-radius:4px;
}


</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript">
function bgLabel(ob, id) {
    if(!ob.value) {
	    document.getElementById(id).style.display="";
    } else {
	    document.getElementById(id).style.display="none";
    }
}

function sendLogin() {
    var f = document.loginForm;

	var str = f.userId.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    str = f.userPwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }

    f.action = "<%=cp%>/member/login_ok.do";
    f.submit();
}
</script>

</head>
<body>

<div class="header">
</div>
	
<div class="container">
	<div>

	    <div align="center">
	    	<div style="text-align: center;">
	        	<span style="font-weight: bold; font-size:27px; color: #424951;">l o g i n</span>
	        </div>
	        
	       
			 <form name="loginForm" method="post" action="">
			   <fieldset style="width: 70%; height: 300px; padding-top: 50px; margin-top: 20px;">
			 	<table style="border-spacing: 10px">
			 	  <tr>
			 	    <td align="center">아이디</td>
			 	    <td><input type="text" name="userId" style="height:37px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"></td>
			 	    
			 	    <td rowspan="2" width="150px">
			      	 
			      	  <input type="image" src="<%=cp %>/resource/images/btn_login.png" width="120px" height="84px" onclick="sendLogin()">
			 	    
			 	    </td>
			 	  </tr>
			 	  <tr style="border: 1px solid #cccccc;">
			 	  	<td align="center">비밀번호</td>
			 	  	<td><input type="password" name="userPwd" style="height:37px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"></td>
			 	  </tr>
			 	</table>  
			 	
			 	<table>

			 	 <tr align="center" height="40" >
			    	<td><span style="color: blue;">${message}</span></td>
			 	 </tr>
			 	</table>
			 	
			 	<div style="margin-top: 10px;">
			 	<hr style="width: 450px;">
				</div>
				
				<table style="margin-top: 20px;">
				  <tr>
				  <td>
			 	     <a href="#" style="text-decoration: none">
			 	     	아이디찾기&nbsp;&nbsp;&nbsp;ㅣ
			 	     </a>
			 	     <a href="#" style="text-decoration: none"> 
			 	     	비밀번호찾기
			 	     </a>
			 	   </td>
			 	   <td style="width: 200px;" align="center">
			 	   <input type="image" src="<%=cp %>/resource/images/join.png" style="height: 40px">
			 	   </td>
				  </tr>
		
				</table>
			
				<div style="margin-top: 10px">
				    <span>회원가입을 하시면 더욱 특별한 혜택을 ..</span>
				</div>
				

  					
				
					
			    </fieldset>
				
			 </form>   
			        
		</div>

	</div>
</div>

<div class="footer">
    
</div>


<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>  <!-- j쿼리연결 -->

</body>
</html>