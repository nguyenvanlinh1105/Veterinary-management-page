<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-donHang"/>
<c:url var ="NewURL" value="/admin-donHang"/>
<html>
<head>
    <title>Chỉnh sửa Đơn hàng </title>
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
					<c:if test="${not empty model.maDonHang}">
					    <div class="form-group col-sm-6">
					    	<label class="control-label no-padding-right">Mã Đơn Hàng</label>
							<input type="text" class="form-control " placeholder="" id="maDonHang" name="maDonHang" value="${model.maDonHang}" readonly/>
					    </div>
				    </c:if>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Khách hàng </label>
				        <select class="form-control" id="idKhachHang" name="idKhachHang">
                             <c:if test="${empty model.idKhachHang}">
                                 <option value="">Chọn khách hàng</option>
                                 <c:forEach var="item" items="${khachHang}">
                                     <option value="${item.idUser}">${item.tenuser}</option>
                                 </c:forEach>
                             </c:if>
                             <c:if test="${not empty model.maDonHang}">
                                 <option value="">Chọn khách hàng</option>
                                 <c:forEach var="item" items="${khachHang}">
                                     <option value="${item.idUser}" <c:if test="${item.idUser == model.idKhachHang}">selected="selected"</c:if>>
                                             ${item.tenuser}
                                     </option>
                                 </c:forEach>
                             </c:if>
                         </select>
				    </div>
				    
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Số điện thoại giao hàng</label>
				        <input type="text" class="form-control " id="sdtGiaoHang" name="sdtGiaoHang"  placeholder="Nhập số điện thoại(đủ 10 số)" value="${model.sdtGiaoHang}"/>
				    </div> 
				     <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Địa chỉ giao hàng</label>
				        <input type="text" class="form-control " id="diaChiGiaoHang" name="diaChiGiaoHang" placeholder="Nhập địa chỉ giao hàng " value="${model.diaChiGiaoHang}"/>
				    </div>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Ngày giao hàng</label>
				        <input type="text" class="form-control " id="ngayGiaoHang" name="ngayGiaoHang" placeholder="Ví dụ: năm - tháng - ngày (MMMM-yy-DD) " value="${model.ngayGiaoHang}"/>
				    </div>
				    <c:if test="${not empty model.maDonHang}">
					    <div class="form-group col-sm-6">
					        <label class="control-label no-padding-right">Phương thức thanh toán</label>
					        <input type="text" class="form-control " id="phThucThanhToan" name="phThucThanhToan" placeholder="Ví dụ: thanh toán trực tiếp - banking " value="${model.phThucThanhToan}"/>
					    </div>
				    </c:if>
				    <c:if test="${not empty model.maDonHang}">
					    <div class="form-group col-sm-6">
					        	<label class="control-label no-padding-right">Ngày thanh toán</label>					          
					       		<input type="text" class="form-control " id="ngayThanhToan" name="ngayThanhToan" placeholder="Ví dụ: năm - tháng - ngày (MMMM-yy-DD) " value="${model.ngayThanhToan}"/>
					    </div>
				    </c:if>
				    <div class="form-group col-sm-6">
				        <label class="control-label no-padding-right">Trạng thái đơn hàng</label>
				        <c:if test="${not empty model.maDonHang}">
				             <input type="text" class="form-control " placeholder="" id="trangThai" name="trangThai" value="${model.trangThai}" />
				            <ul> 
				            	<li>Trạng thái đã xác nhận; Đã hủy; Chưa thanh toán; Đặt tư vấn</li>
				            </ul>
				        </c:if>
				        <c:if test="${empty model.maDonHang}">
				             <select class="form-control" id="trangThai" name="trangThai">
				             	<option value="Đã thanh toán">Đã thanh toán</option>
				             	<option value="Chưa thanh toán">Chưa thanh toán</option>
				             	<option value="Đặt tư vấn">Chưa thanh toán</option>
				             	 <option value="Đã hủy">Đã hủy</option>
							</select>
				        </c:if>
				    </div>
				    
				      
				      
				    <div class="form-group col-sm-12 pt-5">
				        <c:if test="${not empty model.maDonHang}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật đơn hàng " id="btnAddOrUpdateNew"/>
				        </c:if>
				        <c:if test="${empty model.maDonHang}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm đơn hàng" id="btnAddOrUpdateNew"/>
				        </c:if>
				    </div>
				    <input type="hidden" value="${model.maDonHang}" id="maDonHang" name="maDonHang"/>
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
    
    var id = $('#maDonHang').val();
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
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=maDonHang&sortBy=desc&message=insert_success";
        },
        error: function (error) {
        	console.log(error)
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=maDonHang&sortBy=desc&message=error_system";
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
        	window.location.href = "${NewURL}?type=edit&maDonHang="+result.maDonHang+"&message=update_success";
        },
        error: function (error) {
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=maDonHang&sortBy=desc&message=error_system";
        }
    });
}
    
</script>
</body>
</html>
