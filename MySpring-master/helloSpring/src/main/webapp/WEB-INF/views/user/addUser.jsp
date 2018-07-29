<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<link href="${ctx}/static/resources/css/addUser.css" rel="stylesheet">
<link href="${ctx}/static/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="${ctx}/static/resources/js/jquery-1.8.3.js"></script>

</head>

<script>
	$(document).ready(function(){
		console.log("-----");
		
		$("#regin").bind("click",function(){
			$.ajax({
				url:"${ctx}/user/insertUser2",
				type:"post",
				dataType:"json",
				method:"post",
				data:$("reg_form").serialize(),
				success:function(data){
					alert("add success");
				},
				error:function(data){
					console.log(data);
					alert("add fail"+data);
				}
				
			});
		});
		
	});
</script>

<body>

<div class="blog-masthead">
     <div class="container">
       <nav class="blog-nav">
         <a class="blog-nav-item active" href="#">Home</a>
         <a class="blog-nav-item" href="#">New features</a>
         <a class="blog-nav-item" href="#">Press</a>
         <a class="blog-nav-item" href="#">New hires</a>
         <a class="blog-nav-item" href="#">About</a>
       </nav>
     </div>
   </div>

<form id="reg_form" action="#">
<div class="container">
	<div class="row">
		<div class="col-sm-3">
			<ul class="nav nav-list">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Tutorials</a></li>
                <li><a href="#">Practice Editor </a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
		</div>
		
		<div class="col-sm-8">
			<h1>你好，世界！${ctx }11</h1>
			<h2>${context }</h2>
			<div class="row reg_form">
				<div class="col-sm-4">
					用户名
				</div>
				<div class="col-sm-4">
					<input type="text" name="userName" id="userName" class="form-control"/>
				</div>
			</div>
			<div class="row reg_form">
				<div class="col-sm-4">
					密码
				</div>
				<div class="col-sm-4">
					<input type="text" name="password" id="password" class="form-control"/>
				</div>
			</div>
			
			<div class="row reg_form">
				<div class="col-sm-4">
					姓
				</div>
				<div class="col-sm-4">
					<input type="text" name="firstName" id="firstName" class="form-control"/>
				</div>
			</div>
			
			<div class="row reg_form">
				<div class="col-sm-4">
					名
				</div>
				<div class="col-sm-4">
					<input type="text" name="secondName" id="secondName" class="form-control"/>
				</div>
			</div>
			
			<div class="row reg_form">
				<div class="col-sm-4">
					电子邮箱
				</div>
				<div class="col-sm-4">
					<input type="text" name="email" id="email" class="form-control"/>
				</div>
			</div>
			
			
			<button id="regin" name="regin" class="btn btn-lg btn-primary btn-block">Sign in</button>
			
		</div>
		
	</div>
</div>

</form>




</body>
</html>