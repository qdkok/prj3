<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="loginBox">
	<c:if test="${ sessionScope.a_id ne null }">
		<strong>${ sessionScope.a_id } ( ${ sessionScope.a_name } ) </strong><br>관리자님 환영합니다!<br>
		<div id="logoutBox"><input type="button" class="btn" id="btnLogout" value="로그아웃" onClick="location.href='ad_logout.do';"></div>
	</c:if>
</div>
    <!-- 회원관리, 공지사항관리, 이벤트관리, 쿠폰관리, 분실물관리, 고객서비스관리, 이용권관리, 매출현황 -->
    <div id="menu_list">
	    <ul>
	    	<li class="menu_title"><a href="mgr_customer.do">회원관리</a></li>
	    	<li class="menu_title"><a href="mgr_notice.do">공지사항관리</a></li>
	    	<li class="menu_title"><a href="mgr_event.do">이벤트관리</a></li>
	 		<li class="menu_title"><a href="mgr_coupon.do">쿠폰관리</a></li>
	    	<li class="menu_title"><a href="mgr_lostArticle.do">분실물관리</a></li>
	    	<li class="menu_title"><a href="mgr_clientService.do">고객서비스관리</a></li>
	    	<li class="menu_title"><a href="mgr_voucher.do">이용권관리</a></li>
	    	<li class="menu_title"><a href="mgr_profit.do?d_year=2018">매출현황</a></li>
	    </ul>
    </div>