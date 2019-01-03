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


<link rel="stylesheet" href="${ctx}/static/resources/vendor/linearicons/style.css">
<link rel="stylesheet" href="${ctx}/static/resources/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="${ctx}/static/resources/css/main.css">

<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76" href="${ctx}/static/resources/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="${ctx}/static/resources/img/favicon.png">

<script src="${ctx}/static/resources/js/jquery-1.9.1.js"></script>
<script src="${ctx}/static/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/static/resources/bootstrap/js/bootstrap-table.min.js"></script>

</head>

<script>
	$(document).ready(function(){
		var oTable = new TableInit();
		oTable.init();
		
		
		$("#searchTitle").bind("click",function(){
			$('#articleTable').bootstrapTable('refresh');
		});
		
		$("#addArticle").bind("click",function(){
			window.location.href = "${ctx}/article/addArticle";
		});
	});
	
	var TableInit = function(){
		var otableInit = new Object();
		
		otableInit.init = function(){
			var urlStr = "${ctx}/article/searchArticle";
			$("#articleTable").bootstrapTable({
				url:urlStr,
				cache: false,
				dataField:"rows",
				dataType:"json",
				method:"post",
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				queryParams:queryParams,
				striped: true,
				pagination: true, // 在表格底部显示分页组件，默认false
		      	pageNumber: 1, 
		      	pageList: [2,5,10], // 设置页面可以显示的数据条数
		     	pageSize: 10, // 页面数据条数
				sidePagination: "server",
				columns:[{
					field:"id",
					title:"id"
				},{
					field:"title",
					title:"题目"
				},{
					field:"remark",
					title:"文章内容"
				},{
					field:"id",
					title:"操作",
					formatter:function(value,row,index){
	                    var element = 
	                    '<a class="edit" onclick="editViewById('+value+',true)" data-id="'+row.id +'">编辑</a> ' + 
	                    "<a class='edit' onclick='editViewById("+value+",false)' data-id='"+row.id +"'>查看</a> " +
	                    '<a class="delet" onclick="deleteById('+value+')" data-id="'+row.id +'">删除</a> ';
	                    return element;  
	                },
	                width:124
				}]
			});
		};
		
		
		//query param
		function queryParams(params){
			var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的

	            limit: params.limit,   //页面大小
	
	            offset: params.offset,  //偏移量
	
	            title: $("#titleCon").val()
	
	        };
			return temp;
		};
		
		return otableInit;
	}
	
	
	function editViewById(id,isEdit){
		window.location.href = "${ctx}/article/editViewById?id=" + id + "&isEdit=" + isEdit;
	}
	
</script>

<body>

<div id="wrapper">
		<c:import url="../base/top.jsp"></c:import>
</div>

<div class="main">
		<div class="main-content">
			<div class="container-fluid">
				<div>
					<div class="form-group" style="margin-top:93px">
	                   <label for="txt_departmentname">文章名称</label>
	                   <input type="text" name="titleCon" id="titleCon" class="form-control" style="width: 37%;/* float: left; */display: inline-block;margin-left: 187px;">
	                   <input class="btn btn-default" type="button" id="searchTitle" value="查找" style="margin-left:6px">
	                   <input class="btn btn-default" type="button" id="addArticle" value="新增" style="margin-left:6px">
	                </div>
	                <div class="row" style="margin-left:250px">
						<table class="table" id="articleTable">
						</table>
					</div>
				</div>
			</div>
		</div>
</div>

</body>
</html>