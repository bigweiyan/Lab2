<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix= "s"  uri= "/struts-tags"  %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新增作者</title>
	
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
            <li><a href="index.jsp" >图书浏览</a></li>
            <li class="active"><a href="#" >新增作者</a></li>
            <li><a href="AddBook.action" >新增图书</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 正文  -->
    <div class="container">
    	<!-- 图书列表 -->
    	<div class="row">
    		<div class="page-header">
    			<h1>新增作者<small>Add&nbsp;author</small></h1>
    		</div>
    	</div>
    
     <!-- 警示框 -->
    <%
	String alert;
	alert = request.getParameter("alert");
	if("1".equals(alert)){
	%>
	<br>	
		<div class="alert alert-success" role="alert">
        	<strong>更改成功：</strong> 您做的更改已提交
		</div>
	<%
	}else if("2".equals(alert)){
	%>
	<br>	
		<div class="alert alert-danger" role="alert">
        	<strong>更改失败：</strong> 您做的更改提交失败，请检查输入
		</div>	
	<%		
	}
	%>
    <!-- 上传作者信息 -->
    	<div class="row">
    	<div class="col-md-12">
    		<form role="form" action="SubmitAuthor" class="form-horizontal">
    		<div class="form-group">
			<label for="name" class="control-label">作者姓名</label>
			<input name="name" class="form-control" placeholder="作者姓名" onchange="checkInput(this)" required>
			</div><div class="form-group" id="ageGroup">
			<label for="age" class="control-label" id="ageLabel">作者年龄</label>
			<input name="age" class="form-control" id="ageBox" placeholder="作者年龄" onchange="checkInt()" required>
			</div><div class="form-group">
			<label for="country" class="control-label">作者国籍</label>
			<input name="country" class="form-control" placeholder="作者国籍" onchange="checkInput(this)" required>
			</div>
			<div class="form-group">
			<br><button type="submit" class="btn btn-success" style="width:100%">修改</button>
			</div>
		</form>
    	</div></div>

		<br>
		<footer class="footer">
		  <p>&copy; 哈尔滨工业大学&nbsp;计算机科学与技术学院&nbsp;魏䶮&nbsp;2016</p>
		</footer>

    </div>
    

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function checkInt(){
		var ageBox = document.getElementById("ageBox");
		var ageGroup = document.getElementById("ageGroup");
		var ageLabel = document.getElementById("ageLabel");
		var patt=/^[0-9]+$/;
		var age = ageBox.value;
		if(patt.test(age)){
			ageGroup.setAttribute("class","has-success form-group");
			ageLabel.innerHTML = "作者年龄";
			return true;
		}else{
			ageGroup.setAttribute("class","has-error form-group");
			ageLabel.innerHTML = "作者年龄（请输入整数）";
			return false;
		}
	}

	function checkInput(id){
		var parent = id.parentNode;
		if(id.value){
			parent.setAttribute("class","has-success form-group");
		}else{
			parent.setAttribute("class","has-error form-group");
		}
		
	}
</script>
    
</body>
</html>