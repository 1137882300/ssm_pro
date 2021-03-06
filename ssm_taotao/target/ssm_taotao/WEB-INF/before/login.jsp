<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>login</title>
    <!-- Custom Theme files -->
    <link href="../css/before/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <!--Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400'
          rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <!--Google Fonts-->

</head>
<body>

<div class="login">
    <h2>欢迎登录</h2>
    <div class="login-top">
        <h1>LOGIN FORM</h1>
        <form action="${pageContext.request.contextPath}/consumersController/login" method="post">
            <input type="text" value="User Id" name="username" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'username';}">
            <input type="password" value="password" name="password" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'password';}">

			<div class="forgot">
				<a href="#">forgot Password</a>
				<input type="submit" value="Login">
			</div>
		</form>
		<div class="error">
			<p>${loginErr}</p>
		</div>
    </div>
    <div class="login-bottom">
        <h3>New User &nbsp;<a href="#">注册</a>&nbsp Here</h3>
    </div>
</div>


<div class="copyright">
    <p>Copyright &copy; 2020.Company name All rights reserved.</p>
</div>


</body>
</html>