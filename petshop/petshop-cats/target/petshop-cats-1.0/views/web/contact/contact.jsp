<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-datLich"/>
<c:url var ="CartURL" value="/web-cart"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETSHOP</title>
</head>
<body>
        <!-- Header Start -->
        <div class="container-fluid bg-breadcrumb py-5">
            <div class="container text-center py-5">
                <h3 class="text-white display-3 mb-4">Liện Hệ Chúng Tôi</h1>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item active text-white">Contact</li>
                </ol>    
            </div>
        </div>
        <!-- Header End -->

        
        <!-- Contact Start -->
        <div class="container-fluid contact py-5" style="background-color: snow;">
            <div class="container pt-5">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-6">
                        <div class="text-center">
                            <h1 class="display-3 text-white mb-4">Liên Hệ Chúng Tôi</h1>
                            <p class="text-white fs-4">Đừng ngần ngại liên hệ với chúng tôi! Chúng tôi luôn ở đây để giúp bạn. Hãy điền vào biểu mẫu liên hệ hoặc gửi email cho chúng tôi tại info@purrfect.com. Đội ngũ của chúng tôi sẽ phản hồi bạn trong thời gian sớm nhất.

                                Ngoài ra, bạn cũng có thể gọi cho chúng tôi qua số điện thoại (+012) 3456 7890. Chúng tôi rất mong được nghe từ bạn!
                                
                                🐱 Hãy để chúng tôi giúp đỡ và chăm sóc các thành viên nhỏ của gia đình bạn! 🐱</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="contact-form rounded p-5">
                            <form>
                                <h1 class="display-6 mb-4">Bạn có thể hỏi bất cứ gì ?</h1>
                                <div class="row gx-4 gy-3">
                                    <div class="col-xl-6">
                                        <input type="text" class="form-control py-3 border-white bg-transparent text-white" name="sdtGiaoHang" id="sdtGiaoHang" placeholder="Nhập số điện thoại của bạn">
                                    </div>
                                    <div class="col-xl-6">
                                         <input type="email" class="form-control py-3 border-white bg-transparent text-white " name="diaChiGiaoHang" id="diaChiGiaoHang" placeholder="Nhập đỉa chỉ của bạn">
                                    </div>
                                    <div class="col-12">
                                        <textarea class="form-control bg-white border-0 py-3 px-4" rows="4" cols="10" placeholder="Vấn đề của bạn đang gặp phải là gì?"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary btn-primary-outline-0 w-100 py-3 px-5" type="submit" id="datLichHen" >Đặt lịch tư vấn ngay</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid pb-5">
            <div class="container py-5">
                <div class="row g-4 align-items-center">
                    <div class="col-12">
                        <div class="row g-4">
                            <div class="col-lg-4">
                                <div class="d-inline-flex bg-light w-100 border border-primary p-4 rounded">
                                    <i class="fas fa-map-marker-alt fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Address</h4>
                                        <p class="mb-0">TRƯỜNG ĐẠI HỌC SƯ PHẠM KĨ THUẬT</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="d-inline-flex bg-light w-100 border border-primary p-4 rounded">
                                    <i class="fas fa-envelope fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Mail Us</h4>
                                        <p class="mb-0">ute@udn.vn</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="d-inline-flex bg-light w-100 border border-primary p-4 rounded">
                                    <i class="fa fa-phone-alt fa-2x text-primary me-4"></i>
                                    <div>
                                        <h4>Telephone</h4>
                                        <p class="mb-0">(+012) 3456 7890 123</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="rounded">
                            <iframe class="rounded-top w-100" 
                            style="height: 450px; margin-bottom: -6px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387191.33750346623!2d-73.97968099999999!3d40.6974881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1694259649153!5m2!1sen!2sbd" 
                            loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div class=" text-center p-4 rounded-bottom bg-primary">
                            <h4 class="text-white fw-bold">Follow Us</h4>
                            <div class="d-flex align-items-center justify-content-center">
                                <a href="#" class="btn btn-light btn-light-outline-0 btn-square rounded-circle me-3"><i class="fab fa-facebook-f"></i></a>
                                <a href="#" class="btn btn-light btn-light-outline-0 btn-square rounded-circle me-3"><i class="fab fa-twitter"></i></a>
                                <a href="#" class="btn btn-light btn-light-outline-0 btn-square rounded-circle me-3"><i class="fab fa-instagram"></i></a>
                                <a href="#" class="btn btn-light btn-light-outline-0 btn-square rounded-circle"><i class="fab fa-linkedin-in"></i></a>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
	$('#datLichHen').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
	        data[""+v.name+""] = v.value;
	        console.log(v.name+" "+v.value)
	    });
	    	datLich(data)
	})

		 function datLich(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	window.location.href = "${CartURL}?type=list&page=1&maxPageItem=8&sortName=idUser&sortBy=desc&message=delete_success";
	            },
	            error: function (error) {
	            	window.location.href = "${CartURL}?type=list&page=1&maxPageItem=8&sortName=idUser&sortBy=desc&message=error_system";
	            }
	        });
		 }
	</script>
</body>
</html>