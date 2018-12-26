<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>head</title>
</head>

<script>
function index(){
	window.location.href = "${ctx}/article/init";
}
</script>

<body>
<header id="header-web">
	<div class="header-main">	
	<a href="./index.jsp" class="logo"><img src="../static/resources/images/logo.png" align="logo"/></a>
		<nav class="header-nav">
			<div>
				<ul>
					<li><a href="javascript:void(0)" onclick="index()">首页</a></li>
					<li><a href="">文档</a></li>
					<li><a href="">时间轴</a></li>
					<li><a href="">联系我${total}</a></li>
				</ul>
			</div>
		</nav>
		<form method="get" class="search" action="./utils/search.html" >
	      <input class="text" type="text" name="word" placeholder="搜索">
	    </form>
    </div>
</header>
</body>
</html>