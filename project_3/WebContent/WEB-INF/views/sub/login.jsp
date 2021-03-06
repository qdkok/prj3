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
		.tt tr td{border: 15px solid #fff; }
	</style>

    <script type="text/javascript">
     $(function(){
    	var obj=document.frm;
    	var logint_obj=document.login_frm;
    	  	
    	$("#loginBtn").click(function(){
    		logint_obj.action="login.do";
    		logint_obj.submit();
    	});
    }); 
     
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
	<%
		String name=(String)session.getAttribute("name");
		if(!"".equals(name)&&name!=null){
			out.print("<script>location.href='http://localhost:8080/project_3/index.do'</script>");
		}else if("".equals(name)){
			out.print("<script>alert('로그인에 실패하셨습니다.')</script>");
			session.invalidate();
		}
	%>  
  	<header>
	  		<!-- nav바 -->
	  		<c:import url="../../../commons/menu/menu_nav.jsp"/>
	  		<!-- 메뉴버튼바 -->
	  		<c:import url="../../../commons/menu/menu_btn.jsp"/>
	  		
  	</header>
    <!-- Page Content -->
    <div class="contain" >
    	<div id="test_top" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">로그인</div>
			<div style=" width: 100%;  height: 150px; background-color: #cd493c;"></div>
		</div>
		<div id="test_center" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="로그인" onclick="loginAccess()"></div>
		  			<div><input type="button" class="button2" value="회원가입" onclick="joinAccess()"></div>
		  			<div><input type="button" class="button2" value="ID/PASS 찾기" onclick="searchIDAccess()"></div>
			    </form>
	  		</div>
			<div style=" width: 100%;  height: 800px; padding-top: 50px;">
				<form name="login_frm" method="post">
					<table class="tt" style="margin: 0px auto; border: 2px solid #ededed;">
						<tr >
							<td colspan="3" style="text-align: center; font-size: 30px; font-weight: bold;">
								<img src="http://localhost:8080/project_3/commons/images/HKlogo.png" width="250px;" onclick="#" />
							</td>
						</tr>
						<tr>
							<td style="text-align: center;" width="80px;">ID</td>
							<td colspan="2"><input type="text" name="id"  style="width:200px;"/></td>
						</tr>
						<tr>
							<td style="text-align: center;" >PW</td>
							<td colspan="2"><input type="password" name="pw"  style="width:200px;"/></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center; margin-top: 15px;">
								<input type="button" class="btn" value="로그인" id="loginBtn"/>
								<input type="button" class="btn" value="회원가입" onclick="location.replace('join_terms.do')"/>
								<input type="button" class="btn" value="ID/PW 찾기" onclick="location.replace('searchId.do')"/>
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
