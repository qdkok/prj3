<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>

<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/commons/css/sm-simple/sm-simple.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- SmartMenus core CSS (required) -->
<link href="http://localhost:8080/project_3/commons/css/sm-core-css.css" rel="stylesheet" type="text/css" />

<!-- "sm-simple" menu theme (optional, you can use your own CSS, too) -->
<link href="http://localhost:8080/project_3/commons/css/sm-simple/sm-simple.css" rel="stylesheet" type="text/css" />

<!-- SmartMenus jQuery plugin -->
<script type="text/javascript" src="commons/css/js/smartmenus/jquery.smartmenus.js"></script>

<!-- SmartMenus jQuery init -->
<script type="text/javascript">
	$(function() {
		$('#main-menu').smartmenus({
			subMenusSubOffsetX: 1,
			subMenusSubOffsetY: -8
		});
	});
</script>