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
		initLabels();
		initHotArticle();
	});
	
	
	
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
	
</script>


<body>
<!-- head -->
<%@ include file="../base/head.jsp"%>


<div id="main">
	<input type="hidden" name="total" id="total" value="${total}"/>
	<input type="hidden" name="curentPage" id="curentPage" value="${curentPage}"/>
	<!-- container begin -->
	<div id="container">
		<article class="content">
          <header class="contenttitle">
            <h1 class="mscctitle"> <a href="javascript:;"> ${article.title} </a> </h1>
            <address class="msccaddress ">
              <time> ${article.createTime}</time>
              -
              ${article.categoryName}
            </address>
          </header>
          <div class="content-text"> 
          	${article.context}
          <!--content_text-->
          <div class="zhuan">
            <p>本文转载 " 36氪 整理 "<br><br>原文地址 " http://36kr.com/p/5089494.html "</p> 
          </div>
        </article>
	</div>
	
	<!-- container end -->
	
	<%@ include file="../base/rightSide.jsp"%>
	
</div>
<!-- main end -->

<%@ include file="../base/foot.jsp"%>

</body>
</html>