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
		
	</style>

    <script type="text/javascript">
    	var obj1= document.ids;
    	var obj2= document.pws;
    	
    	function sh_id(){
    		document.ids.action="searchId.do";
    		document.ids.submit();
    	}
    	function sh_pw(){
    		document.pws.action="searchId.do";
    		document.pws.submit();                
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
    	<%
    		String data=(String)request.getAttribute("data");
    		if(data!=null){
    			out.print("<script type='text/javascript'>alert('조회하신'+data+'입니다.')</script>");
    		}//end if
    	%>
    	<div id="test_top" style="max-width: 1300px; margin: 0px auto;" >
	  		<div style="background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">ID/PW 찾기</div>
			<div style="background-color: #cd493c; width: 100%;  height: 150px; "></div>
		</div>
		<div id="test_center" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="로그인" onclick="loginAccess()"></div>
		  			<div><input type="button" class="button2" value="회원가입" onclick="joinAccess()"></div>
		  			<div><input type="button" class="button2" value="ID/PASS 찾기" onclick="searchIDAccess()"></div>
			    </form>
	  		</div>
			<div style=" width: 100%;  height: 800px; " align="center">
			<img src="http://localhost:8080/project_3/commons/images/HKlogo.png" width="250px;" onclick="#" />
			<table style="text-align: center;">
				<tr>
					<td>
						<form name="ids" method="post">
					<span style="font-weight: bold; font-size: 30px;">아이디 찾기</span>
					<table class="tt" style="margin: 0px auto; height:300px; border: 2px solid #ededed;">
						<tr>
							<td style="text-align: center;" >이름</td>
							<td colspan="2"><input type="text" name="i_name"  style="width:200px;"/></td>
						</tr>
						<tr>
							<td style="text-align: center;" >이메일</td>
							<td colspan="2"><input type="text" name="i_email"  style="width:200px;"/></td>
						</tr>
						<tr>
							<td colspan="3" >&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center; margin-top: 15px;">
								<input type="button" value="찾기" class="btn" style="background-color: green; width:100px; color:#fff; height: 50px;" id="id_btn" onclick=""/> 
							</td>
						</tr>
					</table>
				</form>					
					</td>
					<td>
						&nbsp;&nbsp;
					</td>
					<td>
						<form name="pws" method="post">
					<span style="font-weight: bold; font-size: 30px;">비밀번호 찾기</span>
					<table class="tt" style="margin: 0px auto; height:300px; border: 2px solid #ededed;">
						<tr>
							<td style="text-align: center;" >아이디</td>
							<td colspan="2"><input type="text" name="p_id"  style="width:200px;"/></td>
						</tr>
						<tr>
							<td style="text-align: center;" >이름</td>
							<td colspan="2"><input type="text" name="p_name"  style="width:200px;"/></td>
						</tr>
						<tr>
							<td style="text-align: center;" >이메일</td>
							<td colspan="2"><input type="text" name="p_email"  style="width:200px;"/></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center; margin-top: 15px;">
								<input type="button" value="찾기" class="btn" style="background-color: green; width:100px; color:#fff; height: 50px;" id="pw_btn" onclick=""/> 
							</td>
						</tr>
					</table>
				</form>
					</td>
				</tr>
			</table>
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
