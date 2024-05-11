<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-thuCung"/>
<c:url var ="NewURL" value="/admin-thuCung"/>
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
				    <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Tên thú cưng</label>
				        <input type="text" class="form-control col-sm-6" placeholder="Nhập tên thú cưng" id="tenThuCung" name="tenThuCung" value="${model.tenThuCung}"/>
				    </div>
				    <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Giới tính</label>
				        <input type="text" class="form-control col-sm-6" id="gioiTinh" name="gioiTinh" placeholder="Đực or Cái" value="${model.gioiTinh}"/>
				    </div>
				    <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Loại thú cưng</label>
				        <input type="text" class="form-control col-sm-6" id="loaiThuCung" name="loaiThuCung"  placeholder="Nhập loại thú cưng" value="${model.loaiThuCung}"/>
				    </div> 
				     <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Tuổi</label>
				        <input type="text" class="form-control col-sm-3" id="tuoi" name="tuoi" placeholder="Ví dụ: 5 " value="${model.tuoi}"/>
				    </div>
				      
				    <div class="form-group col-sm-12 pt-5">
				        <c:if test="${not empty model.idThuCung}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật thú Cưng" id="btnAddOrUpdateNew"/>
				        </c:if>
				        <c:if test="${empty model.idThuCung}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm thú cưng" id="btnAddOrUpdateNew"/>
				        </c:if>
				    </div>
				    <input type="hidden" value="${model.idThuCung}" id="idThuCung" name="idThuCung"/>
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
    
    var id = $('#idThuCung').val();
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
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idThuCung&sortBy=desc&message=insert_success";
        },
        error: function (error) {
        	console.log(error)
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idThuCung&sortBy=desc&message=error_system";
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
        	window.location.href = "${NewURL}?type=edit&idThuCung="+result.idThuCung+"&message=update_success";
        },
        error: function (error) {
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idThuCung&sortBy=desc&message=error_system";
        }
    });
}
    
</script>
</body>
</html>
