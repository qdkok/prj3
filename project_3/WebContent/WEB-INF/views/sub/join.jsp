<%@page import="kr.co.sist.hkland.dao.HklandDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
    <!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>HK랜드 플랫폼</title>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="commons/css/business-frontpage.css" rel="stylesheet">
    
     <!-- CDN -->    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <c:import url="../common.jsp"/>
    
     <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- CSS 줄때 화면 -->
    <link href="commons/css/main.css" rel="stylesheet">
	<style type="text/css">
		.btn{background-color:#ededed;font-weight: bold;}
		.red{color: red;}
		.title{font-weight: bold; font-size: 15px;}
		table{/* border: 2px solid #ededed; */ min-width: 400px; }
		.inputBox{width: 500px; height: 45px;}
		.inputBox2{height: 45px;}
		.box{background-color: #ededed;}
		td{padding: 5px;}
	</style>
    <script type="text/javascript">
    	$(function(){
   			var chkId='';
   			var chkpw='';
    		$("[name=id]").blur(function(){
    			var inputed=$("[name=id]").val().trim();
	    		$.ajax({
	                data : {
	                    id : inputed
	                },
	                url : "idChk.do",
	                success : function(data) {
						if(inputed!="" && data==''){
							$('#idChkOK').css({
			    				"display":"inline-block"
			    			});
							$('#idChkNO').css({
			    				"display":"none"
			    			});
							chkId=inputed;
						}else if(inputed!="" &&data!='' ||inputed==""){
							$('#idChkNO').css({
								"display":"inline-block"
			    			});
							$('#idChkOK').css({
								"display":"none"
			    			});
							chkId='';
						}
	                }//end success
	    		});
    		});
    		
    		$("[name=pw]").blur(function(){
    			chkpw=chkPw();
    		});
    		$("[name=pw2]").blur(function(){
    			chkpw=chkPw();
    		});
    		
    		$("#join_btn").click(function(){
    			if($("[name=id]").val().trim()==''){
    				alert("아이디를 입력해주세요");
    				$("[name=id]").focus();
    				return;
    			}//end if
    			if(chkId==''){
    				alert("사용할 수 있는 아이디를 입력해주세요");
    				$("[name=id]").focus();
    				return;
    			}//end if
    			if($("[name=pw]").val().trim()==''){
    				alert("비밀번호를 입력해주세요");
    				$("[name=pw]").focus();
    				return;
    			}//end if
    			if($("[name=pw2]").val().trim()==''){
    				alert("비밀번호 확인을를 입력해주세요");
    				$("[name=pw2]").focus();
    				return;
    			}//end if
    			if(chkpw==''){
    				alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
    				$("[name=pw]").focus();
    				return;
    			}//end if
    			if($("[name=name]").val().trim()==''){
    				alert("이름을 입력해주세요");
    				$("[name=name]").focus();
    				return;
    			}//end if
    			if($("[name=ph1]").val().trim()==''){
    				alert("전화번호를 입력해주세요");
    				$("[name=ph1]").focus();
    				return;
    			}//end if
    			if($("[name=ph2]").val().trim()==''){
    				alert("전화번호를 입력해주세요");
    				$("[name=ph2]").focus();
    				return;
    			}//end if
    			if($("[name=Email]").val().trim()==''){
    				alert("이메일 입력해주세요");
    				$("[name=Email]").focus();
    				return;
    			}//end if
    			if($("[name=Email2]").val().trim()==''){
    				alert("이메일 주소를 입력해주세요");
    				$("[name=Email2]").focus();
    				return;
    			}//end if
    			
    			document.join_frm.submit();
    		});//click
    		
    	});
    	
    	function chkPw(){
    		var pw=$("[name=pw]").val().trim();
			var pw2=$("[name=pw2]").val().trim();
				if(pw!=='' && pw==pw2 && pw2!==''){
					$('#pwChkOK').css({
	    				"display":"inline-block"
	    			});
					$('#pwChkNO').css({
	    				"display":"none"
	    			});
					return pw;
				}else {
					$('#pwChkOK').css({
	    				"display":"none"
	    			});
					$('#pwChkNO').css({
	    				"display":"inline-block"
	    			});
					return '';
				}//end else
    	}
		
    	
       function emailInput(){
    	   if($("[name=email]").val()!='직접입력'){
    		   $("[name=Email2]").val($("[name=email]").val());
    	   }//end if
       }
		    	
	   function loginAccess(){
	    	location.href='login.do';
	    }
	    function joinAccess(){
	    	location.href='join_terms.do';
	    }
	    function searchIDAccess(){
	    	location.href='searchId.do';
	    }
    </script>
    
  </head>
  <body>
  <div id="wrap">
  
  	<header>
	  		<!-- nav바 -->
	  		<c:import url="../../../commons/menu/menu_nav.jsp"/>
	  		<!-- 메뉴버튼바 -->
	  		<c:import url="../../../commons/menu/menu_btn.jsp"/>
	  		
  	</header>
    <!-- Page Content -->
	
    <div class="contain" >
    	<div id="test_top" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; background-color: #cd493c; color: #fff ">회원가입</div>
			<div style=" width: 100%;  height: 150px; background-color: #cd493c;"></div>
		</div>
		<div id="test_center" style="max-width: 1300px; margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="로그인" onclick="loginAccess()"></div>
		  			<div><input type="button" class="button2" value="회원가입" onclick="joinAccess()"></div>
		  			<div><input type="button" class="button2" value="ID/PASS 찾기" onclick="searchIDAccess()"></div>
			    </form>
	  		</div>
			<div style=" width: 100%;  height: 800px; " align="center" >
					<form action="join_process.do" name="join_frm" method="post">
						<table style="background-color: #fff;">
							<tr>
								<!-- <td style="font-weight: bold;font-size: 35px;" align="center">회원가입</td> -->
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="title">
									ID&nbsp;
									<span style="float: right;">
									<label id="idChkOK" style="display:none; color: green;">사용하실수 있는 아이디입니다</label>
									<label id="idChkNO" style="display:none; color: red;">사용하실수 없는 아이디입니다</label>
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="id" id="id" class="inputBox" /> 
								</td>
							</tr>
							<tr>
								<td class="title">Password
									<span style="float: right;">
									<label id="pwChkOK" style="display:none; color: green;">비밀번호 가 일치합니다</label>
									<label id="pwChkNO" style="display:none; color: red;">비밀번호와 확인비밀번호가 일치하지 않습니다</label>
									</span>	
								</td>
							</tr>
							<tr>
								<td><input type="password" name="pw"  class="inputBox"/></td>
							</tr>
							<tr>
								<td class="title">Password check</td>
							</tr>
							<tr>
								<td><input type="password" name="pw2" class="inputBox" /></td>
							</tr>
							<tr>
								<td class="title">Name</td>
							</tr>		
							<tr>
								<td><input type="text" name="name"  class="inputBox"/></td>
							</tr>
							<tr>
								<td class="title">Birth</td>
							</tr>
							<tr>
								<td align="center">
									<input type="text" style="width: 100px" name="year" class="inputBox" maxlength="4"  /> 년 
									<input type="text" style="width: 100px" name="month" class="inputBox" maxlength="2"  /> 월 
									<input type="text" style="width: 100px" name="day" class="inputBox" maxlength="2"  /> 일
								</td>
							</tr>
							<tr>
								<td class="title">Tel</td>
							</tr>
							<tr>
								<td align="center">
									<select name="sel" style="width: 100px" class="inputBox">
										<option value="010" selected>010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - 
									<input type="text" style="width: 100px" name="ph1" class="inputBox" maxlength="4"  /> - 
									<input type="text" style="width: 100px" name="ph2" class="inputBox" maxlength="4"  />
								</td>
							</tr>
							<tr>
								<td class="title">Gender</td>
							</tr>		
							<tr>
								<td align="center" style="font-weight: bold;">
									<input type="radio" name="gender" value="m" checked="checked"/>MEN
									<input type="radio" name="gender" value="g" />GIRL
								</td>
							</tr>
							<tr >
								<td class="title">Email</td>
							</tr>
							<tr align="center">
								<td>
								<input type="text" name="Email" style="width: 140px"class="inputBox2" />@
								<input type="text" class="inputBox2" style="width: 140px" name="Email2" /> 
									<select name="email" class="inputBox2" onchange="emailInput()"  style="width: 100px;">
										<option value="직접입력">직접입력</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
								</select></td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr >
								<td align="center">
								<input type="button" value="가입" class="btn" style="background-color: green; width:250px; color:#fff; height: 50px;" id="join_btn"/> 
								<input type="reset"  value="취소" class="btn" style="background-color: red; width:250px; color:#fff; height: 50px;" onclick="history.back()"/><br />
							</td>
							</tr>
						</table>
					</form>
			</div>
		</div>
    </div>	
    
    <!-- Footer -->
	    <footer class="py-5 bg-dark">
	     	<c:import url="../../../commons/menu/menu_footer.jsp"/>
	    </footer>

	</div>
  </body>
</html>
