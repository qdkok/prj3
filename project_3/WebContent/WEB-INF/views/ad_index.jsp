<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<style type="text/css">
	a { color:#FFFFFF; }
	html { height:100%; background: url("http://localhost:8080/project_3/ad_common/images/HKland_admin_back1.jpg") no-repeat center center; background-size: cover; position: relative; margin:0px; padding:0px;}
	#bg { width:100%; height:100%; position:absolute; top:0px; left:0px; background: #000000; opacity: 0.8; z-index: -99;}
	#adminText{ color:#FFFFFF; margin:240px 0 0 240px; font-size:35px; z-index: -98; text-shadow: 8px 9px 10px #000;}
	#loginBox{ color:#FFFFFF; float: right; margin-right:160px; margin-top:155px; background-color : #000000; box-shadow: 1px 1px 1px #000; padding:0px 30px 30px; }
	#findInfo{ border-top: 1px solid #333; width:380px; padding-top:10px; margin-top:15px;}
</style>
<script type="text/javascript">
$(function(){
	  $("#btnLogin").click(function() {
		  $("#frm").submit() ;
	  });//click
});//ready

</script>

</head>
<body>
	<div id="wrap">
		<div id="bg"></div>
		<div id="adminText"><h1><div style="width:680px; background-color: #CC493C;">HK Land</div> 관리자 페이지</h1></div>
		<div id="loginBox">
			<div style="margin-bottom: 20px;"><h2>Admin Login</h2></div>
			<form id="frm" action="ad_home.do" method="post">
		    <table>
		      <tr>
		      	<td><label>아이디</label></td>
		         <td><input type="text" name="id" class="inputBox" id="id" style="width:195px; height:32px;" placeholder="아이디"/></td>
		         <td rowspan="2">
		        	<input type="button" value="로그인" class="btn" id="btnLogin" style="width:78px; height:82px; margin-left:5px;"/>
		         </td>
		      </tr>
		      <tr>
		      	 <td><label>비밀번호</label></td>
		         <td><input type="password" name="passwd" id="passwd" class="inputBox" style="width:195px; height:32px; margin-top:2px;" placeholder="비밀번호"/></td>
		      </tr>
		    </table>
		    </form>
		    <div id="findInfo">
		    	<a href="">아이디찾기</a> / <a href="">비밀번호찾기</a>
		    </div>
		</div>
		
		</div>

</body>
</html>