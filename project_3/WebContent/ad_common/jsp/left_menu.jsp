<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#menu").menu();
	});
</script>

<style>
.ui-menu {width: 150px;}
</style>

<ul id="menu">
			<li><div><a href="/mybatis_prj/day0220/single_column.jsp">컬럼 하나 한행 조회</a></div></li>
			<li><div><a href="/mybatis_prj/day0220/multi_column.jsp">컬럼 여러개 한행 조회</a></div></li>
			<li><div><a href="/mybatis_prj/day0220/single_row.jsp">컬럼 하나 여러행 조회</a></div></li>
			<li><div><a href="/mybatis_prj/day0220/multi_row.jsp">컬럼 여러개 여러행 조회</a></div></li>
			<li><div><a href="/mybatis_prj/day0221/less_than.jsp">작다비교</a></div></li>
			<li><div><a href="/mybatis_prj/day0221/greater_than.jsp">크다비교</a></div></li>
			<li><div><a href="/mybatis_prj/day0221/like.jsp">like사용</a></div></li>
			<li><div><a href="/mybatis_prj/day0221/subquery.jsp">subquery</a></div></li>
			<li><div><a href="/mybatis_prj/day0221/join.jsp">join</a></div></li>
			<li><div><a href="/mybatis_prj/day0222/join_subquery.jsp">subquery + join</a></div></li>
			<li><div><a href="/mybatis_prj/day0222/change_table.jsp">테이블명이 변경</a></div></li>
			<li><div><a href="/mybatis_prj/day0222/test_if.jsp">dynamic query1</a></div></li>
			<li><div><a href="/mybatis_prj/day0222/choose.jsp">dynamic query2</a></div></li>
			<li><div><a href="/mybatis_prj/day0223/foreach.jsp">dynamic query3</a></div></li>
			<li><div><a href="/mybatis_prj/day0223/insert_proc.jsp">procedure1</a></div></li>
		    <li><div><a href="/mybatis_prj/day0223/select_proc.jsp">procedure2</a></div></li>
</ul>