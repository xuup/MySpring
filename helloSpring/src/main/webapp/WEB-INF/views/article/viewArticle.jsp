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

</head>

<script>
	$(document).ready(function(){
		 CKEDITOR.replace( 'editor1', {
            language: 'zh',
            uiColor: '#9AB8F3'
         });
		 console.log($("#hidenContext").val());
		 CKEDITOR.instances.editor1.setData( $("#hidenContext").val(), {
			    callback: function() {
			        this.checkDirty(); // true
			    }
			} );
		
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


<form id="reg_form" action="#">
<div class="container">
	<div class="row">
		<div class="col-sm-3">
			<ul class="nav nav-list">
                <li><a href="${ctx}/user/listUser">用户列表</a></li>
                <li><a href="${ctx}/article/listArticle">文章列表</a></li>
                <li><a href="#">Practice Editor </a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
		</div>	
		
		<div class="col-sm-8">
			<div class="form-group">
				<h1>
					${article.title}
				</h1>
			</div>
			<div>
				<p>
					${article.context}
				</p>
			</div>
			
			<div>
				<input class="btn btn-default" type="button" name="saveArti" id="saveArti" value="保存">
			</div>
		</div>
		
	</div>
</div>
</form>

</body>
</html>