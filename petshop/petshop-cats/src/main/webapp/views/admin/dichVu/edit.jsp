<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-dichVu"/>
<c:url var ="NewURL" value="/admin-dichVu"/>
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
				        <label class="control-label no-padding-right">Tên dịch vụ </label>
				        <input type="text" class="form-control " placeholder="Nhập tên dịch vụ" id="tenDichVu" name="tenDichVu" value="${model.tenDichVu}"/>
				    </div>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Đơn giá</label>
				        <input type="text" class="form-control " id="donGia" name="donGia" placeholder="Ví dụ: 200000" value="${model.donGia}"/>
				    </div>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Thương hiệu</label>
				        <input type="text" class="form-control " id="thuongHieu" name="thuongHieu"  placeholder="Nhập thương hiệu" value="${model.thuongHieu}"/>
				    </div> 
				     <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">loaiSanPham</label>
				        <input type="text" class="form-control " id="loaiSanPham" name="loaiSanPham" placeholder="Nhập loại sản phẩm " value="${model.loaiSanPham}"/>
				    </div>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Đơn vị tính</label>
				        <input type="text" class="form-control " id="donViTinh" name="donViTinh" placeholder="Ví dụ: lần/ hộp/ mũi " value="${model.donViTinh}"/>
				    </div>
				      
				      <c:if test="${not empty model.idDichVu}">
				      	<div class="form-group col-sm-6">
					        <label class="control-label no-padding-right">Số lượng đã bán</label>
					        <input type="text" class="form-control col-sm-3" id="soLuongDaBan" name="soLuongDaBan" placeholder="Ví dụ: 5 " value="${model.soLuongDaBan}"/>
					        <label class="control-label no-padding-right">Số lượng hiện còn</label>
					        <input type="text" class="form-control col-sm-3" id="soLuongHienCon" name="soLuongHienCon" placeholder="Ví dụ: 5 " value="${model.soLuongHienCon}"/>
				    	</div>
				      </c:if>
				       
				      
				      
				    <div class="form-group col-sm-12 pt-5">
				        <c:if test="${not empty model.idDichVu}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật Dịch vụ " id="btnAddOrUpdateNew"/>
				        </c:if>
				        <c:if test="${empty model.idDichVu}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm Dịch vụ" id="btnAddOrUpdateNew"/>
				        </c:if>
				    </div>
				    <input type="hidden" value="${model.idDichVu}" id="idDichVu" name="idDichVu"/>
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
    
    var id = $('#idDichVu').val();
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
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idDichVu&sortBy=desc&message=insert_success";
        },
        error: function (error) {
        	console.log(error)
        	window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
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
        	window.location.href = "${NewURL}?type=edit&idDichVu="+result.idDichVu+"&message=update_success";
        },
        error: function (error) {
        	window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
        }
    });
}
    
</script>
</body>
</html>
