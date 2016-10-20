<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix= "s"  uri= "/struts-tags"  %>
<%
	String isbn = request.getParameter("isbn");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>图书详情</title>
	
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
    <!-- 正文 -->
    <div class="container">
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
    
    <!-- 图书详情  -->
    	<div class="row">
    		<div class="page-header">
    			<h1>图书详情<small>Book&nbsp;info</small></h1>
    		</div>
    	</div>
    
    	<div class="row">
    		<div class="col-md-6">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        		<ol class="carousel-indicators">
          		<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
          		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
        		</ol>
        		<div class="carousel-inner" role="listbox">
          			<div class="item active">
            		<img src="i/info1.png" alt="第一页">
         			</div>
          			<div class="item">
            		<img src="i/info2.png" alt="第二页">
          			</div>
          			<div class="item">
            		<img src="i/info3.png" alt="第三页">
          			</div>
       			</div>
        		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          		<span class="sr-only">上一页</span>
        		</a>
        		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          		<span class="sr-only">下一页</span>
       			</a>
      		</div>
		</div>
		<div class="col-md-6">
			<h2>书名：<s:property value="book.getTitle()"/></h2>
			<p>ISBN：<s:property value="book.getIsbn()"/></p>
			<p>出版社：<s:property value="book.getPublisher()"/></p>
			<p>出版时间：<s:property value="book.getPublishDate()"/></p>
			<p>售价：<s:property value="book.getPrice()"/>元</p>
			<a href="#update"><button class="btn btn-info">修改</button></a>
		</div>
    	</div>
    	<!-- 作者详情  -->
	    <div class="row">
			<div class="page-header">
				<h1>作者介绍<small>Author&nbsp;information</small></h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3">
			<div class="row">
			<div class="center-block" style="width:200px;">
			<img src="i/author.png" class="img-rounded" alt="作者">		
			</div>
			</div>
			</div>
				
			<div class="col-md-9">
				<h2><s:property value= "book.getName()" /></h2><br><!-- 作者名 -->
				<p>作者编号：<s:property value= "book.getAuthorID()" /></p> <!-- 作者ID -->
				<div class="row">
				<div class="col-md-6">
				<p>年龄：<s:property value= "book.getAge()" /></p>		
				</div>
				<div class="col-md-6">
				<p>国籍：<s:property value= "book.getCountry()" /></p> <!-- 作者其他信息 -->		
				</div>
				</div>
			</div>
		</div><!-- 作者介绍 -->
		
		<!-- 修改信息  -->
		<div class="row">
			<div class="page-header">
				<h1>更新信息<small>Update&nbsp;information</small></h1>
			</div>
		</div>
		<div class="row" id="update">
		<form role="form" action="Update" class="form-horizontal">
			<label class="control-label">图书作者</label>
			<div class="form-group"><div class="col-sm-12">
				<s:select cssClass="form-control" name="authorid" list="authList" label="作者"> 
				</s:select>
			</div></div>
			
			<div class="form-group">
				<div class="col-sm-6">
	        	<label for="publisher" class="control-label">出版社名</label>
	        	<input name="publisher" class="form-control" placeholder="出版社名" onchange="checkInput(this)" required>
	        	</div>
	        	<div class="col-sm-6" id="pbGroup">
	        	<label for="publishdate" class="control-label" id="pbLabel">出版时间(格式如2016/12/31)</label>
	        	<input type="date" name="publishdate" id="pbBox" class="form-control" placeholder="出版时间" onchange="checkDate()" required>
	        	</div>
	        </div>
	
			<label class="control-label" id="prLabel">定价</label>
			<div class="input-group" id="prGroup">
				<span class="input-group-addon">￥</span>
				<input type="text" class="form-control" id="prBox" name="price" onchange="checkFloat()" required>
				
			</div>
			
			<div class="form-group"><div class="col-sm-12">
			<input type="hidden" name="isbn" value=<%=isbn %>>
			<br><button type="submit" class="btn btn-success" style="width:100%">修改</button>
			</div></div>
		</form>
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
function checkFloat(){
	var box = document.getElementById("prBox");
	var group = document.getElementById("prGroup");
	var label = document.getElementById("prLabel");
	var patt=/^[0-9]+\.?[0-9]*$/;
	var value = box.value;
	if(patt.test(value)){
		group.setAttribute("class","has-success input-group");
		label.innerHTML = "定价";
		return true;
	}else{
		group.setAttribute("class","has-error input-group");
		label.innerHTML = "定价（请输入整数或小数）";
		return false;
	}
}

function checkDate(){
	var box = document.getElementById("pbBox");
	var group = document.getElementById("pbGroup");
	var label = document.getElementById("pbLabel");
	var patt=/^[0-9]{4}\/[0-9]{2}\/[0-9]{2}$/;
	var value = box.value;
	if(patt.test(value)){
		group.setAttribute("class","has-success col-sm-6");
		label.innerHTML = "出版时间";
		return true;
	}else{
		group.setAttribute("class","has-error col-sm-6");
		label.innerHTML = "出版时间（格式2016/12/31）";
		return false;
	}
}

function checkInput(id){
	var parent = id.parentNode;
	if(id.value){
		parent.setAttribute("class","has-success col-sm-6");
	}else{
		parent.setAttribute("class","has-error col-sm-6");
	}
	
}

</script>
    
</body>
</html>