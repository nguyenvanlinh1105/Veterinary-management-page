<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Đăng nhập</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<c:if test="${not empty message }">
					<div class="alert alert-${alert}">
		 		 		<strong>${message}</strong>
					</div>
				</c:if>
				
				<form action="<c:url value='/dang-nhap'/>" id="formLogin" method="POST">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="Tên tài khoản" name="userName">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" placeholder="Mật khẩu" name="password">
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn">
					</div>
					<input type="hidden" value="login" id="page" name="action">
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Bạn chưa có tài khoản?<a href="<c:url value='/dang-ki?action=signup'/>">Đăng kí</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Bạn quên mật khẩu?</a>
				</div>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>