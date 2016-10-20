<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix= "s"  uri= "/struts-tags"  %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>图书列表</title>
	
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
    <!-- 正文  -->
    <div class="container">
    	<!-- 图书列表 -->
    	<div class="row">
    		<div class="page-header">
    			<h1>图书列表<small>Book&nbsp;List</small></h1>
    		</div>
    	</div>
    
    	<div class="row">
    		<table class="table table-striped table-hover">
				<thead>
					<tr>
					<td>ISBN</td>
					<td>图书名</td>
					<td>操作</td>
					</tr>
				</thead>
				<tbody>
				<s:iterator value= "bookList"  status= "status" >  
					<tr>
					<td><s:property value= "isbn" /></td>
					<td>
						<s:a action="BookInfo">
						<s:param name="isbn"><s:property value= "isbn" /></s:param>
						<s:property value= "title" />
						</s:a>	
					</td>
					<td>			
						<s:a action="Remove">
						<s:param name="isbn"><s:property value= "isbn" /></s:param>
						<s:param name="authorName"><s:property value= "authorName" /></s:param>
						<button class="btn btn-danger">删除</button>
						</s:a>
					</td>
					</tr>
				</s:iterator>  
				</tbody>
			</table>
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
    
</body>
</html>