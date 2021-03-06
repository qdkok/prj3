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
    <!-- <style type="text/css">
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
    
    <!-- CDN -->    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <c:import url="../common.jsp"/>
    <script type="text/javascript">
    	function detailUtilize(u_no){
    		$("[name='u_no']").val(u_no);
    		
    		document.ticketFrm.submit();
    	}
    	
    	function reservation(){
	    	location.href='sub_menu_ticket_value.do';
	    }
	    function reservation_process(){
	    	location.href='reservation_process.do';
	    }
    </script>
     <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <style type="text/css">
   		.ticket_value tr{
   			margin: 10px;
   		}
   </style>
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
    	<div id="test_top" style="max-width: 1300px; margin: 0px auto; " >
	  		<div style="background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">ID/PW 찾기</div>
			<div style="background-color: #cd493c; width: 100%;  height: 150px; "></div>
		</div>
		<div id="test_center" style="max-width: 1300px; min-height:800px; margin: 0px auto;" >
	  		<div style="width: 250px; min-height: 800px; float: left;">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="온라인 예매" onclick="reservation()"></div>
		  			<div><input type="button" class="button2" value="예매내역 확인" onclick="reservation_process()"></div>
			    </form>
	  		</div>
	  		<div style="width: 1000px; min-height: 800px; border: 2px solid #ededed; float: left; padding-top: 50px;">
	  			<form name="ticketFrm"  method="get" action="sub_menu_ticket_reservation.do">
	  				<input name="u_no" type="hidden"/> 
	  			</form>
	  			<c:forEach var="ticket" items="${ticket }">
					<div id="ticket" class="ticket_value" style="min-width:450px; min-height:200px; float: left;margin: 10px; border: 2px solid #ededed; padding-top: 20px;">
							<h3 style="width:180px; text-align:center; ">${ticket.u_name }</h3>
							<table style="width:450px; margin: 10px;">
								<tr>
									<td rowspan="4" ><img src="http://localhost:8080/project_3/uplioad/voucher/${ticket.u_image}" style="width:200px; height:200px;"/></td>
									<td>가격 : ${ticket.price} 원</td>
								</tr>
								<tr>
									<td>설명 : ${ticket.info}</td>
								</tr>
								<tr>
									<td align="right" style="margin: 20px;">
										<input type="button" class="btn" value="예매하기" onclick="detailUtilize('${ticket.u_no}')"/>
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
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
