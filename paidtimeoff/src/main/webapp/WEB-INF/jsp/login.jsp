<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>PTO | Home</title>

<!-- Bootstrap -->
<link href="../../static/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Personal Time Off</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav"></ul>
			</div>
					
				
			</div>
		</div>

<div class="container text-center ">
						
		<c:url value="/login" var="login"/>
		
		<form:form class="form-horizontal" action="${login}" method="post">
		<div class="form-group">
						<label class="control-label col-md-4">Username:</label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="username"/>
						</div>
					</div>
			 <div class="form-group">
						<label class="control-label col-md-4">Password:</label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="password"/>
						</div>
					</div>
			
			
		<div class="form-group">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<Button type="submit" class="btn btn-primary">Submit</Button>
		</div>
		</form:form>

	
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="static/js/bootstrap.min.js"></script>





</body>
</html>


