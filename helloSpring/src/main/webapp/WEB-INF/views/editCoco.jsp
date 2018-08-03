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
<link href="${ctx}/static/resources/bootstrap/css/bootstrap-table.min.css" rel="stylesheet">

<script src="${ctx}/static/resources/js/jquery-1.9.1.js"></script>
<script src="${ctx}/static/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/static/resources/bootstrap/js/bootstrap-table.min.js"></script>


</head>

<script>
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

<div class="container">
	<div class="row">
		<div class="col-sm-3">
			<ul class="nav nav-list">
                <li><a href="#">Home</a></li>
                <li class="active"><a href="#">Tutorials</a></li>
                <li><a href="#">Practice Editor </a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
		</div>
		
		<div class="col-sm-8">
		<form id="updateForm" action="${ctx}/cocoTest/update">
			<h1>你好，世界！${ctx }</h1>
			<div class="row reg_form">
				<div class="col-sm-4">
					id
				</div>
				<div class="col-sm-4">
					<input type="text" name="id" id="id" class="form-control" value="${cocoDto.id}"/>
				</div>
			</div>
			<div class="row reg_form">
				<div class="col-sm-4">
					wareId
				</div>
				<div class="col-sm-4">
					<input type="text" name="wareId" id="wareId" class="form-control" value="${cocoDto.wareId}"/>
				</div>
			</div>
			<div class="row reg_form">
				<div class="col-sm-4">
					picPath
				</div>
				<div class="col-sm-4">
					<input type="text" name="picPath" id="picPath" class="form-control" value="${cocoDto.picPath}"/>
				</div>
			</div>
			
			<div>
				<input type="submit" name="updateBtn" id="updateBtn" class="btn" value="保存"/> 
			</div>
			</form>
		</div>
		
	</div>
</div>



</body>
</html>