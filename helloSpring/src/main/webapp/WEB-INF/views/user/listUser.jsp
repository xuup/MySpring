<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<link href="${ctx}/static/resources/css/addUser.css" rel="stylesheet">
<link href="${ctx}/static/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
		initList();
		$("#btn_submit").click(function(){
			$.ajax({
				url:'${ctx}/user/updateUserById',
				type:"post",
				dataType:"json",
				data:{
					"id":$("#id").val(),
					"userName":$("#userName").val(),
					"password":$("#password").val(),
					"email":$("#email").val()
				},
				success:function(data){
					if(data == "success"){
						alert("update success");
					}else{
						alert("update error");
					}
					$("#userTable").bootstrapTable('refresh');
				}
			});
		});
		
		
		$("#searchUser").bind("click",function(){
			var name = $("#searchName").val();
			console.log(name);
			$("#userTable").bootstrapTable("refresh");
			
		});
		
		
		$("#addUser").bind("click",function(){
			$("#myModalAdd").modal();
		});
		
		$("#btn_add").bind("click",function(){
			$.ajax({
				url:"${ctx}/user/insertUser",
				type:"post",
				dataType:"json",
				data:{
					"userName":$("#userName_add").val(),
					"password":$("#password_add").val(),
					"email":$("#email_add").val()
				}
			});
			$("#userTable").bootstrapTable('refresh');
		})
		
	});
	
	
	function initList(){
		
		console.log("init list-------");
		
		$("#userTable").bootstrapTable({
			url:"${ctx}/user/searchUser",
			cache: false,
			dataField:"rows",
			dataType:"json",
			method:"post",
			contentType : "application/x-www-form-urlencoded",
			striped: true,
			pagination: true, // 在表格底部显示分页组件，默认false
	      	pageNumber: 1, 
	      	pageList: [2,5,10], // 设置页面可以显示的数据条数
	     	pageSize: 10, // 页面数据条数
			sidePagination: "server",
			
			queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求

		         var param = {
	        		 limit: params.limit,   //页面大小
                     offset: params.offset,  //页码	
                     userName:$("#searchName").val()
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
				field:"userName",
				title:"userName"
			},{
				field:"password",
				title:"password"
			},{
				field:"id",
				title:"operation",
			 	formatter:function(value,row,index){
                    var element = 
                    '<a class="edit" onclick="editViewById('+value+')" data-id="'+row.id +'">编辑</a> ' + 
                    "<a class='edit' onclick='editViewById("+value+",'view')' data-id='"+row.id +"'>查看</a> " +
                    '<a class="delet" onclick="deleteById('+value+')" data-id="'+row.id +'">删除</a> ';
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
	}
	
	
	function editViewById(data, type){
		console.log("data:"+ data+",type="+ type);
		
		$.ajax({
			url:'${ctx}/user/getUserById',
			type:'post',
			async:true,
			dataTyoe:'json',
			data:{
				"data":data
			},
			success:function(res){
				
				//为弹出框赋值 
				$("#id").val(res.id);
				$("#userName").val(res.userName);
				$("#password").val(res.password);
				$("#email").val(res.email);
				$("isActive").val(res.val);
				
				
				$("#myModalLabel").text("新增");
				$('#myModal').modal();
			},
			error:function(){
				alert("请求失败");
			}
		});
		
		 
		//window.location.href = "${ctx}/cocoTest/edit?id="+data+"&type="+type;
	}
	
	function deleteById(data){
		console.log("---"+data+"---");
		$.ajax({
			url:"${ctx}/user/deleteUserById",
			data:{
				"id":data
			},
			dataType:"json",
			method:"post",
			async:false,
			success:function(data){
				if(data == "ok"){
					alert("删除成功!");
					$("#userTable").bootstrapTable('refresh');
				}
			}
		});
		$("#userTable").bootstrapTable('refresh');
	}
	
	
</script>

<body>

<!-- WRAPPER -->
	<div id="wrapper">
		<c:import url="../base/top.jsp"></c:import>
	</div>
	
	
	<div class="main">
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">Tables</h3>
				<div>
					<div class="form-group" style="margin-left:300px;margin-top:65px;">
	                   <label for="txt_departmentname">用户名称</label>
	                   <input type="text" name="userName" id="searchName" class="form-control" style="width: 37%;/* float: left; */display: inline-block;margin-left: 18px;">
	                   <input class="btn btn-default" type="button" id="searchUser" value="查找" style="margin-left:6px">
	                   <input class="btn btn-default" type="button" id="addUser" value="新增" style="margin-left:6px">
	                </div>
				</div>
				<div class="row" style="margin-left:250px">
					<table class="table" id="userTable">
					</table>
				</div>
			</div>
		</div>
	</div>
	
				
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                     <h4 class="modal-title" id="myModalLabel">编辑</h4>
                 </div>
                 <div class="modal-body">
					<input type="hidden" name="id" id="id"/>
                    <div class="form-group">
                        <label for="txt_departmentname">用户名称</label>
                        <input type="text" name="userName" id="userName" class="form-control">
                    </div>
                    <div class="form-group">
                       <label for="txt_parentdepartment">用户密码</label>
                       <input type="text" name="password" id="password" class="form-control">
                   </div>
                    <div class="form-group">
                       <label for="txt_departmentlevel">邮箱</label>
                       <input type="text" name="email" id="email" class="form-control">
                   </div>
                    <div class="form-group">
                        <label for="txt_statu">是否激活</label>
                        <label class="radio-inline">
				        <input type="radio" name="isActive" id="isActive_1" value="1"> 激活
				    </label>
				    <label class="radio-inline">
				        <input type="radio" name="isActive" id="isActive_0"  value="0"> 停用
				    </label>
                    </div>
                </div>
               <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                </div>
            </div>
       </div>
    </div>
		     
     <div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabelAdd">
     	<div class="modal-dialog" role="document">
     		<div class="modal-content">
     			<div class="modal-header">
     				<h4 class="modal-title" id="myModalLabelAdd">新增</h4>
     			</div>
     			<div class="modal-body">
     				<div class="form-group">
                         <label for="txt_departmentname">用户名称</label>
                         <input type="text" name="userName" id="userName_add" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="txt_parentdepartment">用户密码</label>
                        <input type="text" name="password" id="password_add" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="txt_departmentlevel">邮箱</label>
                        <input type="text" name="email" id="email_add" class="form-control">
                     </div>
                     <div class="form-group">
                         <label for="txt_statu">是否激活</label>
                         <label class="radio-inline">
					        <input type="radio" name="isActive" id="isActive_1" value="1"> 激活
					     </label>
					     <label class="radio-inline">
					        <input type="radio" name="isActive" id="isActive_0"  value="0"> 停用
					     </label>
                     </div>
     			</div>
     			<div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                     <button type="button" id="btn_add" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                </div>
     		</div>
     	</div>
     </div>
				
			</div>
		</div>
	
	</form>
	</div>
	

</html>