<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<div id="loginBox">
	<form id="frm" action="" method="post">
    <table>
      <tr>
         <td><input type="text" name="id" class="inputBox" id="id" style="width:195px; height:32px;" placeholder="아이디"/></td>
         <td rowspan="2">
        	<input type="button" value="로그인" class="btn" id="btnLogin" style="width:78px; height:66px; margin-left:5px;"/>
         </td>
      </tr>
      <tr>
         <td><input type="password" name="passwd" id="passwd" class="inputBox" style="width:195px; height:32px; margin-top:2px;" placeholder="비밀번호"/></td>
      </tr>
    </table>
    </form>
    <div id="findInfo">
    	<a href="">아이디찾기</a> / <a href="">비밀번호찾기</a>
    </div>
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
	    	<li class="menu_title"><a href="mgr_profit.do">매출현황</a></li>
	    </ul>
    </div>