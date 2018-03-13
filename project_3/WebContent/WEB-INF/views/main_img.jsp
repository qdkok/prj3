<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
    


<!-- coin  -->
<script type="text/javascript" src="commons/css/js/coin/coin-slider.js"></script>
<link rel="stylesheet" type="text/css" href="commons/css/js/coin/coin-slider-styles.css" />	

<script type="text/javascript">
	$(document).ready(function() {
  	    $('#coin-slider').coinslider({width: 1903,height: 600, navigation: true, delay: 1000, opacity: 0.7, effect: 'random'}); 
  	  																													// random, swirl, rain, straight
 	 });
</script>

<div id='coin-slider'>    
	<img src="commons/images/img1.PNG" style="width: 1903px ; height: 600px; margin: 0 auto;">
	<img src="commons/images/img2.PNG" style="width: 1903px ; height: 600px;  margin: 0 auto">
	<img src="commons/images/img3.PNG" style="width: 1903px ; height: 600px;  margin: 0 auto">
</div>	