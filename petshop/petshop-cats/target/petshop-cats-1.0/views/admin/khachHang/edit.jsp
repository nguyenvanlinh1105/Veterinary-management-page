<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-khachHang"/>
<c:url var ="NewURL" value="/admin-khachHang"/>
<html>
<head>
    <title>Chỉnh sửa Admin </title>
</head>
<body>
<div class="main-content ml-2 pr-2">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang dành cho Admin</a>
                </li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
			    <div class="col-sm-12">
			        <c:if test="${not empty messageResponse}">
			            <div class="alert alert-${alert}">
			                ${messageResponse}
			            </div>
			        </c:if> 
			    </div>
			</div>
				<form id="formSubmit" class="row pr-5 pl-5">
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">userName</label>
				        <input type="text" class="form-control" placeholder="Nhập tên đăng nhập" id="userName" name="userName" value="${model.userName}"/>
				    </div>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Số điện thoại</label>
				        <input type="text" class="form-control" id="soDienThoai" name="soDienThoai" placeholder="Nhập đủ 10 số" value="${model.soDienThoai}"/>
				    </div>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">password</label>
				        <input type="text" class="form-control" id="password" name="password"  placeholder="Nhập password" value="${model.password}"/>
				    </div> 
				     <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Giới tính</label>
				        <input type="text" class="form-control" id="gioiTinh" name="gioiTinh" placeholder="Nam or Nữ" value="${model.gioiTinh}"/>
				    </div>
				     <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Tên khách hàng</label>
				        <input type="text" class="form-control" id="tenuser" name="tenuser"  placeholder="Nhập tên người dùng" value="${model.tenuser}"/>
				    </div> 
				   
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Ngày sinh</label>
				        <input type="text" class="form-control" id="ngaySinh" name="ngaySinh" placeholder="Ví dụ: 2003-03-23 (năm-tháng-ngày)" value="${model.ngaySinh}"/>
				    </div>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Loại khách hàng</label>
				        <input type="text" class="form-control" id="loaiuser" name="loaiuser" placeholder="Nhập chức năng của admin" value="${model.loaiuser}"/>
				    </div>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Email</label>
				        <input type="text" class="form-control" id="email" name="email" placeholder="Vi dụ: vanlinh@gmail.com" value="${model.email}"/>
				    </div>
				    <div class="form-group col-sm-12">
				        <c:if test="${not empty model.idUser}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật Khách hàng" id="btnAddOrUpdateNew"/>
				        </c:if>
				        <c:if test="${empty model.idUser}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm Khách hàng" id="btnAddOrUpdateNew"/>
				        </c:if>
				    </div>
				    <input type="hidden" value="${model.idUser}" id="idUser" name="idUser"/>
				</form>
        </div>
    </div>
</div>
<script>
$('#btnAddOrUpdateNew').click(function (e) {
    e.preventDefault();
    var data = {};
    var formData = $('#formSubmit').serializeArray();
    $.each(formData, function (i, v) {
        data[""+v.name+""] = v.value;
        console.log(v.name+" "+v.value)
    });
    
    var id = $('#idUser').val();
    if (id == "") {
        addNew(data);
    } else {
        updateNew(data);
    }
});
function addNew(data) {
    $.ajax({
        url: '${APIurl}',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idUser&sortBy=desc&message=insert_success";
        },
        error: function (error) {
        	console.log(error)
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idUser&sortBy=desc&message=error_system";
        }
    });
}
function updateNew(data) {
    $.ajax({
        url: '${APIurl}',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
        	console.log(result.idUser)
        	window.location.href = "${NewURL}?type=edit&idUser="+result.idUser+"&message=update_success";
        },
        error: function (error) {
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idUser&sortBy=desc&message=error_system";
        }
    });
}
    
</script>
</body>
</html>
