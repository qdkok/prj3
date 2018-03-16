<%@page import="kr.co.sist.admin.vo.ad_LoginVO"%>
<%@page import="kr.co.sist.admin.dao.HklandAdminDAO"%>
<%@page import="java.util.List"
%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="관리자로그인페이지" 
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HK LAND에 오신걸 환영합니다!</title>
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
	
	/* Enter키 눌렀을 때 무조건 submit 막음 */
	$(document).on('keydown',function(e){
		if(e.keyCode==13) return false; //엔터키 = 13;
	});
	
	$('#a_id').on('keydown', function(e){ // id -> pass
		if(e.keyCode==13) $('#a_pw').focus();
	});

	$('#a_pw').on('keydown', function(e){ //ID -> 비밀번호
		if(e.keyCode==13 && $("#a_id").val() != "" && $("#a_pw").val() != ""){
				$("#frm").submit();
		}
	}); 
	
	/* 버튼클릭했을 경우 submit 동작 */
	$("#btnLogin").click(function() {
		  var a_id=$("#a_id").val();
		  var a_pw=$("#a_pw").val();
		  
		  if(a_id==""){
			  alert("아이디를 입력해주세요.");
			  $("#a_id").focus();
			  return;
		  }//end if
		  
		  if(a_pw==""){
			  alert("비밀번호를 입력해주세요.");
			  $("#a_pw").focus();
			  return;
		  }//endif
		  
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
		
			<form id="frm" action="ad_login.do" method="post">
			<table>
		      <tr>
		      	<td><label>아이디</label></td>
		         <td><input type="text" name="a_id" class="inputBox" id="a_id" style="width:195px; height:32px;" placeholder="아이디" "/></td>
		         <td rowspan="2">
		        	<input type="button" value="로그인" class="btn" id="btnLogin" style="width:78px; height:82px; margin-left:5px;"/>
		         </td>
		      </tr>
		      <tr>
		      	 <td><label>비밀번호</label></td>
		         <td><input type="password" name="a_pw" id="a_pw" class="inputBox" style="width:195px; height:32px; margin-top:2px;" placeholder="비밀번호"/></td>
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