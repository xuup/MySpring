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
	$(document).ready(function(){
		console.log("-----");
		
		
		$("#cocoTable").bootstrapTable({
			url:"${ctx}/cocoTest/list",
			cache: false,
			dataField:"rows",
			dataType:"json",
			method:"post",
			contentType : "application/x-www-form-urlencoded",
			striped: true,
			pagination: true, // 在表格底部显示分页组件，默认false
	      	pageNumber: 1, 
	      	pageList: [2, 5], // 设置页面可以显示的数据条数
	     	pageSize: 4, // 页面数据条数
			sidePagination: "server",
			
			queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求

		         var param = {
	        		 limit: params.limit,   //页面大小
                     offset: params.offset,  //页码	
				 }
			
				 return param;
		    },
			
			responseHandler: function(res) {
		         return {
		            "total": res.total,//总页数
		            "rows": res.rows   //数据
		         };
		    },
			columns:[{
				field:"id",
				title:"#"
			},{
				field:"wareId",
				title:"wareId"
			},{
				field:"picPath",
				title:"picPath"
			},{
				field:"id",
				title:"operation",
			 	formatter:function(value,row,index){
                    var element = 
                    "<a class='edit' onclick='editViewById("+value+")' data-id='"+row.id +"'>编辑</a> " + 
                    "<a class='delet' data-id='"+row.id +"'>删除</a> ";
                    return element;  
                } 
			}],
		 	onLoadSuccess: function(){  //加载成功时执行
	         	   console.info("加载成功");
	      	},
	      	onLoadError: function(){  //加载失败时执行
	           	 console.info("加载数据失败");
	      	}

		});
		
		
		
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
                <li><a href="#">Home</a></li>
                <li class="active"><a href="#">Tutorials</a></li>
                <li><a href="#">Practice Editor </a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
		</div>
		
		<div class="col-sm-8">
			<h1>你好，世界！${ctx }</h1>
			<div>
				<table class="table" id="cocoTable">
				</table>
			</div>
			
		</div>
		
	</div>
</div>

</form>


</body>
</html>