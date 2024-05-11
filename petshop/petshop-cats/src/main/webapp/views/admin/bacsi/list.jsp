<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<c:url var="APIurl" value="/api-admin-bacsi"/>
<c:url var ="NewURL" value="/admin-bacsi"/>
<!DOCTYPE html>
<html>

<head>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Danh sách bác sĩ</title>
</head>

<body>
	
	<div class="main-content ml-4 pr-4">
		<form action="<c:url value='/admin-bacsi'/>" id="formSubmit" method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
								chủ</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
								<div class="col-xs-12">
									<c:if test="${not empty messageResponse}">
										<div class="alert alert-${alert}">
	  										${messageResponse}
										</div>
									</c:if>
									<div class="widget-box table-filter">
										<div class="table-btn-controls d-flex justify-content-between align-items-center pr-4">
		                                    <h5 class="card-title mb-0">Danh sách Bác sĩ</h5>
		                                    <div class="mb-2">
		                                        <a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold " data-toggle="tooltip" title='Thêm bác sĩ' href='<c:url value="/admin-bacsi?type=edit"/>'>
		                                            <span>
		                                                <i class="fa fa-plus-circle bigger-110 purple"></i> Thêm Bác sĩ
		                                            </span>
		                                        </a>
		                                        <button id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bác sĩ'>
		                                            <span>
		                                                XÓA <i class="fa fa-trash-o bigger-110 pink"></i>
		                                            </span>
		                                        </button>
		                                    </div>
		                                </div>
									</div>
							<div class="row ml-2 pr-2" >
								<div class="col-xs-12">
									<div class="table-responsive overflow-auto">
										<table class="table table-bordered ">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkAll">All</th>
													<th>Mã Bác Sĩ</th>
													<th>UserName</th>
													<th>Tên Bác Sĩ</th>
													<th>Chuyên ngành Bác Sĩ</th>
													<th>Giới tính</th>
													<th>Ngày sinh</th>
													<th>Số điện thoai</th>
													<th>Email</th>
													<th>Thông Tin bác Sĩ</th>
													<th>Trạng thái</th>
													<th>Thao tác</th>
													
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td><input type="checkbox" id="check_${item.idUser}" value="${item.idUser}"></td>
														<td>${item.idUser}</td>
														<td>${item.userName}</td>
														<td>${item.tenuser}</td>
														<td>${item.loaiuser}</td>
														<td>${item.gioiTinh}</td>
														<td>${item.ngaySinh}</td>
														<td>${item.soDienThoai}</td>
														<td>${item.email}</td>
														<td>${item.thongTinUser}</td>
														<td>
														    <script>
														        if (${item.status} === 1) {
														            document.write("Hoạt động");
														        } else {
														            document.write("Không hoạt động");
														        }
														    </script>
														</td>
														<td>
															<c:url var="editURL" value="/admin-bacsi">
																<c:param name="type" value="edit"/>
																<c:param name="idUser" value="${item.idUser}"/>
															</c:url>
															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
															   title="Cập nhật bác sĩ" href='${editURL}'><i class="fa fa-edit" aria-hidden="true"></i>
															</a>
														</td>
														
													</tr>
												</c:forEach>
												
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="type" name="type">
										<input type="hidden" value="" id="page" name="page">
										<input type="hidden" value="" id="maxPageItem" name="maxPageItem">
										<input type="hidden" value="" id="sortName" name="sortName">
										<input type="hidden" value="" id="sortBy" name="sortBy">
									</div>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</form>
	</div>
	
	<!-- /.main-content -->
	<script type="text/javascript">
	
		var totalPage = ${model.totalPage}
		var currentPage = ${model.page}
		var limit=8
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPage,
				startPage : currentPage,
				visiblePages : 5,
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
					if(currentPage !=page){
						$('#type').val("list");
						$('#page').val(page);
						$('#maxPageItem').val(limit);	
						$('#sortName').val("idUser");
						$('#sortBy').val("desc");
						$('#formSubmit').submit();
					}
				}
			});
		})
		
		$("#btnDelete").click(function(){
			var data ={};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			data['ids'] = ids;
			deleteNew(data);
		})

		 function deleteNew(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	console.log(result);
	            	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idUser&sortBy=desc&message=delete_success";
	            },
	            error: function (error) {
	            	window.location.href = "${NewURL}?type=list&page=1&maxPageItem=8&sortName=idUser&sortBy=desc&message=error_system";
	            }
	        });
		 }
	</script>
</body>

</html>