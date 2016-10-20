<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix= "s"  uri= "/struts-tags"  %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新增图书</title>
	
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
            <li><a href="addAuthor.jsp" >新增作者</a></li>
            <li class="active"><a href="#" >新增图书</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 正文  -->
    <div class="container">
    	<!-- 图书列表 -->
    	<div class="row">
    		<div class="page-header">
    			<h1>新增图书<small>Add&nbsp;book</small></h1>
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
    	<!-- 上传图书信息 -->
    	<div class="row">
    	<div class="col-md-12">
    		<form role="form" action="SubmitBook" class="form-horizontal">
	    		<div class="form-group">
					<label for="title" class="control-label">图书标题</label>
					<input name="title" class="form-control" placeholder="图书标题" onchange="checkInput(this)" required>
				</div>

				<div class="form-group">
				<label class="control-label">图书作者</label>
					<s:select cssClass="form-control" name="authorid" list="authList" label="作者"> 
					</s:select>
				</div>
				<div class="form-group" id="isbnGroup">
					<label for="isbn" class="control-label" id="isbnLabel">ISBN</label>
					<input name="isbn" class="form-control" placeholder="ISBN" id="isbnBox" onchange="checkInt()" required>
				</div><div class="form-group" >
					<label for="publisher" class="control-label" >出版社</label>
					<input name="publisher" class="form-control" placeholder="出版社" onchange="checkInput(this)"  required>
				</div><div class="form-group" id="pbGroup">
					<label for="publishDate" class="control-label" id="pbLabel">出版时间(格式如2016-12-31)</label>
					<input name="publishDate" class="form-control" id="pbBox" placeholder="出版时间" onchange="checkDate()" required>
				</div><div class="form-group" id="prGroup">
					<label for="price" class="control-label" id="prLabel">定价</label>
					<input name="price" class="form-control" id="prBox" placeholder="定价" onchange="checkFloat()" required>
				</div>
				
				<div class="form-group">
				<br><button type="submit" class="btn btn-success" style="width:100%">修改</button>
				</div>
			</form>
    	</div>
    	</div>

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
		var box = document.getElementById("isbnBox");
		var group = document.getElementById("isbnGroup");
		var label = document.getElementById("isbnLabel");
		var patt=/^[0-9]{13}$/;
		var value = box.value;
		if(patt.test(value)){
			group.setAttribute("class","has-success form-group");
			label.innerHTML = "ISBN";
			return true;
		}else{
			group.setAttribute("class","has-error form-group");
			label.innerHTML = "ISBN（请输入13位整数）";
			return false;
		}
	}
	
	function checkFloat(){
		var box = document.getElementById("prBox");
		var group = document.getElementById("prGroup");
		var label = document.getElementById("prLabel");
		var patt=/^[0-9]+\.?[0-9]*$/;
		var value = box.value;
		if(patt.test(value)){
			group.setAttribute("class","has-success form-group");
			label.innerHTML = "定价";
			return true;
		}else{
			group.setAttribute("class","has-error form-group");
			label.innerHTML = "定价（请输入整数或小数）";
			return false;
		}
	}
	
	function checkDate(){
		var box = document.getElementById("pbBox");
		var group = document.getElementById("pbGroup");
		var label = document.getElementById("pbLabel");
		var patt=/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		var value = box.value;
		if(patt.test(value)){
			group.setAttribute("class","has-success form-group");
			label.innerHTML = "出版时间";
			return true;
		}else{
			group.setAttribute("class","has-error form-group");
			label.innerHTML = "出版时间（格式2016-12-31）";
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