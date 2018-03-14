<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    
<div>
	    <!-- Navigation -->
	    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	      <div class="container">
	        <a class="navbar-brand" href="index.do">HKLAND</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	          <%
					String name=(String)session.getAttribute("name");
	          		if(!"".equals(name)&&name!=null){
	          %>
		          <ul class="navbar-nav ml-auto">
		            <li class="nav-item active">
		              <a class="nav-link" href="logout.do">로그아웃
		                <span class="sr-only">(current)</span>
		              </a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="">예매내역확인</a>
		            </li>
		          </ul>
		         <%
	          		}else{
		         %>
		          <ul class="navbar-nav ml-auto">
		            <li class="nav-item active">
		              <a class="nav-link" href="login.do">로그인
		                <span class="sr-only">(current)</span>
		              </a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="join_terms.do">회원가입</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="searchId.do">ID/PASS 찾기</a>
		            </li>
		          </ul>
		          <%
	          		}
		          %>
	        </div>
	      </div>
	    </nav>
</div>