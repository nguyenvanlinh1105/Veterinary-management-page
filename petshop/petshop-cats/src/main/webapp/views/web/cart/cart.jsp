<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-chiTietDonHang"/>
<c:url var ="NewURL" value="/web-cart"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ dịch vụ của bạn</title>
</head>
<body>
	<div class="container mt-4 mb-5 pb-5" >
	<form  id="formSubmit" method="get">
            <div id="thongbao" class="alert alert-danger d-none face" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>

            <h1 class="text-center">Giỏ dịch vụ của bạn !</h1>
            <div class="row">
				<div class="col-xs-12">
					<c:if test="${not empty messageResponse}">
						<div class="alert alert-${alert}">
									 ${messageResponse} 
						</div>
					</c:if>
					<div class="widget-box table-filter">
    					<div class="table-btn-controls d-flex justify-content-between align-items-center pr-4 justify-content-end" style="float: right">
                                  <div class="mb-2">
                                      <a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold " data-toggle="tooltip" title='Thêm dịch vụ' href='<c:url value="/web-datLich"/>'>
                                          <span>
                                              <i class="fa fa-plus-circle bigger-110 purple"></i> Đạt thêm dịch vụ 
                                          </span>
                                      </a>
                                      <button id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa dịch vụ'>
                                          <span>
                                              Xóa đơn hàng <i class="fa fa-trash-o bigger-110 pink"></i>
                                          </span>
                                      </button>
                                  </div>
                              </div>	
						</div>
					 </div>
		        </div>
            <div class="row">
                <div class="col col-md-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-pink"style= "background: pink">
                                <th>Check</th>
                                <th>Ảnh dịch vụ</th>
                                <th>Tên dịch vụ</th>
                                <th>Số lượng</th>
                                <th>Đơn giá</th>
                                <th>Thành tiền</th>
                                <th>Ngày tạo</th>
                                <th>Số điện thoại liên hệ</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody id="datarow">
                        <c:forEach var="item" items="${model.listResult}">
                            <tr>
                             <c:choose>
							    <c:when test="${not empty item.trangThai and item.trangThai.trim() ne 'Đã thanh toán' and item.trangThai.trim() ne 'Đã xác nhận'}">
							        <td><input type="checkbox" id="check_${item.idDichVu}" value="${item.maDonHang }-${item.idDichVu}"></td>
							    </c:when>
							    <c:otherwise>
							        <td>no check</td>
							    </c:otherwise>
							</c:choose>

                                <td>
                                    <img src="template/web/img/imgCart.jpg" class="hinhdaidien">
                                </td>
                                <td>${item.tenDichVu}</td>
                                <td class="text-right">${item.soLuong}</td>
                                <td class="text-right">${item.donGia}</td>
                                <td class="text-right">${item.thanhTien}</td>
                                <td class="text-right">${item.createddate}</td>
                                <td class="text-right">${item.sdtGiaoHang}</td>
                                <td class="text-right">${item.diaChiGiaoHang}</td>
                                <c:choose>
                                 	<c:when test="${item.trangThai ne 'Đã thanh toán' and item.trangThai ne 'Đã xác nhận'}">
                               			 <td class=" btn text-white bg-primary">${item.trangThai}</td>
                               		 </c:when>
                               		 <c:otherwise>
						            	 <td class="text-right">${item.trangThai}</td>
						        </c:otherwise>
                                 </c:choose>
                            </tr>
                           </c:forEach>
                        </tbody>
                    </table>
						<div class="float-right d-flex justify-content-between align-items-center pr-4 justify-content-end">
						    <div class="rounded p-2 bg-info text-white">
						        Số tiền bạn cần phải thanh toán là:${tongTien} vnđ
						    </div>
						</div>
                    <a href='<c:url value="/trang-chu"/>' class="btn btn-warning btn-md mt-4 mb-4 "><i class="fa fa-arrow-left"
                            aria-hidden="true"></i>&nbsp;Quay
                        về trang chủ</a>
                    <a href='<c:url value="/web-checkout"/>' class="btn btn-primary btn-md mt-4 mb-4 "><i
                            class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;Thanh toán</a>
                </div>
            </div>
            </form>
        </div>
          
          <script type="text/javascript">

		$("#btnDelete").click(function(){
			var data ={};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			data['ids'] = ids;
			console.log(data)
			deleteDV(data);
		})

		 function deleteDV(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	console.log(result);
	            	window.location.href = "${NewURL}?&message=delete_success";
	            },
	            error: function (error) {
	            	window.location.href = "${NewURL}?&message=error_system";
	            }
	        });
		 }
	</script>
          
</body>
</html>