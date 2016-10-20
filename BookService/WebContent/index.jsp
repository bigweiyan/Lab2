<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>图书管理系统</title>
	
	<!-- Bootstrap core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    
</head>
<body>
	<!-- 导航栏  -->
	<div class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">图书管理系统</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav" >
            <li class="active"><a href="#" >图书浏览</a></li>
            <li><a href="addAuthor.jsp" >新增作者</a></li>
            <li><a href="AddBook.action" >新增图书</a></li>
          </ul>
        </div>
      </div>
    </div>
	<br><br><br>
	
	<!-- 正文 -->
	<div class="container">
	<%
	String alert;
	alert = request.getParameter("alert");
	if("1".equals(alert)){
	%>
	<br>	
		<div class="row">
		<div class="col-md-10 col-md-offset-1">
		<div class="alert alert-success" role="alert">
        	<strong>更改成功：</strong> 您做的更改已提交
		</div></div></div>
	<%
	}else if("2".equals(alert)){
	%>
	<br>	
		<div class="row">
		<div class="col-md-10 col-md-offset-1">
		<div class="alert alert-danger" role="alert">
        	<strong>更改失败：</strong> 您做的更改提交失败，请检查输入
		</div>	
		</div></div>
	<%		
	}
	%>
	<!-- 图书查找框  -->
		<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<form class="form-signin" action="Search" method="post" name="loginForm">
		        <h2 class="form-signin-heading">查找图书</h2>
		        <input name="authorName" class="form-control" placeholder="请输入图书作者" required autofocus>
		        <br>
		        <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
	        </form>
	        <br>
	        <br>
	        <p>你可能想找：罗素，老子，鲁迅<br>小贴士：在手机上或小屏幕浏览器中使用时，可以点击导航栏最右侧打开菜单</p>
	    </div>
	    </div>


	</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
	
</body>
</html>