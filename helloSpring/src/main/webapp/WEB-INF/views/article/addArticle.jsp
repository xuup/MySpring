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

<link href="${ctx}/static/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/resources/bootstrap/css/bootstrap-table.min.css" rel="stylesheet">

<script src="${ctx}/static/resources/js/jquery-1.9.1.js"></script>
<script src="${ctx}/static/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/static/resources/bootstrap/js/bootstrap-table.min.js"></script>

<script src="${ctx}/static/resources/ckeditor/ckeditor.js"></script>


<link rel="stylesheet" href="${ctx}/static/resources/vendor/linearicons/style.css">
<link rel="stylesheet" href="${ctx}/static/resources/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="${ctx}/static/resources/css/main.css">

<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76" href="${ctx}/static/resources/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="${ctx}/static/resources/img/favicon.png">

</head>

<script>
	$(document).ready(function(){
		 CKEDITOR.replace( 'editor1', {
            language: 'zh',
            uiColor: '#9AB8F3'
         });
		
		
		$("#addArticle").bind("click",function(){
			window.location.href = "${ctx}/context/addContext";
		});
		
		$("#saveArti").bind("click",saveArticle);
		
	});
	
	function saveArticle(){
		var data = CKEDITOR.instances.editor1.getData();
		console.log("data:" + data);
		$.ajax({
			url:'${ctx}/article/saveArticle',
			data:{
				"title":$("#title").val(),
				"context":data
			},
			method:"post",
			success:function(){
				alert("save success");
			}
			
		});
	}
	
</script>

<body>


<div id="wrapper">
		<c:import url="../base/top.jsp"></c:import>
</div>

<div class="main">
		<div class="main-content">
			<div class="container-fluid">
				<div style="margin-left:300px">
					<div class="form-group">
						<label for="title" style="margin-top:103px;">title</label>
		    			<input type="text" class="form-control" id="title" placeholder="title" style="width:43%;display:inline-block">
					</div>
					<div>
						<h1></h1>
					    <textarea name="editor1" id="editor1" rows="10" cols="20">
					    </textarea>
					</div>
					
					<div>
						<label>选择标签</label>
					</div>
					
					<div>
						<input class="btn btn-default" type="button" name="saveArti" id="saveArti" value="保存">
					</div>
				</div>
			</div>
		</div>
</div>

</body>
</html>