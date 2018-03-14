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
    
    <!-- CSS 줄때 화면 -->
    <link href="commons/css/main.css" rel="stylesheet">
   <!--  <style type="text/css">
    	#button{border:1px solid #EDEDED; background-color: #FFFFFF; width: 287px; height: 100px; margin-right: -3px; margin-left: -3px;}
    	#back-header{background-color: #fff; }	
    	#logo-button  { width: 1140px; margin: 0 auto;  }
    	.main-img{height: 600px;  margin: 0 auto;}
    	.img_div{ border: 1px solid #EDEDED; width: 285px; height: 250px;}
    	.line{ border : 1px solid #EDEDED ; width: 1140px; height: 50px; margin: 0 auto;}
    	.notice{border : 1px solid #EDEDED ; width: 570px; height: 250px }
    	.contain{margin-top: 50px;margin-bottom: 50px; }
    	body{min-width: 1200px;}
    </style> -->
    
    <script type="text/javascript">
    	function mu(){
    		var radio = document.getElementsByName('pay_value');
    		for(var i =0; i<radio.length; i++){
    			if(radio[i].checked){
    				var method = radio[i].value;
    			}
    		}
    		window.open("deposit_without_passbook.do?method="+method,"passbook","width=500,height=300,top="+(window.screenY+120)+",left="+(window.screenX+220));
    	}
    </script>
    
    <!-- CDN -->    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <c:import url="../common.jsp"/>
    
     <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    
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
    	<div id="test_top" style="max-width: 1300px; margin: 0px auto;" >
	  		<div style="background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">ID/PW 찾기</div>
			<div style="background-color: #cd493c; width: 100%;  height: 150px; "></div>
		</div>
		<div id="test_center" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="온라인 예매" onclick="loginAccess()"></div>
		  			<div><input type="button" class="button2" value="예매내역 확인" onclick="joinAccess()"></div>
			    </form>
	  		</div>
			<div class="ticket_value" style=" width: 100%;  min-height: 700px; ">
				<table style="border: 1px solid #333; margin: 0px auto">
					<tr>
						<td>
							<div id="ticket" class="ticket_value" style="width:680px; height:490px; background-color:blue;">
								<h3 style="width:200px; text-align:center; margin-top:5px; margin-left:5px;">입장권</h3>
								<table style="width:680px; margin-top:10px; margin-left:10px; margin:0px auto;background-color:white; position:absolute;">
									<tr>
										<td rowspan="3" style="width:350px; height:250px;"><img src="commons/images/jr.png"/></td>
										<td style="height:50px;"><h4 >설명1</h4></td>
									</tr>
									<tr>
										<td style="height:50px;"><h4>설명2</h4></td>
									</tr>
									<tr>
										<td style="height:50px;"><h4>설명3</h4></td>
									</tr>
									<tr style="height:200px;">
										<td colspan="2">
											<div class="date_cnt" style="width:250px; margin-left:110px;">
												<input type="date" class="date_cnt"/>
												<select name="ticket_cnt" class="date_cnt" style="margin-left:10px;">
													<% for(int i=0; i<=20; i++){
														int cnt=+i;
													%>
														<option value="<%=cnt%>"><%=cnt%></option>
													<%}%>
												</select><strong>매</strong>
											</div>
											<div style="position:relative; border:1px solid; width:200px; height:100px; margin-left:400px;">
												<h6 style="background-color: #FFFFFF;position: absolute;top: -12px;left: 15px"> 결제방법</h6>
												<input type="radio" name="pay_value" value="deposit_without_passbook" style="margin-top:20px; margin-left:5px;" />무통장입금&nbsp;&nbsp;
												<input type="radio" name="pay_value" value="deposit_virtual_account"/>가상계좌<br/><br/>
												<input type="radio" name="pay_value" value="deposit_with_card" style="margin-left:5px;"/>신용카드&nbsp;&nbsp;
												<input type="radio" name="pay_value" value="deposit_with_phone"/>휴대폰 결제
											</div>
										</td>
									</tr>
								</table>
							</div>
							<input type="button" value="결제하기" style="float:right; margin-top:5px;" onclick="mu()"/>
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
