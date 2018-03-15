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
    <style type="text/css">
	    #test_center table td{
	   		margin: 20px; 
	   	}
    </style>
    <script type="text/javascript">
    	function mu(name,id,u_no){
    		if(name!='null'){
    			var cnt =$('[name=ticket_cnt]').val();
    			if(confirm(id+'님'+cnt+'매 '+cnt*${ticket.price}+'(권 당'+${ticket.price}+')원 입니다. \n예매하시겠습니까?')){
	    			$('[name=id]').val(id);
	    			$('[name=u_no]').val(u_no);
	    			document.reservation.submit();
    			}//end if
    				
    		}else{
    			location.href='login.do';
    		}
    		
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
	  		<div style="background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">온라인 예매</div>
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
				<table style=" margin: 0px auto; border: 3px solid #ededed;">
					<tr>
						<td>
							<form action="reservation_process.do" method="post" name="reservation">
							<div id="ticket" class="ticket_value" style="min-width:500px; min-height:490px; margin: 30px;">
								<span style="width:200px; text-align:center; font-size: 45px; margin: 20px; font-weight: bold;">온라인 예매</span>
								<div style="min-width:500px; height:2px; background-color:#cd493c; ">
								</div>
								<table style="width:400px; background-color:white;">
									<tr>
										<td><img src="http://localhost:8080/project_3/uplioad/voucher/${ticket.u_image}" style="width:295px; height:295px; border: 5px solid #ededed; margin-top: 0px;"/></td>
										<td>
											<table style="width: 300px; min-height: 400px; margin-left: 30px; margin-top: 30px; " >
												<tr>
													<td style="height:20px;"><span style="font-size: 35px; font-weight: bold;">${ticket.u_name}</span></td>
												</tr>
												<tr>
													<td style="height:20px;"><span style="font-size: 25px; font-weight: bold; color:#cd493c;">${ticket.price}</span><span style="font-size: 15px; font-weight: bold;">원</span></td>
												</tr>
												<tr>
													<td style="min-height:50px;"><span style="font-size: 20px; margin-top: 20px; font-weight: bold;">이용권 설명</span><br/>
														<div style="width: 300px; height:150px; border: 2px solid #ededed;">
															<span style="font-size: 15px; ">${ticket.info}</span>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="date_cnt" style="width:100px; margin-top: 20px">
															<select name="ticket_cnt" class="date_cnt">
																<% for(int i=1; i<=20; i++){
																	int cnt=+i;
																%>
																	<option value="<%=cnt%>"><%=cnt%></option>
																<%}%>
															</select><strong>매</strong>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div style="position:relative; border:2px solid #ededed; width:300px; height:100px; text-align: center; margin-top: 20px">
															<h6 style="background-color: #FFFFFF;position: absolute;top: -12px;left: 15px"> 결제방법</h6>
															<input type="radio" name="pay_value" value="deposit_without_passbook" style="margin-top:20px; margin-left:5px;" checked="checked"/>무통장입금&nbsp;&nbsp;
															<input type="radio" name="pay_value" value="deposit_virtual_account"/>가상계좌<br/><br/>
															<input type="radio" name="pay_value" value="deposit_with_card" style="margin-left:5px;"/>신용카드&nbsp;&nbsp;
															<input type="radio" name="pay_value" value="deposit_with_phone"/>휴대폰 결제
														</div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
										</td>
										<td  align="left">
											<%
												String name=(String)session.getAttribute("name");
												String id=(String)session.getAttribute("id");
											%>  				
											<input type="hidden" name="id"/>
											<input type="hidden" name="u_no"/>
																
											<input type="button" value="예매하기"  class="btn" style="background-color: green; width: 300px; height: 50px; color: #fff; margin-left: 30px; font-weight:bold; font-size:20px; margin-top: 20px;" onclick="mu('<%=name%>','<%=id %>','${ticket.u_no}')"/>
										</td>
									</tr>
								</table>
							</div>
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
