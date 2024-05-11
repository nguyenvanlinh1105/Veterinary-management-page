<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-chiTietDonHang"/>
<c:url var ="NewURL" value="/admin-chiTietDonHang"/>
<html>
<head>
    <title>Chỉnh sửa chi tiết đơn hàng </title>
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
			<c:if test="${not empty model.maDonHang}">
					<div class="alert alert-warning" role="alert">
					  <i class="fas fa-exclamation-triangle"></i> 
					  Cập nhật các trường không được để trống!
					</div>
			</c:if>
				<form id="formSubmit" class="row col-sm-6 pr-5 pl-5">
				    <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Chọn Dơn Hàng</label>
				       <select class="form-control" id="maDonHang" name="maDonHang">
						    <c:if test="${empty model.maDonHang}">
						        <option value="">Chọn Đơn Hàng</option>
						        <c:forEach var="donHang" items="${DonHang}">
								    <%-- Lặp qua danh sách DonHang --%>
								    <c:set var="idKhachHang" value="${donHang.idKhachHang}" />    
								    <%-- Tìm kiếm khách hàng tương ứng với idKhachHang --%>
								    <%-- Sử dụng forEach để duyệt qua danh sách khách hàng --%>
								    <c:forEach var="khachHang" items="${khachHang}">
								        <%-- Kiểm tra xem idKhachHang của DonHang có trùng với id của KhachHang hay không --%>
								        <c:if test="${khachHang.idUser == idKhachHang}">
								            <%-- Nếu trùng, hiển thị thông tin khách hàng --%>
								            <option value="${donHang.maDonHang}">${donHang.maDonHang} - ${khachHang.tenuser}</option>
								        </c:if>
								    </c:forEach>
								</c:forEach>

						        
						    </c:if>
						    <c:if test="${not empty model.maDonHang}">
						        <option value="">Chọn mã đơn hàng</option>
						        <c:forEach var="item" items="${DonHang}">
						            <option value="${item.maDonHang} " <c:if test="${item.maDonHang == model.maDonHang}" >selected="selected"  </c:if>>
						                ${item.maDonHang}
						            </option>
						        </c:forEach>
						       <script>
									    var selectElement = document.getElementById("maDonHang");
									    selectElement.addEventListener("change", function() {
									        // Reset lại giá trị của select về giá trị đã chọn ban đầu
									        selectElement.value = "${model.maDonHang}";
									    });
								</script>
						    </c:if>
						</select>
						
				    </div>
				     <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Chọn dịch vụ</label>
				        <select class="form-control" id="idDichVu" name="idDichVu">
                             <c:if test="${empty model.maDonHang}">
                                 <option value="">Chọn dịch vụ</option>
                                 <c:forEach var="item" items="${DichVu}">
                                     <option value="${item.idDichVu}">${item.tenDichVu}</option>
                                 </c:forEach>
                             </c:if>
                             <c:if test="${not empty model.maDonHang}">
                                 <option value="">Chọn dịch vụ</option>
                                 <c:forEach var="item" items="${DichVu}">
                                     <option value="${item.idDichVu}" <c:if test="${item.idDichVu == model.idDichVu}"> selected="selected"</c:if>>
                                             ${item.tenDichVu}
                                     </option>
                                    
                                 </c:forEach>
                                 
                                 <script>
									    var selectElement = document.getElementById("idDichVu");
									    selectElement.addEventListener("change", function() {
									        // Reset lại giá trị của select về giá trị đã chọn ban đầu
									        selectElement.value = "${model.idDichVu}";
									    });
								</script>
                             </c:if>
                         </select>
				    </div>
				    
				     <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Số lượng </label>
				        <input type="text" class="form-control col-sm-6" id="soLuong" name="soLuong" placeholder="Đực or Cái" value="${model.soLuong}"/>
				    </div>
				     <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Bác sĩ </label>
				        <select class="form-control" id="idBacSi" name="idBacSi">
                             <c:if test="${empty model.maDonHang}">
                                 <option value="">Chọn Bác sĩ</option>
                                 <c:forEach var="item" items="${BacSi}">
                                     <option value="${item.idUser}"> Bác sĩ ${item.tenuser}</option>
                                 </c:forEach>
                             </c:if>
                             <c:if test="${not empty model.maDonHang}">
                                 <option value="">Chọn Bác sĩ</option>
                                 <c:forEach var="item" items="${BacSi}">
                                     <option value="${item.idUser}" <c:if test="${item.idUser == model.idBacSi}">selected="selected"</c:if>>
                                            Bác sĩ ${item.tenuser}
                                     </option>
                                 </c:forEach>
                             </c:if>
                         </select>
				    </div>
				     <div class="form-group col-sm-12">
				        <label class="control-label no-padding-right">Nhân Viên</label>
				        <select class="form-control" id="idNhanVien" name="idNhanVien">
                             <c:if test="${empty model.maDonHang}">
                                 <option value="">Chọn nhân viên</option>
                                 <c:forEach var="item" items="${NhanVien}">
                                     <option value="${item.idUser}">${item.tenuser}</option>
                                 </c:forEach>
                             </c:if>
                             <c:if test="${not empty model.maDonHang}">
                                 <option value="">Chọn nhân viên</option>
                                 <c:forEach var="item" items="${NhanVien}">
                                     <option value="${item.idUser}" <c:if test="${item.idUser == model.idNhanVien}">selected="selected"</c:if>>
                                             ${item.tenuser}
                                     </option>
                                 </c:forEach>
                             </c:if>
                         </select>
				    </div>
				      
				    <div class="form-group col-sm-12 pt-5">
				        <c:if test="${not empty model.maDonHang}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật Chi tiết đơn hàng" id="btnAddOrUpdateNew"/>
				        </c:if>
				        <c:if test="${empty model.maDonHang}">
				            <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm Chi tiết đơn hàng" id="btnAddOrUpdateNew"/>
				        </c:if>
				    </div>
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
    
    var id = $('#btnAddOrUpdateNew').val();
    if (id == "Thêm Chi tiết đơn hàng") {
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
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=createddate&sortBy=desc&message=insert_success";
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
        	console.log(result)
        	window.location.href = "${NewURL}?type=edit&maDonHang="+result.maDonHang+"&idDichVu="+result.idDichVu+"&message=update_success";
        },
        error: function (error) {
        	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=maDonHang&sortBy=desc&message=error_system";
        }
    });
}
    
</script>
</body>
</html>
