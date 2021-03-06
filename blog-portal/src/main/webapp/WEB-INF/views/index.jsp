<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link rel='stylesheet' id='sytle-css'  href='../static/resources/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='gardenl-pc-css'  href='../static/resources/css/home.css' type='text/css' media='all' />
<link rel='stylesheet' id='gardenl-pc-css'  href='../static/resources/css/gardenl-pc.css' type='text/css' media='all' />
<link rel='stylesheet' id='gardenl-phone-css'  href='../static/resources/css/gardenl-phone.css' type='text/css' media='all' />
<script type='text/javascript' src='../static/resources/js/html5shiv.js'></script>
<script type='text/javascript' src='../static/resources/js/css3-mediaqueries.js'></script>
<script type='text/javascript' src='../static/resources/js/selectivizr-min.js'></script>
<script type='text/javascript' src='../static/resources/js/jquery.1.11.1.js'></script>

<!-- 分页 -->
<link rel='stylesheet' href='../static/resources/css/paging.css' type='text/css' media='all' />
<script type='text/javascript' src='../static/resources/js/page/paging.js'></script>

</head>


<script type="text/javascript">
	$(document).ready(function(){
		initArticle();
		initPageNumber();
		initLabels();
		initHotArticle();
	});
	
	function initArticle(){
		
		//清空之前的内容 
		$("#context").empty();
		
		$.ajax({
			url:'${ctx}/article/getArticle',
			method:"post",
			dataType:"json",
			data:{
				"limit":"3",
				"offSet":$("#curentPage").val()
			},
			success:function(res){
				console.log("加载成功");
				console.log(res);
				//动态生成文章内容 
				console.log(res.length);
				html = '';
				className = '';
				className1 = '';
				for(i=0;i<res.length;i++){
					console.log(i);
					if(i==0){
						beforehtml = "<a href='./contents/305/2306.html' target='_blank' class='iu'>25</a>";
						className = 'zaiyao';
						className1 = 'mecc';
					}else{
						beforehtml = '';
						className = 'zuiyao';
						className1 = 'mucc';
					}
					html = "<section class='list'><div class="+className1+">"+beforehtml+"<h2 class='mecctitle'><a href='javascript:void(0);' onclick='detail("+res[i].id+")'>"+ res[i].title +"</a></h2>" + 
					"<address class='meccaddress'><time>"+ res[i].createTime +"</time> - <a href=''>"+res[i].categoryName+"</a></address> </div>"+
					"<div class="+className+">"+res[i].remark+"</div><div class='clear'></div></section> "
					$("#context").append(html);                          
				}
				pageHtml = "<div class='posts-nav'><span class='page-numbers current'>1</span><a class='page-numbers' href=''>2</s></div>"
				pageHtml1 = "<div class='posts-nav' id='posts-nav'></div>";
				//$("#container").append("<div id='pageTool'>123213</div>");
				
			},
			error:function(){
				alert("获取内容异常!");
			}
		});
	}
	
	
	function initPageNumber(){
		var total = $("#total").val();
		var maxNum = total / 3;    //最大页码数 
		var tempNum = total % 3;
		if(tempNum > 0){
			maxNum += 1;
		}
		
		var currentNum = $("#curentPage").val();		//当前页码数 
		
		var page = new Paging();
		page.init({	target: $('#pageTool'), pagesize: maxNum, count: total, current:1,callback: function (pagecount, size, count) {
				console.log(arguments)
				alert('当前第 ' + pagecount + '页,每页 ' + size + '条,总页数：' + count + '页');
				//ajax获取页面内容 
				$("#curentPage").val((pagecount-1)*3);
				initArticle();
				page.render({ count: total, current: pagecount });
			}
		});
	}
	
	
	function initLabels(){
		 $.ajax({
			 url:'${ctx}/article/getLabels',
			 method:"post",
			 dataType:"json",
			 success:function(res){
				 console.log(res);
				 //动态生成标签 
				 html = '';
				 for(i=0;i<res.length;i++){
					 html += "<a href='' style='font-size:15px'>"+res[i].categoryName+"</a>"
				 }
				 
				 $("#tagcloud").append(html);
				 
				 
			 },
			 error:function(){
				 alert("获取标签信息异常");
			 }
		 });
	}
	
	
	/**
		随机热文内容获取 
	**/
	function initHotArticle(){
		$.ajax({
			url:"${ctx}/article/getHotArticle",
			method:"post",
			dataType:"json",
			success:function(res){
				console.log(res);
				html = '';
				for(i=0;i<res.length;i++){
					html += "<li><a href=''>"+res[i].title+"</a></li>"
				}
				$("#sitebar_list_ul").append(html);
				
			},
			error:function(){
				alert("获取随机热文信息异常！");
			}
		});
	}
	
	function detail(articleId){
		console.log(articleId);
		window.location.href = "${ctx}/article/detail?articleId=" + articleId;
	}
	
	
</script>


<body>
<!-- head -->
<%@ include file="./base/head.jsp"%>


<div id="main">
	<input type="hidden" name="total" id="total" value="${total}"/>
	<input type="hidden" name="curentPage" id="curentPage" value="${curentPage}"/>
	<!-- container begin -->
	<div id="container">
		<div id="context"></div>
		<div id='pageTool' class='posts-nav'></div>
	</div>
	
	<!-- container end -->
	
	<%@ include file="./base/rightSide.jsp"%>
	
</div>
<!-- main end -->

<%@ include file="./base/foot.jsp"%>

</body>
</html>