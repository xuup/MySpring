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
		
		$("#addCategory").bind("click",function(){
			$("#myModalAdd").modal();
		});
		
		$("#btn_add").bind("click",function(){
			$.ajax({
				url:"${ctx}/category/insertCategory",
				type:"post",
				dataType:"text",
				data:{
					"categoryName":$("#categoryName_add").val(),
					"categoryOrder":$("#categoryOrder_add").val()
				},
				success:function(res){
					$("#categoryTable").bootstrapTable('refresh');
				}
			});
		});
		
		$("#btn_update").bind("click", function(){
			$.ajax({
				url:"${ctx}/category/updateCategory",
				type:"post",
				dataType:"text",
				async:false,
				data:{
					"categoryId":$("#categoryId_edit").val(),
					"categoryName":$("#categoryName_edit").val(),
					"categoryOrder":$("#categoryOrder_edit").val()
				},
				success:function(res){
					$("#categoryTable").bootstrapTable('refresh');
				}
			});
		});
		
	});
	
	var TableInit = function(){
		var otableInit = new Object();
		
		otableInit.init = function(){
			var urlStr = "${ctx}/category/listCategory";
			$("#categoryTable").bootstrapTable({
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
					field:"categoryId",
					title:"id"
				},{
					field:"categoryName",
					title:"标签名"
				},{
					field:"categoryId",
					title:"操作",
					formatter:function(value,row,index){
	                    var element = 
	                    '<a class="edit" onclick="editById('+value+')" data-id="'+row.id +'">编辑</a> ' + 
	                    '<a class="edit" onclick="viewById('+value+')" data-id="'+row.id +'">查看</a> ' +
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
	
	
	function viewById(categoryId){
		$.ajax({
			url:'${ctx}/category/getCategoryById',
			dataType:'json',
			method:'post',
			data:{
				categoryId:categoryId
			},
			success:function(res){
				$("#categoryId_edit").val(res.categoryId);
				$("#categoryName_edit").val(res.categoryName);
				$("#categoryOrder_edit").val(res.categoryOrder);
				
				
				$("#myModalLabelEdit").text("查看");
				$("#myModalEdit input,#btn_update").attr("disabled",true);
				//$("#btn_update").attr("disabled",true);
				$("#myModalEdit").modal("show");
			}
		});
	}
	
	
	function editById(categoryId){
		$.ajax({
			url:'${ctx}/category/getCategoryById',
			dataType:'json',
			method:'post',
			data:{
				categoryId:categoryId
			},
			success:function(res){
				$("#categoryId_edit").val(res.categoryId);
				$("#categoryName_edit").val(res.categoryName);
				$("#categoryOrder_edit").val(res.categoryOrder);
				
				
				$("#myModalLabelEdit").text("编辑");
				$("#myModalEdit").modal("show");
			}
		});
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
	                   <input class="btn btn-default" type="button" id="addCategory" value="新增" style="margin-left:6px">
	                </div>
	                <div class="row" style="margin-left:250px">
						<table class="table" id="categoryTable">
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 弹出框  新增-->
		<div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabelAdd">
	     	<div class="modal-dialog" role="document">
	     		<div class="modal-content">
	     			<div class="modal-header">
	     				<h4 class="modal-title" id="myModalLabelAdd">新增</h4>
	     			</div>
	     			<div class="modal-body">
	     				<div class="form-group">
	                         <label for="txt_departmentname">标签名称</label>
	                         <input type="text" name="categoryName" id="categoryName_add" class="form-control">
	                     </div>
	                     <div class="form-group">
	                        <label for="txt_parentdepartment">排序号</label>
	                        <input type="text" name="categoryOrder_add" id="categoryOrder_add" class="form-control">
	                     </div>
	     			</div>
	     			<div class="modal-footer">
	                     <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	                     <button type="button" id="btn_add" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
	                </div>
	     		</div>
	     	</div>
     	</div>
     	
     	<!-- 弹出框 编辑 -->
     	<div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabelEdit">
	     	<div class="modal-dialog" role="document">
	     		<div class="modal-content">
	     			<div class="modal-header">
	     				<h4 class="modal-title" id="myModalLabelAdd">编辑</h4>
	     			</div>
	     			<div class="modal-body">
	     				<input type="hidden" name="categoryId_edit" id="categoryId_edit"/>
	     				<div class="form-group">
	                         <label for="txt_departmentname">标签名称</label>
	                         <input type="text" name="categoryName_edit" id="categoryName_edit" class="form-control">
	                     </div>
	                     <div class="form-group">
	                        <label for="txt_parentdepartment">排序号</label>
	                        <input type="text" name="categoryOrder_edit" id="categoryOrder_edit" class="form-control">
	                     </div>
	     			</div>
	     			<div class="modal-footer">
	                     <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	                     <button type="button" id="btn_update" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
	                </div>
	     		</div>
	     	</div>
     	</div>
		
</div>

</body>
</html>