<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang admin-PETSHOP</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bao gồm Font Awesome CSS -->
    <link rel="stylesheet" href="<c:url value='./template/admin/vendor/fontawesome-free/css/all.min.css' />">
    
    <!-- Bao gồm Font từ Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    
    <!-- Bao gồm CSS của template SB Admin 2 -->
    <link rel="stylesheet" href="<c:url value='./template/admin/css/sb-admin-2.min.css' />">
    
    <!-- Bao gồm Bootstrap CSS từ Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='./template/admin/vendor/bootstrap/scss/bootstrap.scss' />" />
    
    <link rel="stylesheet" href="<c:url value='.template/admin/vendor/fontawesome-free/css/fontawesome.min.css' />" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
</head>
<body id="page-top">
    
<div id="wrapper">
    <!-- Bao gồm menu của admin -->
    <%@ include file="/common/admin/menu.jsp" %>
    
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <!-- Bao gồm header của admin -->
            <%@ include file="/common/admin/header.jsp" %>
            <dec:body/>
        </div>
        
        <!-- Bao gồm footer của admin -->
        <%@ include file="/common/admin/footer.jsp" %>
    </div>
</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bao gồm các thư viện JavaScript cần thiết -->

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/template/admin/vendor/jquery-easing/jquery.easing.min.js' />"></script>
<script src="<c:url value='/template/admin/js/sb-admin-2.min.js' />"></script>
<script src="<c:url value='/template/admin/vendor/chart.js/Chart.min.js' />"></script>
<script src="<c:url value='/template/admin/vendor/bootstrap/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/template/pagination/jquery.twbsPagination.js' />"></script>
<script src="<c:url value='/template/admin/js/demo/chart-area-demo.js' />"></script>
<script src="<c:url value='/template/admin/js/demo/chart-pie-demo.js' />"></script>

</body>
</html>
