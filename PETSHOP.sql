
CREATE DATABASE QUANLYTHUCUNG
go
use QUANLYTHUCUNG
go

CREATE TABLE role(
  roleId int NOT NULL PRIMARY KEY,
  name NVARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  createddate Datetime NULL,
  modifieddate datetime NULL,
  createdby nVARCHAR(255) NULL,
  modifiedby nVARCHAR(255) NULL
);

ALTER TABLE role 
	ADD CONSTRAINT CK_role_modifiedDate
			CHECK (createddate<=modifieddate)

CREATE TABLE Users
(
	idUser varchar(10) primary key,
	userName varchar(100),
	password varchar(100),
	tenuser nvarchar(100) not null,
	loaiuser nvarchar(100) not null,
	gioiTinh nvarchar(10) ,
	ngaySinh date,
	soDienThoai varchar(10),
	email varchar(100),
	thongTinUser nvarchar(255),
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby nVARCHAR(255) NULL,
	modifiedby nVARCHAR(255) NULL,
	status int,-- 1 là hoạt động , 0 là không hoạt động nữa 
)

create table role_User
(
	roleId int foreign key references role(roleId) ON DELETE CASCADE  ON UPDATE CASCADE,
	idUser varchar(10) foreign key references Users(idUser) ON DELETE CASCADE  ON UPDATE CASCADE,
	primary key( roleId, idUser)
)

ALTER TABLE Users
	ADD CONSTRAINT CK_Users_gioiTinh 
			CHECK(gioiTinh in (N'Nam',N'Nữ')),
		CONSTRAINT CK_Users_soDienThoai 
			CHECK(soDienThoai Like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		CONSTRAINT CK_Users_email 
			CHECK (email Like '[a-z]%@gmail.com'),
		CONSTRAINT CK_User_modifiedDate
			CHECK (createddate<=modifieddate);

CREATE TABLE ThuCung
(
	idThuCung varchar(10) primary key,
	tenThuCung nvarchar(100) not null,
	gioiTinh nvarchar(10) ,
	loaiThuCung nvarchar(100) not null,
	tuoi int,
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby nVARCHAR(255) NULL,
	modifiedby nVARCHAR(255) NULL,
)
ALTER TABLE ThuCung 
	ADD CONSTRAINT CK_ThuCung_gioiTinh 
			CHECK(gioiTinh in (N'Đực',N'Cái')),
		CONSTRAINT CK_ThuCung_tuoi
			CHECK (tuoi>=0),
		CONSTRAINT CK_ThuCung_modifiedDate
			CHECK (createddate<=modifieddate)

CREATE TABLE DichVu
(
	idDichVu varchar(10) primary key,
	tenDichVu nvarchar(100),
	donGia money not null,
	thuongHieu nvarchar(100) ,
	loaiSanPham nvarchar(100) ,
	soLuongHienCon int,
	soLuongDaBan int,
	donViTinh nvarchar(10),
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL,
);
ALTER TABLE DichVu 
	ADD CONSTRAINT CK_DichVu_soLuongHienCon 
			CHECK(soLuongHienCon >=0),
		CONSTRAINT CK_DichVu_donGia 
			CHECK(donGia>=0),
		CONSTRAINT CK_DichVu_modifiedDate
			CHECK (createddate<=modifieddate)

CREATE TABLE DonHang
(
	maDonHang varchar(10) primary key,
	idKhachHang varchar(10) foreign key references Users(idUser) ON DELETE CASCADE  ON UPDATE CASCADE,
	sdtGiaoHang varchar(10),
	diaChiGiaoHang nvarchar(255),
	ngayGiaoHang datetime,
	phThucThanhToan nvarchar(100),
	ngayThanhToan datetime,
	trangThai nvarchar(100),
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby nVARCHAR(255) NULL,
	modifiedby nVARCHAR(255) NULL,
)

ALTER TABLE DonHang 
	ADD CONSTRAINT CK_DonHang_sdtGiaoHang
			CHECK(sdtGiaoHang like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		CONSTRAINT CK_DonHang_ngayGiaoHang 
			CHECK (ngayGiaoHang<=ngayThanhToan),
		CONSTRAINT CK_DonHang_ngayThanhToan
			CHECK(ngayThanhToan<=getDate()),
		CONSTRAINT DF_DonHang_trangThai
			DEFAULT 'GOOD' FOR trangThai,
		CONSTRAINT CK_DonHang_modifiedDate
			CHECK (createddate<=modifieddate)

CREATE TABLE ChiTietDonHang
(
	maDonHang varchar(10) foreign key references DonHang(maDonHang) ,
	idDichVu varchar(10) foreign key references DichVu(idDichVu) ,
	idBacSi varchar(10) foreign key references Users(idUser) ,
	idNhanVien varchar(10) foreign key references Users(idUser),
	soLuong int,
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby nVARCHAR(255) NULL,
	modifiedby nVARCHAR(255) NULL,
	primary key (maDonHang, idDichvu)
)
ALTER TABLE ChiTietDonHang 
	ADD CONSTRAINT CK_ChiTietDonHang_modifiedDate
			CHECK (createddate<=modifieddate)

CREATE TABLE The
(
	idThuCung varchar(10) foreign key references ThuCung(idThuCung) ON DELETE CASCADE  ON UPDATE CASCADE,
	idKhachHang varchar(10) foreign key references Users(idUser) ON DELETE CASCADE  ON UPDATE CASCADE,
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby nVARCHAR(255) NULL,
	modifiedby nVARCHAR(255) NULL,
	primary key (idThuCung, idKhachHang)
)

ALTER TABLE The 
	ADD CONSTRAINT CK_The_modifiedDate
			CHECK (createddate<=modifieddate)


CREATE TABLE NhaCungCap (
	maNCC varchar(10) primary key ,
	tenNCC nvarchar(25) not null,
	diaChiNCC nvarchar(100) ,
	SDT char(10)  unique ,
	nhanVienLienHe nvarchar(25) ,
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby nVARCHAR(255) NULL,
	modifiedby nVARCHAR(255) NULL
	);

CREATE TABLE PhieuNhap (
	maPN varchar(10) primary key, 
	maNCC varchar(10) foreign key references NhaCungCap(maNCC) 
		ON DELETE CASCADE  ON UPDATE CASCADE ,
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby nVARCHAR(255) NULL,
	modifiedby nVARCHAR(255) NULL	);

CREATE TABLE ChiTietPhieuNhap (
	maPN varchar(10) foreign key references PhieuNhap(maPN)
	ON DELETE CASCADE  ON UPDATE CASCADE ,
	idDichVu varchar(10) foreign key references DichVu(idDichVu)
	ON DELETE CASCADE  ON UPDATE CASCADE ,
	soLuongNhap int not null,
	giaNhap money not null,
	primary key( maPN,idDichVu),
	createddate Datetime NULL,
	modifieddate datetime NULL,
	createdby nVARCHAR(255) NULL,
	modifiedby nVARCHAR(255) NULL
	);

set dateformat ymd
INSERT INTO role (roleId, name, code, createddate, modifieddate, createdby, modifiedby)
VALUES
(1, N'Admin', 'ADMIN', '2024-04-06 10:00:00.000', NULL, NULL, NULL),
(2, N'Nhân viên/Bác sĩ', 'STAFF', '2024-04-07 10:00:00.000', NULL, NULL, NULL),
(3, N'Khách hàng đã có tài khoản', 'REGISTERED_CUSTOMER', '2024-04-08 10:00:00.000', NULL, NULL, NULL);


INSERT INTO Users (idUser, userName, password, tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, thongTinUser, createddate, createdby, modifieddate, modifiedby, status)
VALUES
('AD001', 'admin123', '123', N'Phạm Thị Thu Nguyệt', N'Người quản trị hệ thống', N'Nữ', '1975-03-07', '0542369147', 'admin123@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('AD002', 'admin', '123', N'Nguyễn Văn Linh', N'Người quản trị hệ thống', N'Nam', '2004-11-05', '0542369147', 'admin123@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('AD003', 'admin124', '123', N'Lưu Ngọc Yến Như', N'Người quản trị hệ thống', N'Nữ', '1975-03-07', '0542369147', 'admin123@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('AD004', 'admin125', '123', N'Lê Hòa', N'Người quản trị hệ thống', N'Nam', '2004-11-05', '0542369147', 'admin123@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('AD005', 'admin126', '123', N'Nguyễn Thị Hiếu', N'Người quản trị hệ thống', N'Nữ', '1975-03-07', '0542369147', 'admin123@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS001', 'nva0101', '12345678', N'Nguyễn Văn An', N'Bác sĩ phẫu thuật', 'Nam', '1980-01-01', '0912345678', 'vanan@gmail.com', N'Bác sĩ 10 năm kinh nghiệm', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS002', 'ltb0510', '12345678', N'Lê Thị Bình', N'Bác sĩ chăm sóc', N'Nữ', '1990-05-10', '0987654321', 'binhle@gmail.com', N'Chuyên sâu về phẫu thuật thú y', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS003', 'tmc1225', '12345678', N'Trần Minh Cường', N'Bác sĩ khám bệnh', 'Nam', '1985-12-25', '0909876543', 'minhctran@gmail.com', N'Chuyên gia điều trị bệnh lý cho thú cưng', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS004', 'pnd0314', '12345678', N'Phạm Ngọc Dung', N'Bác sĩ khám bệnh', N'Nữ', '1995-03-14', '0387654321', 'dungpham@gmail.com', N'Nhiệt tình và chăm sóc chu đáo', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS005', 'dbr0707', '12345678', N'David Brown', N'Bác sĩ chăm sóc', 'Nam', '1978-07-07', '0945612378', 'davidbrown@gmail.com', N'Bác sĩ nước ngoài có kinh nghiệm', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('BS006', 'tth0930', '12345678', N'Trần Thị Hương', N'Bác sĩ phẫu thuật', N'Nữ', '1992-09-30', '0978123456', 'huongtran@gmail.com', N'Bác sĩ trẻ năng động', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS007', 'hvt0325', '12345678', N'Huỳnh Văn Tài', N'Bác sĩ chăm sóc', 'Nam', '1982-03-25', '0888123456', 'taivh@gmail.com', N'Bác sĩ giàu kinh nghiệm', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS008', 'ntm1210', '12345678', N'Nguyễn Thị Mai', N'Bác sĩ khám bệnh', N'Nữ', '1988-12-10', '0967123456', 'mainguyen@gmail.com', N'Bác sĩ chuyên về y học tự nhiên', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS009', 'lhp0620', '12345678', N'Lý Hồng Phúc', N'Bác sĩ chăm sóc', 'Nam', '1991-06-20', '0913123456', 'phuclyhong@gmail.com', N'Bác sĩ tận tâm với bệnh nhân', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS010', 'dth1105', '12345678', N'Đỗ Thu Hà', N'Bác sĩ khám bệnh', N'Nữ', '1984-11-05', '0956123456', 'hado@gmail.com', N'Bác sĩ có tư duy sáng tạo', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS011', 'tvt0415', '12345678', N'Trần Văn Tuấn', N'Bác sĩ chăm sóc', 'Nam', '1993-04-15', '0981123456', 'tuantran@gmail.com', N'Bác sĩ chuyên môn cao', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS012', 'ptn0228', '12345678', N'Phạm Thị Ngọc', N'Bác sĩ khám bệnh', N'Nữ', '1997-02-28', '0934123456', 'ngocpham@gmail.com', N'Bác sĩ nhiệt tình với mục tiêu', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS013','nhn1012', '12345678', N'Nguyễn Hữu Nam', N'Bác sĩ phẫu thuật', 'Nam', '1989-10-12', '0946123456', 'namnh@gmail.com', N'Bác sĩ chuyên sâu ve xét nghiệm thú y', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS014', 'lqh0822', '12345678', N'Lê Quang Huy', N'Bác sĩ khám bệnh', 'Nam', '1986-08-22', '0909123456', 'huylq@gmail.com', N'Bác sĩ có kinh nghiệm làm việc tại các trung tâm lớn', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS015', 'dtt0518', '12345678', N'Đặng Thị Trang', N'Bác sĩ khám bệnh', N'Nữ', '1994-05-18', '0982123456', 'trangdt@gmail.com', N'Bác sĩ chuyên gia phòng tránh bệnh tật', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS016', 'vvl0518', '12345678', N'Vũ Văn Long', N'Bác sĩ phẫu thuật', 'Nam', '1990-11-08', '0972123456', 'longvv@gmail.com', N'Bác sĩ tận tâm với nghề nghiệp', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS017', 'nth0302', '12345678', N'Nguyễn Thị Hương', N'Bác sĩ khám bệnh', N'Nữ', '1987-03-02', '0922123456', 'huongnt@gmail.com', N'Bác sĩ nhiệt huyết với thú cưng', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS018', 'tvh0914', '12345678', N'Trần Văn Hải', N'Bác sĩ phẫu thuật', 'Nam', '1979-09-14', '0912123456', 'haitv@gmail.com', N'Bác sĩ kinh nghiệm lâu năm trong nghề', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS019', 'pnt1203', '12345678', N'Phạm Ngọc Trâm', N'Bác sĩ chăm sóc', N'Nữ', '1998-12-03', '0952123456', 'tramngoc@gmail.com', N'Bác sĩ năng động với tinh thần trách nhiệm', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('BS020', 'nvh0609', '12345678', N'Nguyễn Văn Hoàng', N'Bác sĩ phẫu thuật', 'Nam', '1983-06-09', '0962123456', 'hoangnv@gmail.com', N'Bác sĩ chuyên về cải thiện chất lượng cuộc sống cho thú cưng', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),

('NV001','lnyn0815','12345678', N'Lưu Ngọc Yến Như', N'Nhân viên chăm sóc thú cưng', N'Nữ', '1992-08-15', '0912345678', 'yennhu@gmail.com', N'Nhân viên chăm chỉ và nhiệt tình', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('NV002','nth0325','12345678',N'Nguyễn Thị Hiếu', N'Nhân viên phục vụ', N'Nữ', '1990-03-25', '0987654321', 'hieuthi@gmail.com', N'Nhân viên có kinh nghiệm trong ngành hàng tiêu dùng', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('NV003','lh1120','12345678',N'Lê Hòa', N'Nhân viên chăm sóc thú cưng', 'Nam', '1988-11-20', '0901234567', 'hoale@gmail.com', N'Yêu thú cưng và có kỹ năng tốt trong việc chăm sóc chúng', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('NV004','pttn0508','12345678',N'Phạm Thị Thu Nguyệt', N'Nhân viên bán hàng', N'Nữ', '1995-05-08', '0356789123', 'nguyetpham@gmail.com', N'Nhiệt tình và thân thiện với khách hàng', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('NV005','nvl1210','12345678', N'Nguyễn Văn Linh', N'Nhân viên dắt thú đi dạo', 'Nam', '1983-12-10', '0945678912', 'linhnguyen@gmail.com', N'Nhân viên có sức khỏe tốt, thường xuyên vận động và giao tiếp tốt với thú cưng', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('NV006','hvt0228','12345678', N'Hoàng Văn Tâm', N'Nhân viên phục vụ', 'Nam', '1993-02-28', '0976543210', 'tamhv@gmail.com', N'Nhân viên nhiệt tình và thân thiện', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('NV007','dth0710','12345678', N'Đỗ Thị Hương', N'Nhân viên chăm sóc thú cưng', N'Nữ', '1991-07-10', '0965432109', 'huongdo@gmail.com', N'Yêu thú cưng và có kiến thức vững trong chăm sóc', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('NV008','tvq0415','12345678', N'Trần Văn Quân', N'Nhân viên bán hàng', 'Nam', '1985-04-15', '0987654321', 'quantran@gmail.com', N'Kỹ năng giao tiếp tốt và am hiểu về sản phẩm', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('NV009','nth1023','12345678', N'Nguyễn Thị Hạnh', N'Nhân viên dắt thú đi dạo', N'Nữ', '1994-10-23', '0956781234', 'hanhnt@gmail.com', N'Yêu thú cưng và tận tâm với công việc', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV010','lvd0918','12345678', N'Lê Văn Đức', N'Nhân viên chăm sóc thú cưng', 'Nam', '1990-09-18', '0945678123', 'ducle@gmail.com', N'Chăm sóc thú cưng như người thân', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV011','ntn1205','12345678', N'Nguyễn Thị Nga', N'Nhân viên phục vụ', N'Nữ', '1987-12-05', '0934567812', 'nganga@gmail.com', N'Kinh nghiệm làm việc trong ngành dịch vụ', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV012','tvd0520','12345678', N'Trần Văn Đạt', N'Nhân viên bán hàng', 'Nam', '1992-05-20', '0923456781', 'datvt@gmail.com', N'Tận tâm và uy tín trong công việc', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV013','hth0830','12345678', N'Hoàng Thị Hồng', N'Nhân viên dắt thú đi dạo', N'Nữ', '1989-08-30', '0912345678', 'honght@gmail.com', N'Yêu thú cưng và có kỹ năng dạy dỗ tốt', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV014','pva0314','12345678', N'Phan Văn Anh', N'Nhân viên phục vụ', 'Nam', '1986-03-14', '0987654321', 'anhpv@gmail.com', N'Tinh thần trách nhiệm và sáng tạo trong công việc', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV015','btm0208','12345678', N'Bùi Thị My', N'Nhân viên chăm sóc thú cưng', N'Nữ', '1996-02-08', '0956781234', 'mybt@gmail.com', N'Đam mê với công việc và sẵn lòng học hỏi', '2024-04-06 10:00:00.000', 'ADMIN',NULL,NULL,0),
('NV016','lvm0925','12345678', N'Lý Văn Minh', N'Nhân viên bán hàng', 'Nam', '1991-09-25', '0945678123', 'minhlv@gmail.com', N'Kỹ năng giao tiếp tốt và am hiểu về sản phẩm', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV017','ntt0412','12345678', N'Nguyễn Thị Thúy', N'Nhân viên dắt thú đi dạo', N'Nữ', '1988-04-12', '0934567812', 'thuynt@gmail.com', N'Yêu thú cưng và có kỹ năng dạy dỗ tốt', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV018','pvb1105','12345678', N'Phạm Văn Bình', N'Nhân viên phục vụ', 'Nam', '1983-11-05', '0923456781', 'binhvp@gmail.com', N'Tận tâm và uy tín trong công việc', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV019','ttk0620','12345678', N'Trần Trung Kiên', N'Nhân viên chăm sóc thú cưng', 'Nam', '1990-06-20', '0912345678', 'kientt@gmail.com', N'Kỹ năng chăm sóc thú cưng tuyệt vời', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('NV020','dtn1203','12345678', N'Đinh Thị Ngọc', N'Nhân viên bán hàng', N'Nữ', '1997-12-03', '0987654321', 'ngocdt@gmail.com', N'Năng động và sáng tạo trong công việc', '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),

('KH001','nth0515','12345678', N'Nguyễn Thị Hương', N'Khách hàng thân thiết', N'Nữ', '1987-05-15', '0987654321', 'huongnguyen@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH002','tvn1120','12345678', N'Trần Văn Nam', N'Khách hàng mới', N'Nam', '1990-11-20', '0976543210', 'namtran@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH003','ltm0810','12345678', N'Lê Thị Mai', N'Khách hàng thân thiết', N'Nữ', '1985-08-10', '0912345678', 'maile@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('KH004','pmt0325','12345678', N'Phạm Minh Tuấn', N'Khách hàng mới', N'Nam', '1995-03-25', '0356789123', 'tuanpham@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH005','nta1230','12345678', N'Nguyễn Thị Anh', N'Khách hàng thân VIP', N'Nữ', '1980-12-30', '0945678912', 'anhnguyen@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH006','hvh0228','12345678', N'Hoàng Văn Hùng', N'Khách hàng mới', 'Nam', '1992-02-28', '0976543210', 'hunghv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH007','dth0710','12345678', N'Đỗ Thị Hạnh', N'Khách hàng thân thiết', N'Nữ', '1991-07-10', '0965432109', 'hanhdo@gmail.com', NULL,'2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH008','tvb0415','12345678', N'Trần Văn Bình', N'Khách hàng mới', 'Nam', '1985-04-15', '0987654321', 'binhtran@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH009','nvq1023','12345678', N'Nguyễn Văn Quang', N'Khách hàng thân VIP', 'Nam', '1994-10-23', '0956781234', 'quangnv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH010','lth0918','12345678', N'Lê Thị Hoa', N'Khách hàng thân thiết', N'Nữ', '1990-09-18', '0945678123', 'hoalt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH011','ntn1205','12345678', N'Nguyễn Thị Nhung', N'Khách hàng mới', N'Nữ', '1987-12-05', '0934567812', 'nhungnt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH012','tvk0520','12345678', N'Trần Văn Kiên', N'Khách hàng thân thiết', 'Nam', '1992-05-20', '0923456781', 'kientv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH013','hth0830','12345678', N'Hoàng Thị Hòa', N'Khách hàng mới', N'Nữ', '1989-08-30', '0912345678', 'hoath@gmail.com', NULL,'2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH014','pva0314','12345678', N'Phan Văn An', N'Khách hàng thân VIP', 'Nam', '1986-03-14', '0987654321', 'anpv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH015','btl0208','12345678', N'Bùi Thị Linh', N'Khách hàng mới', N'Nữ', '1996-02-08', '0956781234', 'linhbt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH016','lvm0925','12345678', N'Lý Văn Minh', N'Khách hàng thân thiết', 'Nam', '1991-09-25', '0945678123', 'minhlv@gmail.com', NULL,'2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH017','ntd0412','12345678', N'Nguyễn Thị Dung', N'Khách hàng mới', N'Nữ', '1988-04-12', '0934567812', 'dungnt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH018','pvb1105','12345678', N'Phạm Văn Bích', N'Khách hàng thân VIP', 'Nam', '1983-11-05', '0923456781', 'bichpv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH019','ttk0620','12345678', N'Tran Trung Khoa', N'Khách hàng mới', 'Nam', '1990-06-20', '0912345678', 'khoatt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('KH020','dtn1204','12345678', N'Đinh Thị Ngọc', N'Khách hàng thân thiết', N'Nữ', '1997-12-04', '0987654321', 'ngocdt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH021','nvh0815','12345678', N'Nguyễn Văn Hải', N'Khách hàng mới', 'Nam', '1992-08-15', '0912345678', 'hainv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('KH022','ntt0325','12345678', N'Nguyễn Thị Thảo', N'Khách hàng thân thiết', N'Nữ', '1990-03-25', '0987654321', 'thaont@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH023','lhb1120','12345678', N'Lê Hữu Bình', N'Khách hàng mới', 'Nam', '1988-11-20', '0901234567', 'binhle@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('KH024','ttl0508','12345678', N'Trần Thị Lý', N'Khách hàng thân VIP', N'Nữ', '1995-05-08', '0356789123', 'lytt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH025','nvh1210','12345678', N'Nguyễn Văn Hòa', N'Khách hàng mới', 'Nam', '1983-12-10', '0945678912', 'hoanv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH026','ptv0918','12345678', N'Phạm Thị Vân', N'Khách hàng thân thiết', N'Nữ', '1997-09-18', '0945678123', 'vanpt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 0),
('KH027','nvn1205','12345678', N'Nguyễn Văn Nam', N'Khách hàng mới', 'Nam', '1987-12-05', '0934567812', 'namnv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH028','btn0314','12345678', N'Bùi Thị Ngân', N'Khách hàng thân VIP', N'Nữ', '1986-03-14', '0987654321', 'nganbt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH029','lvl0208','12345678', N'Lý Văn Long', N'Khách hàng mới', 'Nam', '1996-02-08', '0956781234', 'longlv@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1),
('KH030','ttt0925','12345678', N'Tran Trung Tín', N'Khách hàng thân thiết', 'Nam', '1991-09-25', '0945678123', 'tintt@gmail.com', NULL, '2024-04-06 10:00:00.000', 'ADMIN', NULL, NULL, 1);


insert into role_User
values
(1,'AD001'),
(1,'AD002'),
(1,'AD003'),
(1,'AD004'),
(1,'AD005'),
(2,'BS001'),
(2,'BS002'),
(2,'BS003'),
(2,'BS004'),
(2,'BS005'),
(2,'BS006'),
(2,'BS007'),
(2,'BS008'),
(2,'BS009'),
(2,'BS010'),
(2,'BS011'),
(2,'BS012'),
(2,'BS013'),
(2,'BS014'),
(2,'BS015'),
(2,'BS016'),
(2,'BS017'),
(2,'BS018'),
(2,'BS019'),
(2,'BS020'),
(2,'NV001'),
(2,'NV002'),
(2,'NV003'),
(2,'NV004'),
(2,'NV005'),
(2,'NV006'),
(2,'NV007'),
(2,'NV008'),
(2,'NV009'),
(2,'NV010'),
(2,'NV011'),
(2,'NV012'),
(2,'NV013'),
(2,'NV014'),
(2,'NV015'),
(2,'NV016'),
(2,'NV017'),
(2,'NV018'),
(2,'NV019'),
(2,'NV020'),
(3,'KH001'),
(3,'KH002'),
(3,'KH003'),
(3,'KH004'),
(3,'KH005'),
(3,'KH006'),
(3,'KH007'),
(3,'KH008'),
(3,'KH009'),
(3,'KH010'),
(3,'KH011'),
(3,'KH012'),
(3,'KH013'),
(3,'KH014'),
(3,'KH015'),
(3,'KH016'),
(3,'KH017'),
(3,'KH018'),
(3,'KH019'),
(3,'KH020'),
(3,'KH021'),
(3,'KH022'),
(3,'KH023'),
(3,'KH024'),
(3,'KH025'),
(3,'KH026'),
(3,'KH027'),
(3,'KH028'),
(3,'KH029'),
(3,'KH030')

INSERT INTO ThuCung (idThuCung, tenThuCung, gioiTinh, loaiThuCung, tuoi, createddate, modifieddate, createdby, modifiedby)
VALUES
('TC001', 'Bobby', N'Đực', N'Mèo Tiffanie', 3, '2024-04-08 10:00:00.000', NULL,'KH001' , NULL),
('TC002', 'Coco', N'Cái', N'Mèo Tonkinese', 2, '2024-04-08 10:00:00.000', NULL, 'KH002', NULL),
('TC003', 'Max', N'Đực', N'Mèo Siberian', 4, '2024-04-08 10:00:00.000', NULL, 'KH003', NULL),
('TC004', 'Luna', N'Cái', N'Mèo Singapura', 1, '2024-04-08 10:00:00.000', NULL, 'KH004', NULL),
('TC005', 'Rocky', N'Đực', N'Mèo Somaly', 5, '2024-04-08 10:00:00.000', NULL, 'KH005', NULL),
('TC006', 'Misty', N'Cái', N'Mèo Maine Coon', 2, '2024-04-08 10:00:00.000', NULL, 'KH006', NULL),
('TC007', 'Leo', N'Đực', N'Mèo Ragdoll', 3, '2024-04-08 10:00:00.000', NULL, 'KH007', NULL),
('TC008', 'Sophie', N'Cái', N'Mèo Scottish Fold', 4, '2024-04-08 10:00:00.000', NULL, 'KH008', NULL),
('TC009', 'Shadow', N'Đực', N'Mèo Siamese', 1, '2024-04-08 10:00:00.000', NULL, 'KH009', NULL),
('TC010', 'Bella', N'Cái', N'Mèo British Shorthair', 5, '2024-04-08 10:00:00.000', NULL, 'KH0010', NULL),
('TC011', 'Simba', N'Đực', N'Mèo Bengal', 2, '2024-04-08 10:00:00.000', NULL, 'KH0011', NULL),
('TC012', 'Lola', N'Cái', N'Mèo Persian', 3, '2024-04-08 10:00:00.000', NULL, 'KH0012', NULL),
('TC013', 'Oscar', N'Đực', N'Mèo Siamese', 4, '2024-04-08 10:00:00.000', NULL, 'KH0013', NULL),
('TC014', 'Lucy', N'Cái', N'Mèo Russian Blue', 1, '2024-04-08 10:00:00.000', NULL, 'KH0014', NULL),
('TC015', 'Tiger', N'Đực', N'Mèo Exotic Shorthair', 5, '2024-04-08 10:00:00.000', NULL, 'KH0015', NULL),
('TC016', 'Milo', N'Đực', N'Mèo Birman', 2, '2024-04-08 10:00:00.000', NULL, 'KH0016', NULL),
('TC017', 'Zoe', N'Cái', N'Mèo Abyssinian', 3, '2024-04-08 10:00:00.000', NULL, 'KH0017', NULL),
('TC018', 'Gizmo', N'Đực', N'Mèo Sphynx', 4, '2024-04-08 10:00:00.000', NULL, 'KH0018', NULL),
('TC019', 'Chloe', N'Cái', N'Mèo Oriental', 1, '2024-04-08 10:00:00.000', NULL, 'NV001', NULL),
('TC020', 'Charlie', N'Đực', N'Mèo Burmese', 5, '2024-04-08 10:00:00.000', NULL, 'NV002', NULL),
('TC021', 'Molly', N'Cái', N'Mèo Tonkinese', 2, '2024-04-08 10:00:00.000', NULL, 'NV003', NULL),
('TC022', 'Jack', N'Đực', N'Mèo Scottish Fold', 3, '2024-04-08 10:00:00.000', NULL, 'NV004', NULL),
('TC023', 'Lily', N'Cái', N'Mèo Maine Coon', 4, '2024-04-08 10:00:00.000', NULL, 'NV005', NULL),
('TC024', 'Buddy', N'Đực', N'Mèo Siamese', 1, '2024-04-08 10:00:00.000', NULL, 'NV006', NULL),
('TC025', 'Daisy', N'Cái', N'Mèo Russian Blue', 5, '2024-04-08 10:00:00.000', NULL, 'NV007', NULL),
('TC026', 'Rocky', N'Đực', N'Mèo Persian', 2, '2024-04-08 10:00:00.000', NULL, 'NV008', NULL),
('TC027', 'Luna', N'Cái', N'Mèo Ragdoll', 3, '2024-04-08 10:00:00.000', NULL, 'NV009', NULL),
('TC028', 'Milo', N'Đực', N'Mèo Bengal', 4, '2024-04-08 10:00:00.000', NULL, 'NV0010', NULL),
('TC029', 'Sasha', N'Cái', N'Mèo Exotic Shorthair', 1, '2024-04-08 10:00:00.000', NULL, 'NV0011', NULL),
('TC030', 'Cooper', N'Đực', N'Mèo British Shorthair', 5, '2024-04-08 10:00:00.000', NULL, 'NV0012', NULL);

INSERT INTO DonHang (maDonHang, idKhachHang, sdtGiaoHang,diaChiGiaoHang, ngayGiaoHang, phThucThanhToan, ngayThanhToan, trangThai, createddate, modifieddate, createdby, modifiedby)
VALUES
('DH001', 'KH001', '0987654321',null, '2024-02-15 08:00:00.000', N'Thanh toán chuyển khoản', '2024-02-15 08:00:00.000', N'Đã thanh toán', '2024-01-04 09:00:00.000', NULL, 'NV001', NULL),
('DH002', 'KH002', '0976543210',null, '2024-02-16 09:00:00.000', N'Thanh toán chuyển khoản', '2024-02-16 09:00:00.000', N'Đã thanh toán', '2024-01-04 10:00:00.000', NULL, 'NV001', NULL),
('DH003', 'KH003', '0912345678',N'48 Cao Thắng - Thanh Bình - Hải Châu', '2024-02-17 10:00:00.000', N'Thanh toán khi nhân hàng', null, N'Chưa thanh toán', '2024-04-05 11:00:00.000', NULL, 'NV002', NULL),
('DH004', 'KH004', '0356789123',N'48 Ông Ích Khiêm - Thanh Bình - Hải Châu', '2024-02-18 11:00:00.000', N'Thanh toán khi nhân hàng',null, N'Chưa thanh toán', '2024-04-05 12:00:00.000', NULL, 'NV002', NULL),
('DH005', 'KH005', '0945678912',N'48 Dinh Tiên Hoàng - Thanh Bình - Hải Châu', '2024-02-19 12:00:00.000', N'Thanh toán chuyển khoản', '2024-02-19 12:00:00.000', N'Đã thanh toán', '2024-04-07 13:00:00.000', NULL, 'NV001', NULL),
('DH006', 'KH010', '0123456789',N'56 Hoàng Hoa Thám - Thanh Bình - Hải Châu', '2024-02-20 13:00:00.000', N'Thanh toán khi nhân hàng', null, N'Chưa thanh toán', '2024-04-08 14:00:00.000', NULL, 'NV003', NULL),
('DH007', 'KH012', '0234567891',N'42/1/2 Thanh Hải - Thanh Bình - Hải Châu', '2024-02-21 14:00:00.000', N'Thanh toán chuyển khoản', null, N'Chưa thanh toán', '2024-04-10 15:00:00.000', NULL, 'NV003', NULL),
('DH008', 'KH013', '0345678912',N'48 Thanh Thủy - Thanh Bình - Hải Châu', '2024-02-22 15:00:00.000', N'Thanh toán khi nhân hàng',null, N'Chưa thanh toán', '2024-04-13 16:00:00.000', NULL, 'NV005', NULL),
('DH009', 'KH013', '0456789123',N'48 Thang Long - Thanh Bình - Hải Châu', '2024-02-23 16:00:00.000', N'Thanh toán chuyển khoản', '2024-02-23 16:00:00.000', N'Đã thanh toán', '2024-04-15 17:00:00.000', NULL, 'NV006', NULL),
('DH010', 'KH014', '0567891234',N'42 Mai Lão Bạng - Thuận Phước - Hải Châu', '2024-02-24 17:00:00.000', N'Thanh toán chuyển khoản', '2024-02-24 17:00:00.000', N'Đã thanh toán', '2024-04-15 18:00:00.000', NULL,'NV007', NULL),
('DH011', 'KH014', '0678912345',N'213 Cao Lầu - Thanh Bình - Hải Châu', '2024-02-25 18:00:00.000', N'Thanh toán khi nhân hàng',null, N'Chưa thanh toán', '2024-04-15 19:00:00.000', NULL, 'NV001', NULL),
('DH012', 'KH015', '0789123456',N'22 Mai Am - Thuận Phước- Hải Châu', '2024-02-26 19:00:00.000', N'Thanh toán chuyển khoản', '2024-02-26 19:00:00.000', N'Đã thanh toán', '2024-04-15 20:00:00.000', NULL, 'NV008', NULL),
('DH013', 'KH025', '0891234567',N'48 Cao Văn Lâm - Thanh Bình - Hải Châu', '2024-02-27 20:00:00.000', N'Thanh toán chuyển khoản', '2024-02-27 20:00:00.000', N'Đã thanh toán', '2024-04-16 21:00:00.000', NULL, 'NV009', NULL),
('DH014', 'KH011', '0902345674',N'48 Hoàng Diệu - Cẩm Lệ', '2024-02-28 21:00:00.000', N'Thanh toán chuyển khoản', '2024-02-28 21:00:00.000', N'Đã thanh toán', '2024-04-20 22:00:00.000', NULL, 'NV0010', NULL),
('DH015', 'KH012', '0913456781',N'66 Dũng Sĩ- Thanh Khê', '2024-02-29 22:00:00.000', N'Thanh toán khi nhận hàng', NULL, N'Chưa thanh toán', '2024-04-25 23:00:00.000', NULL, 'NV011', NULL),
('DH016', 'KH013', '0024567894',N'1 Cao Thắng - Lương Nhữ Học - Liên Chiểu', '2024-03-01 23:00:00.000', N'Thanh toán chuyển khoản','2024-03-01 23:00:00.000', N'Đã thanh toán', '2024-04-25 00:00:00.000', NULL, 'NV005', NULL),
('DH017', 'KH014', '0135678917',N'4 Tòa nhà số 3- Nam Từ Liêm Hà Nội', '2024-03-02 00:00:00.000', N'Thanh toán khi nhận hàng', NULL, N'Chưa thanh toán', '2024-04-27 01:00:00.000', NULL, 'NV005', NULL),
('DH019', 'KH011', '0357891230', null, '2024-03-04 01:00:00.000', N'Thanh toán chuyển khoản', '2024-03-04 01:00:00.000', N'Đã thanh toán', '2024-04-27 02:00:00.000', NULL, 'NV004', NULL),
('DH020', 'KH022', '0468912341',null, '2024-03-05 02:00:00.000', NULL, NULL, N'Đã hủy', '2024-03-01 03:00:00.000', NULL, 'NV006', NULL),
('DH021', 'KH030', '0579123454',null, '2024-03-06 03:00:00.000', NULL, NULL, N'Đã hủy', '2024-03-01 04:00:00.000', NULL, 'NV005', NULL),
('DH022', 'KH014', '0680234566',null, '2024-03-07 04:00:00.000', NULL, NULL, N'Đã hủy', '2024-03-01 05:00:00.000', NULL, 'NV004', NULL),
('DH023', 'KH025', '0791345677',null, '2024-03-08 05:00:00.000', NULL, NULL, N'Đã hủy', '2024-03-04 06:00:00.000', NULL, 'NV002', NULL),
('DH024', 'KH015', '0902456781',null, '2024-03-09 06:00:00.000', NULL, NULL, N'Đã hủy', '2024-03-04 07:00:00.000', NULL, 'NV003', NULL),
('DH025', 'KH023', '0013567897',null, '2024-03-10 07:00:00.000', NULL, NULL, N'Đã hủy', '2024-03-04 08:00:00.000', NULL, 'NV008', NULL),
('DH026', 'KH030', '0124678915',null, '2024-03-11 08:00:00.000', NULL, NULL, N'Đã hủy', '2024-03-04 09:00:00.000', NULL, 'NV004', NULL),
('DH027', 'KH024', '0235789122',null, '2024-03-12 09:00:00.000', NULL, NULL, N'Đã hủy', '2024-03-05 10:00:00.000', NULL, 'NV001', NULL);


INSERT INTO DichVu (idDichVu, tenDichVu, donGia, thuongHieu, loaiSanPham, soLuongHienCon, soLuongDaBan, donViTinh, createddate, modifieddate, createdby, modifiedby)
VALUES
('DV001', N'Kiểm tra sức khỏe cơ bản', 150000, 'Pet Take Care', N'Chăm sóc thú cưng', 0, 50, N'Lần', '2024-04-05 08:00:00.000', NULL, NULL, NULL),
('DV002', N'Tiêm phòng', 200000, 'Pet Take Care', N'Chăm sóc thú cưng', 0, 15, N'Lần', '2024-04-05 09:00:00.000', NULL, NULL, NULL),
('DV003', N'Đặt đơn đi dạo', 1000000,'Pet Take Care', N'Chăm sóc thú cưng', 0, 40, N'Lần', '2024-04-05 10:00:00.000',NULL, NULL, NULL),
('DV004', N'Giữ và chăm sóc', 250000, 'Pet Take Care', N'Chăm sóc thú cưng', 0, 58, N'Lần', '2024-04-05 11:00:00.000', NULL, NULL, NULL),
('DV005', N'Cát đậu nành', 250000, 'Miso', N'Cát vệ sinh', 12, 4, N'Bịch', '2024-04-05 12:00:00.000', NULL, NULL, NULL),
('DV006', N'Cát gỗ', 136000, 'Love Sand', N'Cát vệ sinh', 18, 6, N'Bịch', '2024-04-05 13:00:00.000', NULL, NULL, NULL),
('DV007', N'Yếm họa tiết cute cho Boss', 45000, 'Handmade', N'Phụ kiện', 20, 14, N'Cái', '2024-04-05 14:00:00.000', NULL, NULL, NULL),
('DV008', N'Sữa tắm SOS', 379000, 'SOS', N'Mỹ phẩm & Làm đẹp', 18, 8, N'Chai', '2024-04-05 15:00:00.000', NULL, NULL, NULL),
('DV009', N'Kem đánh răng nhỏ', 71000, N'Toothpaste', N'Mỹ phẩm & Làm đẹp', 19, 4, N'Tuýp', '2024-04-05 16:00:00.000', NULL, NULL, NULL),
('DV010', N'Sữa Bio-Milk 100g', 164000, N'Bio-Milk', N'Thực phẩm', 12, 4, N'Bịch', '2024-04-05 17:00:00.000', NULL, NULL, NULL),
('DV011', N'Tiếp sức sinh lý', 180000, N'VitaPlus', N'Thực phẩm', 0, 10, N'Hộp', '2024-04-06 08:00:00.000', NULL, NULL, NULL),
('DV012', N'Tắm cho Boss', 300000, N'BathCare', N'Dịch vụ', 0, 5, N'Lần', '2024-04-06 09:00:00.000', NULL, NULL, NULL),
('DV013', N'Kiểm tra sức khỏe nâng cao', 250000, N'Health Plus', N'Dịch vụ y tế', 0, 2, N'Lần', '2024-04-06 10:00:00.000', NULL, NULL, NULL),
('DV014', N'Đặt đơn giao hàng', 120000, N'Fast Delivery', N'Dịch vụ giao hàng', 25, 10, N'Lần', '2024-04-06 11:00:00.000', NULL, NULL, NULL),
('DV015', N'Khử mùi chó mèo', 95000, N'FreshPets', N'Chăm sóc thú cưng', 30, 15, N'Lọ', '2024-04-06 12:00:00.000', NULL, NULL, NULL),
('DV016', N'Chăm sóc sức khỏe cho mèo', 180000, N'Pet Health', N'Chăm sóc thú cưng', 20, 5, N'Lần', '2024-04-07 08:00:00.000', NULL, NULL, NULL),
('DV017', N'Tắm gội cho mèo', 120000, N'Pet Spa', N'Chăm sóc thú cưng', 25, 8, N'Lần', '2024-04-07 09:00:00.000', NULL, NULL, NULL),
('DV018', N'Đặt khay vệ sinh cho mèo', 85000, N'Cat Litter', N'Chăm sóc thú cưng', 30, 12, N'Lần', '2024-04-07 10:00:00.000', NULL, NULL, NULL),
('DV019', N'Kiểm tra sức khỏe định kỳ cho mèo', 220000, N'Pet Check-Up', N'Chăm sóc thú cưng', 0, 3, N'Lần', '2024-04-07 11:00:00.000', NULL, NULL, NULL),
('DV020', N'Tiêm phòng cho mèo', 150000, N'Pet Vaccination', N'Chăm sóc thú cưng', 0, 7, N'Lần', '2024-04-07 12:00:00.000', NULL, NULL, NULL),
('DV021', N'Cắt tỉa móng cho mèo', 75000, N'Pet Nail Trimming', N'Chăm sóc thú cưng', 0, 6, N'Lần', '2024-04-07 13:00:00.000', NULL, NULL, NULL),
('DV022', N'Khám bệnh cấp cứu cho mèo', 300000, N'Emergency Vet Visit', N'Chăm sóc thú cưng', 0, 2, N'Lần', '2024-04-07 14:00:00.000', NULL, NULL, NULL),
('DV023', N'Chăm sóc sau phẫu thuật cho mèo', 280000, N'Post-Surgery Pet Care', N'Chăm sóc thú cưng', 0, 3, N'Lần', '2024-04-07 15:00:00.000', NULL, NULL, NULL),
('DV024', N'Cho mèo vận chuyển', 200000, N'Pet Transportation', N'Chăm sóc thú cưng', 0, 5, N'Lần', '2024-04-07 16:00:00.000', NULL, NULL, NULL),
('DV025', N'Chế độ ăn dặm cho mèo con', 120000, N'Kitten Diet Plan', N'Chăm sóc thú cưng', 0, 10, N'Lần', '2024-04-08 08:00:00.000', NULL, NULL, NULL),
('DV026', N'Khám sức khỏe ban đầu cho mèo con', 180000, N'Kitten Health Check', N'Chăm sóc thú cưng', 0, 5, N'Lần', '2024-04-08 09:00:00.000', NULL, NULL, NULL),
('DV027', N'Chăm sóc thai cho mèo mẹ', 250000, N'Pregnant Cat Care', N'Chăm sóc thú cưng', 0, 2, N'Lần', '2024-04-08 10:00:00.000', NULL, NULL, NULL),
('DV028', N'Thải độc cho mèo', 100000, N'Pet Detox', N'Chăm sóc thú cưng', 25, 9, N'Lần', '2024-04-08 11:00:00.000', NULL, NULL, NULL),
('DV029', N'Chăm sóc sau sinh cho mèo mẹ', 220000, N'Postnatal Cat Care', N'Chăm sóc thú cưng', 0, 4, N'Lần', '2024-04-08 12:00:00.000', NULL, NULL, NULL),
('DV030', N'Đặt phòng cho mèo trong nhà trọ', 150000, N'Pet Boarding', N'Chăm sóc thú cưng', 0, 6, N'Lần', '2024-04-08 13:00:00.000', NULL, NULL, NULL);





INSERT INTO ChiTietDonHang (maDonHang, idDichVu, idBacSi, idNhanVien, soLuong, createddate, modifieddate, createdby, modifiedby)
VALUES
('DH001', 'DV001', 'BS001', 'NV002', 1, '2024-01-04 09:00:00.000', NULL, NULL, NULL),
('DH001', 'DV005', NULL, 'NV004', 1, '2024-01-04 09:00:00.000', NULL, NULL, NULL),
('DH001', 'DV007', NULL, 'NV008', 3, '2024-01-04 09:00:00.000', NULL, NULL, NULL),
('DH002', 'DV004', 'BS005', 'NV001', 1, '2024-01-04 10:00:00.000', NULL, NULL, NULL),
('DH002', 'DV006', NULL, 'NV012', 2, '2024-01-04 10:00:00.000', NULL, NULL, NULL),
('DH003', 'DV003', NULL, 'NV005', 2, '2024-04-05 11:00:00.000', NULL, NULL, NULL),
('DH004', 'DV005', NULL, 'NV016', 2, '2024-04-05 12:00:00.000', NULL, NULL, NULL),
('DH004', 'DV009', NULL, 'NV020', 5, '2024-04-05 12:00:00.000', NULL, NULL, NULL),
('DH004', 'DV010', NULL, 'NV004', 3, '2024-04-05 12:00:00.000', NULL, NULL, NULL),
('DH005', 'DV002', 'BS003', 'NV003', 1, '2024-04-07 13:00:00.000', NULL, NULL, NULL),
('DH006', 'DV008', NULL, 'NV008', 1, '2024-04-08 14:00:00.000', NULL, NULL, NULL),
('DH006', 'DV009', NULL, 'NV004', 2, '2024-04-08 14:00:00.000', NULL, NULL, NULL),
('DH007', 'DV002', 'BS017', 'NV007', 3, '2024-04-10 15:00:00.000', NULL, NULL, NULL),
('DH008', 'DV004', 'BS011', 'NV010', 1, '2024-04-13 16:00:00.000', NULL, NULL, NULL),
('DH008', 'DV006', NULL, 'NV008', 1, '2024-04-13 16:00:00.000', NULL, NULL, NULL),
('DH008', 'DV010', NULL, 'NV012', 4, '2024-04-13 16:00:00.000', NULL, NULL, NULL),
('DH009', 'DV001', 'BS016', 'NV006', 2, '2024-04-15 17:00:00.000', NULL, NULL, NULL),
('DH010', 'DV002', 'BS008', 'NV015', 3, '2024-04-15 18:00:00.000', NULL, NULL, NULL),
('DH010', 'DV005', NULL, 'NV012', 2, '2024-04-15 18:00:00.000', NULL, NULL, NULL),
('DH011', 'DV003', NULL, 'NV017', 1, '2024-04-15 19:00:00.000', NULL, NULL, NULL),
('DH012', 'DV009', NULL, 'NV016', 3, '2024-04-15 20:00:00.000', NULL, NULL, NULL),
('DH012', 'DV010', NULL, 'NV016', 2, '2024-04-15 20:00:00.000', NULL, NULL, NULL),
('DH013', 'DV001', 'BS020', 'NV014', 1, '2024-04-16 21:00:00.000', NULL, NULL, NULL),
('DH013', 'DV007', NULL, 'NV020', 1, '2024-04-16 21:00:00.000', NULL, NULL, NULL),
('DH014', 'DV004', 'BS007', 'NV019', 2, '2024-04-20 22:00:00.000', NULL, NULL, NULL),
('DH014', 'DV008', NULL, 'NV020', 1, '2024-04-20 22:00:00.000', NULL, NULL, NULL),
('DH015', 'DV005', NULL, 'NV004', 3, '2024-04-25 23:00:00.000', NULL, NULL, NULL),
('DH015', 'DV009', NULL, 'NV008', 1, '2024-04-25 23:00:00.000', NULL, NULL, NULL),
('DH016', 'DV002', 'BS010', 'NV007', 2, '2024-04-25 00:00:00.000', NULL, NULL, NULL),
('DH017', 'DV003', NULL, 'NV013', 1, '2024-04-27 01:00:00.000', NULL, NULL, NULL),
('DH019', 'DV001', 'BS013', 'NV011', 3, '2024-04-27 02:00:00.000', NULL, NULL, NULL);



INSERT INTO The (idThuCung, idKhachHang, createddate, modifieddate, createdby, modifiedby)
VALUES
('TC001', 'KH001', '2024-02-15 10:00:00',  NULL, NULL, NULL),
('TC002', 'KH001',  '2024-02-16 11:00:00',NULL, NULL, NULL),
('TC003', 'KH003',  '2024-02-17 12:00:00',  NULL, NULL, NULL),
('TC004', 'KH005',  '2024-02-18 13:00:00',NULL, NULL, NULL),
('TC005', 'KH005',  '2024-02-19 14:00:00', NULL, NULL, NULL),
('TC006', 'KH002',  '2024-02-20 10:00:00', NULL, NULL, NULL),
('TC007', 'KH002',  '2024-02-21 11:00:00',NULL, NULL, NULL),
('TC008', 'KH004',  '2024-02-22 12:00:00', NULL, NULL, NULL),
('TC009', 'KH003',  '2024-02-23 13:00:00', NULL, NULL, NULL),
('TC010', 'KH007',  '2024-02-24 14:00:00', NULL, NULL, NULL),
('TC011', 'KH008',  '2024-02-25 10:00:00',NULL, NULL, NULL),
('TC012', 'KH009',  '2024-02-26 11:00:00', NULL, NULL, NULL),
('TC013', 'KH001',  '2024-02-27 12:00:00', NULL, NULL, NULL),
('TC014', 'KH015',  '2024-02-28 13:00:00', NULL, NULL, NULL),
('TC015', 'KH002',  '2024-02-29 14:00:00', NULL, NULL, NULL),
('TC016', 'KH003',  '2024-03-01 10:00:00', NULL, NULL, NULL),
('TC017', 'KH004',  '2024-03-02 11:00:00', NULL, NULL, NULL),
('TC018', 'KH015',  '2024-03-03 12:00:00', NULL, NULL, NULL),
('TC019', 'KH016',  '2024-03-04 13:00:00', NULL, NULL, NULL),
('TC020', 'KH007',  '2024-03-05 14:00:00', NULL, NULL, NULL),
('TC021', 'KH008',  '2024-03-06 10:00:00', NULL, NULL, NULL),
('TC022', 'KH009',  '2024-03-07 11:00:00', NULL, NULL, NULL),
('TC023', 'KH010',  '2024-03-08 12:00:00',NULL, NULL, NULL),
('TC024', 'KH010',  '2024-03-09 13:00:00',  NULL, NULL, NULL),
('TC025', 'KH012',  '2024-03-10 14:00:00', NULL, NULL, NULL),
('TC026', 'KH013',  '2024-03-11 10:00:00', NULL, NULL, NULL),
('TC027', 'KH014',  '2024-03-12 11:00:00',  NULL, NULL, NULL),
('TC028', 'KH015', '2024-03-13 12:00:00',   NULL, NULL, NULL),
('TC029', 'KH016',  '2024-03-14 13:00:00', NULL, NULL, NULL),
('TC030', 'KH017',  '2024-03-15 14:00:00',NULL, NULL, NULL);

UPDATE DichVu
SET createdby = N'Nguyễn Văn Linh'


insert into NhaCungCap 
values  ('NCC08',N'Công ty cổ phần ABCD',N'Đà Nẵng','0011505371',N'Nguyễn Văn An', '2023-05-01 10:00:00', NULL, 'AD002', NULL),
        ('NCC09',N'Công ty DEF',N'Quảng Nam','0011505372',N'Nguyễn Thị Chi', '2023-05-02 11:30:00', NULL, 'AD002', NULL),
        ('NCC10',N'Công ty 1 thành viên',N'Đà Nẵng','0011505373',N'Trần Thùy Dung', '2023-05-03 12:45:00', NULL, 'AD002', NULL),
        ('NCC11',N'Công ty NANG',N'Hội An','0011505374',N'Lê Đức', '2023-05-04 14:20:00', NULL, 'AD002', NULL),
        ('NCC12',N'Công ty MUA',N'Đà Nẵng','0011505375',N'Nguyễn Thị Giang', '2023-05-05 15:40:00', NULL, 'AD002', NULL),
        ('NCC13',N'Công ty REAL',N'Bình Định','0011505376',N'Hoàng Ngọc Huyền', '2023-05-06 17:00:00', NULL, 'AD002', NULL),
        ('NCC14',N'Công ty JACK',N'Đà Nẵng','0011505377',N'Trần Khánh', '2023-05-07 18:30:00', NULL, 'AD002', NULL),
        ('NCC15',N'Công ty cổ phần HOAMY',N'Bình Định','0011505378',N'Lê Ngọc Linh', '2023-05-08 20:10:00', NULL, 'AD002', NULL),
        ('NCC16',N'Công ty LUUNGOC',N'Quảng Nam','0011505379',N'Trần Huyền My', '2023-05-09 22:00:00', NULL, 'AD002', NULL),
        ('NCC17',N'Công ty JS',N'Hội An','0011505370',N'Nguyễn Ngọc Nga', '2023-05-10 23:45:00', NULL, 'AD002', NULL);

insert into PhieuNhap 
values	('PN08','NCC09', '2023-10-21 08:00:00', NULL, 'AD001', NULL),
		('PN09','NCC16', '2023-10-21 08:15:00', NULL, 'AD001', NULL),
		('PN10','NCC15', '2023-10-21 08:30:00', NULL, 'AD001', NULL),
		('PN11','NCC12', '2023-10-21 08:45:00', NULL, 'AD001', NULL),
		('PN12','NCC16', '2023-10-21 09:00:00', NULL, 'AD001', NULL),
		('PN13','NCC14', '2023-10-21 09:15:00', NULL, 'AD001', NULL),
		('PN14','NCC09', '2023-10-21 09:30:00', NULL, 'AD001', NULL),
		('PN15','NCC13', '2023-10-21 09:45:00', NULL, 'AD001', NULL),
		('PN16','NCC16', '2023-10-21 10:00:00', NULL, 'AD001', NULL),
		('PN17','NCC16', '2023-10-21 10:15:00', NULL, 'AD001', NULL);

insert into ChiTietPhieuNhap
values  ('PN08','DV005',100,235000, '2023-10-21 10:00:00', NULL, 'AD001', NULL),
        ('PN08','DV006',100,100000, '2023-10-21 10:15:00', NULL, 'AD001', NULL),
        ('PN12','DV007',100,30000, '2023-10-21 10:30:00', NULL, 'AD001', NULL),
        ('PN11','DV008',150,350000, '2023-10-21 10:45:00', NULL, 'AD001', NULL),
        ('PN16','DV009',130,50000, '2023-10-21 11:00:00', NULL, 'AD001', NULL),
        ('PN16','DV010',170,150000, '2023-10-21 11:15:00', NULL, 'AD001', NULL),
        ('PN13','DV006',200,100000, '2023-10-21 11:30:00', NULL, 'AD001', NULL),
        ('PN15','DV008',160,350000, '2023-10-21 11:45:00', NULL, 'AD001', NULL),
        ('PN15','DV010',180,150000, '2023-10-21 12:00:00', NULL, 'AD001', NULL),
        ('PN15','DV005',140,235000, '2023-10-21 12:15:00', NULL, 'AD001', NULL);


 --- Câu lệnh của LInh Nguyễn
	-- Hàm get next userID của Admin
CREATE FUNCTION HamGetNextAdminUserId()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxUserId varchar(10);
    DECLARE @NextId int;
    DECLARE @NewUserId varchar(10);

    SELECT @MaxUserId = MAX(idUser)
    FROM Users
    WHERE idUser LIKE 'AD%';
    IF @MaxUserId IS NULL
        SET @MaxUserId = 'AD00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxUserId, 3, LEN(@MaxUserId)) + 1);

    SET @NewUserId = 'AD' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewUserId;
END;

-- proc insert Admin
CREATE PROCEDURE InsertAdmin
    @userName varchar(50),
    @password varchar(50),
    @tenuser nvarchar(100),
    @loaiuser nvarchar(50),
    @gioiTinh nvarchar(10),
    @ngaySinh date,
    @soDienThoai varchar(20),
    @email varchar(100),
    @createddate datetime,
    @createdby varchar(50),
    @status varchar(20)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextAdminUserId();

    INSERT INTO dbo.Users (idUser, userName, [password], tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, createddate, createdby, [status])
    VALUES (@NewUserId, @userName, @password, @tenuser, @loaiuser, @gioiTinh, @ngaySinh, @soDienThoai, @email, @createddate,@createdby, @status);
END; 

-- Hàm get next userID của Khách hàng
CREATE FUNCTION HamGetNextKhachHangUserId()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxUserId varchar(10);
    DECLARE @NextId int;
    DECLARE @NewUserId varchar(10);

    SELECT @MaxUserId = MAX(idUser)
    FROM Users
    WHERE idUser LIKE 'KH%';
    IF @MaxUserId IS NULL
        SET @MaxUserId = 'KH00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxUserId, 3, LEN(@MaxUserId)) + 1);

    SET @NewUserId = 'KH' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewUserId;
END;

-- proc insert cho KhachHang
CREATE PROCEDURE InsertKhachHang
    @userName varchar(50),
    @password varchar(50),
    @tenuser nvarchar(100),
    @loaiuser nvarchar(50),
    @gioiTinh nvarchar(10),
    @ngaySinh date,
    @soDienThoai varchar(20),
    @email varchar(100),
    @createddate datetime,
    @createdby varchar(50),
    @status varchar(20)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextKhachHangUserId();

    INSERT INTO dbo.Users (idUser, userName, [password], tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, createddate, createdby, [status])
    VALUES (@NewUserId, @userName, @password, @tenuser, @loaiuser, @gioiTinh, @ngaySinh, @soDienThoai, @email, @createddate, @createdby, @status);
END;


-- Hàm get next userID của Nhân viên
CREATE FUNCTION HamGetNextNhanVienUserId()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxUserId varchar(10);
    DECLARE @NextId int;
    DECLARE @NewUserId varchar(10);

    SELECT @MaxUserId = MAX(idUser)
    FROM Users
    WHERE idUser LIKE 'NV%';
    IF @MaxUserId IS NULL
        SET @MaxUserId = 'NV00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxUserId, 3, LEN(@MaxUserId)) + 1);

    SET @NewUserId = 'NV' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewUserId;
END;


-- proc insert cho nhân viên
CREATE PROCEDURE InsertNhanVien
    @userName varchar(50),
    @password varchar(50),
    @tenuser nvarchar(100),
    @loaiuser nvarchar(50),
    @gioiTinh nvarchar(10),
    @ngaySinh date,
    @soDienThoai varchar(20),
    @email varchar(100),
    @thongTin nvarchar(255),
    @createddate datetime,
    @createdby varchar(50),
    @status varchar(20)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextNhanVienUserId();

    INSERT INTO dbo.Users (idUser, userName, [password], tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, thongTinUser, createddate, createdby, [status])
    VALUES (@NewUserId, @userName, @password, @tenuser, @loaiuser, @gioiTinh, @ngaySinh, @soDienThoai, @email, @thongTin, @createddate, @createdby, @status);
END;

-- Hàm get next userID của BacSi
CREATE FUNCTION HamGetNextBacSiUserId()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxUserId varchar(10);
    DECLARE @NextId int;
    DECLARE @NewUserId varchar(10);

    SELECT @MaxUserId = MAX(idUser)
    FROM Users
    WHERE idUser LIKE 'BS%';
    IF @MaxUserId IS NULL
        SET @MaxUserId = 'BS00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxUserId, 3, LEN(@MaxUserId)) + 1);
    SET @NewUserId = 'BS' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);
    RETURN @NewUserId;
END;

-- proc insert bác sĩ 
CREATE PROCEDURE InsertBacSi
    @userName varchar(50),
    @password varchar(50),
    @tenuser nvarchar(100),
    @loaiuser nvarchar(50),
    @gioiTinh nvarchar(10),
    @ngaySinh date,
    @soDienThoai varchar(20),
    @email varchar(100),
    @thongTin nvarchar(255),
    @createddate datetime,
    @createdby varchar(50),
    @status varchar(20)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextBacSiUserId();

    INSERT INTO dbo.Users (idUser, userName, [password], tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, thongTinUser, createddate, createdby, [status])
    VALUES (@NewUserId, @userName, @password, @tenuser, @loaiuser, @gioiTinh, @ngaySinh, @soDienThoai, @email, @thongTin, @createddate, @createdby, @status);
END;

--- TRigger khi thêm vào bảng user 
CREATE TRIGGER InsertUserRole
ON Users
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON; 
    INSERT INTO role_User (roleId, idUser)
    SELECT 
        CASE 
            WHEN SUBSTRING(i.idUser, 1, 2) = 'AD' THEN 1
            WHEN SUBSTRING(i.idUser, 1, 2) = 'NV' THEN 2
            WHEN SUBSTRING(i.idUser, 1, 2) = 'BS' THEN 2
            ELSE 3
        END,
        i.idUser
    FROM inserted i
    WHERE i.idUser LIKE 'AD%' OR i.idUser LIKE 'NV%' OR i.idUser LIKE 'BS%' OR i.idUser LIKE 'KH%';

END;

-- proc insert Đăng kí khách hàng
CREATE PROCEDURE InsertUser_KhachHang
    @tenuser NVARCHAR(100),
    @userName VARCHAR(100),
    @password VARCHAR(100),
    @email VARCHAR(100)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextKhachHangUserId();

    INSERT INTO Users (idUser, userName, password, tenuser, loaiuser, email, createddate, status)
    VALUES (
        @NewUserId, 
        @userName,
        @password,
        @tenuser,
        N'Khách hàng mới', 
        @email,
        GETDATE(), 
        1 
    )
END

-- Hàm get next maNhaCC
CREATE FUNCTION HamGetNextMaNhaCC()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxMaNCC varchar(10);
    DECLARE @NextId int;
    DECLARE @NewMaNCC varchar(10);

    SELECT @MaxMaNCC =MAX(maNCC)
    FROM NhaCungCap
    IF @MaxMaNCC IS NULL
        SET @MaxMaNCC = 'NCC00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxMaNCC, 4, LEN(@MaxMaNCC)) + 1);
    SET @NewMaNCC = 'NCC' + RIGHT('00' + CONVERT(varchar(10), @NextId), 2);
    RETURN @NewMaNCC;
END;

-- proc insert nhà cung cấp 
CREATE PROCEDURE InsertNhaCungCap
    @tenNCC nvarchar(100),
    @diaChiNCC nvarchar(255),
    @SDT varchar(20),
    @nhanVienLienHe nvarchar(100),
	@createddate datetime,
	@createdby nvarchar(100)
AS
BEGIN
    DECLARE @NewMaNCC varchar(10);
    SET @NewMaNCC = dbo.HamGetNextMaNhaCC();

    INSERT INTO NhaCungCap (maNCC, tenNCC, diaChiNCC, SDT, nhanVienLienHe,createddate,createdby)
    VALUES (@NewMaNCC, @tenNCC, @diaChiNCC, @SDT, @nhanVienLienHe,@createddate,@createdby);
END;

-- proc update nhà cung cấp 
CREATE PROCEDURE UpdateNhaCungCap
    @maNCC nvarchar(10),
    @tenNCC nvarchar(100),
    @diaChiNCC nvarchar(255),
    @SDT varchar(20),
    @nhanVienLienHe nvarchar(100),
    @modifieddate datetime,
    @modifiedby nvarchar(100)
AS
BEGIN
    UPDATE NhaCungCap 
    SET 
        tenNCC = @tenNCC,
        diaChiNCC = @diaChiNCC,
        SDT = @SDT,
        nhanVienLienHe = @nhanVienLienHe,
        modifieddate = @modifieddate,
        modifiedby = @modifiedby
    WHERE maNCC = @maNCC;
END;

-- proc xoa nhacung cap
CREATE PROCEDURE DeleteNhaCungCap
    @maNCC varchar(10)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM ChiTietPhieuNhap
    WHERE maPN IN (SELECT maPN FROM PhieuNhap WHERE maNCC = @maNCC);

    DELETE FROM PhieuNhap
    WHERE maNCC = @maNCC;

    DELETE FROM NhaCungCap
    WHERE maNCC = @maNCC;
END;

-- Hàm get next maPhieuNhap
CREATE FUNCTION HamGetNextMaPhieuNhap()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxMaPhieuNhap varchar(10);
    DECLARE @NextId int;
    DECLARE @NewMaPhieuNhap varchar(10);

    SELECT @MaxMaPhieuNhap =MAX(maPN)
    FROM PhieuNhap
    IF @MaxMaPhieuNhap IS NULL
        SET @MaxMaPhieuNhap = 'PN00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxMaPhieuNhap, 3, LEN(@MaxMaPhieuNhap)) + 1);

    SET @NewMaPhieuNhap = 'PN' + RIGHT('00' + CONVERT(varchar(10), @NextId), 2);

    RETURN @NewMaPhieuNhap;
END;


--proc insert phiếu nhập 
CREATE PROCEDURE InsertPhieuNhap
    @maNCC varchar(10),
    @createddate datetime,
	@createdby nvarchar(200)
AS
BEGIN
    DECLARE @NewPhieuNhapId varchar(10);
    SET @NewPhieuNhapId = dbo.HamGetNextMaPhieuNhap(); 

    INSERT INTO PhieuNhap (maPN, maNCC,createddate, createdby)
    VALUES 
	(@NewPhieuNhapId, @maNCC, @createddate,@createdby);
END;

-- proc update phieu nhap
CREATE PROCEDURE UpdatePhieuNhap
    @maPN NVARCHAR(50),
    @maNCC VARCHAR(10),
    @modifieddate DATETIME,
    @modifiedby NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE PhieuNhap
    SET modifieddate = @modifieddate,
        modifiedby = @modifiedby,
		maNCC = @maNCC
    WHERE maPN = @maPN
END;


-- proc xóa phiếu nhập
CREATE PROCEDURE DeletePhieuNhap
    @maPN varchar(10)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM ChiTietPhieuNhap
    WHERE maPN = @maPN;

    -- Xóa phiếu nhập
    DELETE FROM PhieuNhap
    WHERE maPN = @maPN;
END;


-- insert chiTietDonHang
CREATE PROCEDURE InsertChiTietPhieuNhap
    @maPN varchar(10),
    @idDichVu varchar(10),
    @soLuongNhap int,
    @giaNhap money,
    @createddate datetime,
    @createdby nvarchar(255)
AS
BEGIN
    INSERT INTO ChiTietPhieuNhap (maPN, idDichVu, soLuongNhap, giaNhap, createddate, createdby)
    VALUES (@maPN, @idDichVu, @soLuongNhap, @giaNhap, @createddate, @createdby);
END;


-- proc update chiTietPhieunhap
CREATE PROCEDURE UpdateChiTietPhieuNhap
    @maPN varchar(10),
    @idDichVu varchar(10),
    @soLuongNhap int,
    @giaNhap money,
    @modifieddatetime datetime,
    @modifiedby nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE ChiTietPhieuNhap
    SET soLuongNhap = @soLuongNhap,
        giaNhap = @giaNhap,
        modifieddate = @modifieddatetime,
        modifiedby = @modifiedby
    WHERE maPN = @maPN
        AND idDichVu = @idDichVu;
END;

-- Hàm get next maDichVu
CREATE FUNCTION HamGetNextIdDichVu()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxIdDichVu varchar(10);
    DECLARE @NextId int;
    DECLARE @NewIdDichVu varchar(10);
    SELECT @MaxIdDichVu =MAX(idDichVu)
    FROM DichVu
    IF @MaxIdDichVu IS NULL
        SET @MaxIdDichVu = 'DV00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxIdDichVu, 3, LEN(@MaxIdDichVu)) + 1);

    SET @NewIdDichVu = 'DV' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewIdDichVu;
END;



--proc insert DichVu
CREATE PROCEDURE InsertDichVu
    @tenDichVu nvarchar(100),
    @donGia float,
    @thuongHieu nvarchar(100),
    @loaiSanPham nvarchar(100),
    @donViTinh nvarchar(50),
    @createddate datetime,
    @createdby nvarchar(50)
AS
BEGIN
    DECLARE @NewIdDich varchar(10);
    SET @NewIdDich = dbo.HamGetNextIdDichVu(); 

    INSERT INTO DichVu (idDichVu, tenDichVu, donGia, thuongHieu, loaiSanPham, donViTinh, createddate, createdby)
    VALUES (@NewIdDich, @tenDichVu, @donGia, @thuongHieu, @loaiSanPham, @donViTinh, @createddate, @createdby);
END;


-- proc update dichVu
CREATE PROCEDURE UpdateDichVu
    @idDichVu varchar(10),
    @tenDichVu nvarchar(100),
    @donGia float,
    @thuongHieu nvarchar(100),
    @loaiSanPham nvarchar(100),
    @donViTinh nvarchar(10),
    @soLuongHienCon int,
    @soLuongDaBan int,
	@createddate datetime,
	@createdby nvarchar(255),
    @modifieddate datetime,
    @modifiedby nvarchar(255)
AS
BEGIN
    UPDATE DichVu
    SET tenDichVu = @tenDichVu,
        donGia = @donGia,
        thuongHieu = @thuongHieu,
        loaiSanPham = @loaiSanPham,
        donViTinh = @donViTinh,
        soLuongHienCon = @soLuongHienCon,
        soLuongDaBan = @soLuongDaBan,
		createddate = @createddate,
		createdby = @createdby,
        modifieddate = @modifieddate,
        modifiedby = @modifiedby
    WHERE idDichVu = @idDichVu;
END;



-- Hàm get next maDonHang
CREATE FUNCTION HamGetNextmaDonHang()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxMaDonHang varchar(10);
    DECLARE @NextId int;
    DECLARE @NewMaDonHang varchar(10);

    SELECT @MaxMaDonHang =MAX(maDonHang)
    FROM DonHang
    IF @MaxMaDonHang IS NULL
        SET @MaxMaDonHang = 'DH00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxMaDonHang, 3, LEN(@MaxMaDonHang)) + 1);
    SET @NewMaDonHang = 'DH' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);
    RETURN @NewMaDonHang;
END;


-- hàm insert donHang
CREATE PROCEDURE InsertDonHang
    @idKhachHang varchar(10),
    @sdtGiaoHang varchar(20),
    @diaChiGiaoHang nvarchar(255),
    @ngayGiaoHang date,
    @trangThai nvarchar(50),
    @createddate datetime,
    @createdby nvarchar(50)
AS
BEGIN
    DECLARE @NewMaDonHang varchar(10);
    SET @NewMaDonHang = dbo.HamGetNextmaDonHang(); 

    INSERT INTO DonHang (maDonHang, idKhachHang, sdtGiaoHang, diaChiGiaoHang, ngayGiaoHang, trangThai, createddate, createdby)
    VALUES (@NewMaDonHang, @idKhachHang, @sdtGiaoHang, @diaChiGiaoHang, @ngayGiaoHang, @trangThai, @createddate, @createdby);
END;

-- proc update DonHang
CREATE PROCEDURE UpdateDonHang
    @maDonHang varchar(10),
    @sdtGiaoHang varchar(10),
    @diaChiGiaoHang nvarchar(255),
    @ngayGiaoHang datetime,
    @phThucThanhToan nvarchar(100),
    @ngayThanhToan datetime,
    @trangThai nvarchar(100),
    @createddate datetime,
    @modifieddate datetime,
    @createdby nVARCHAR(255),
    @modifiedby nVARCHAR(255)
AS
BEGIN
    UPDATE DonHang
    SET 
        sdtGiaoHang = @sdtGiaoHang,
        diaChiGiaoHang = @diaChiGiaoHang,
        ngayGiaoHang = @ngayGiaoHang,
        phThucThanhToan = @phThucThanhToan,
        ngayThanhToan = @ngayThanhToan,
        trangThai = @trangThai,
        createddate = @createddate,
        modifieddate = @modifieddate,
        createdby = @createdby,
        modifiedby = @modifiedby
    WHERE
        maDonHang = @maDonHang;
END;

-- proc xóa đơn hàng 
CREATE PROCEDURE DeleteDonHang
    @maDonHang varchar(10)
AS
BEGIN

    IF EXISTS (SELECT 1 FROM DonHang WHERE maDonHang = @maDonHang)
    BEGIN
        DELETE FROM ChiTietDonHang WHERE maDonHang = @maDonHang;

        DELETE FROM DonHang WHERE maDonHang = @maDonHang;
    END
END;

-- hàm insert DonhangTuVan

CREATE PROCEDURE InsertDonHangTuVan
    @idKhachHang varchar(10),
    @sdtGiaoHang varchar(10),
    @diaChiGiaoHang nvarchar(255),
    @createddate datetime,
    @createdby nvarchar(255)
AS
BEGIN
	 DECLARE @NewMaDonHang varchar(10);
    SET @NewMaDonHang = dbo.HamGetNextmaDonHang(); 
    INSERT INTO DonHang (maDonHang,idKhachHang, sdtGiaoHang, diaChiGiaoHang, createddate, createdby, trangThai)
    VALUES (@NewMaDonHang,@idKhachHang, @sdtGiaoHang, @diaChiGiaoHang, @createddate, @createdby, N'Đặt tư vấn');
END;


-- proc lấy đơn hàng theo ma khách hàng lấy tất cả 
CREATE or alter PROCEDURE GetInvoiceInfo
    @idKhachHang varchar(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT CHD.maDonHang,
		   DV.idDichVu,
           DV.tenDichVu,
           CHD.soLuong,
           DV.donGia,
           CHD.soLuong * DV.donGia AS thanhTien,
           DH.sdtGiaoHang,
           DH.diaChiGiaoHang,
		   DH.trangThai,
		   Dh.createddate
    FROM ChiTietDonHang CHD
    INNER JOIN DichVu DV ON CHD.idDichVu = DV.idDichVu
    INNER JOIN DonHang DH ON CHD.maDonHang = DH.maDonHang
    WHERE DH.idKhachHang = @idKhachHang 
	ORDER BY CHD.maDonHang desc;

END;

--- lấy đơn hàng chưa thanh toán theo mã khách hàng
CREATE or alter PROCEDURE GetInvoiceInfoChuaThanhToan
    @idKhachHang varchar(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT CHD.maDonHang,
		   DV.idDichVu,
           DV.tenDichVu,
           CHD.soLuong,
           DV.donGia,
           CHD.soLuong * DV.donGia AS thanhTien,
           DH.sdtGiaoHang,
           DH.diaChiGiaoHang,
		   DH.trangThai,
		   Dh.createddate
    FROM ChiTietDonHang CHD
    INNER JOIN DichVu DV ON CHD.idDichVu = DV.idDichVu
    INNER JOIN DonHang DH ON CHD.maDonHang = DH.maDonHang
    WHERE DH.idKhachHang = 'KH001'and DH.trangThai not in(N'Ðã thanh toán')
	ORDER BY CHD.maDonHang desc;

END;

-- update trạng thái đơn hàng khi khách hàng thanh toán
CREATE or AlTER PROCEDURE sp_UpdateDonHangByIdKhachHangAndPhThucThanhToan
    @IdKhachHang varchar(10),
	@maDonHang varchar(10),
    @PhThucThanhToan nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật trạng thái của các đơn hàng của khách hàng có idKhachHang và phương thức thanh toán nhất định
    UPDATE DonHang
    SET trangThai = N'Đã thanh toán',
        modifieddate = GETDATE(),
		phThucThanhToan = @PhThucThanhToan
    WHERE idKhachHang = @IdKhachHang
	and maDonHang = @maDonHang
END;

-- proc inset Dặt dịch vụ 
CREATE OR ALTER PROCEDURE InsertDonHangAndChiTietDonHang 
    @idKhachHang VARCHAR(10),
    @idDichVu VARCHAR(10),
	@soLuong INT,
    @sdtGiaoHang VARCHAR(10),
    @diaChiGiaoHang NVARCHAR(255),
    @phThucThanhToan NVARCHAR(100),
    @createddate DATETIME,
    @createdby NVARCHAR(255)
AS
BEGIN
	
    DECLARE @NewMaDonHang VARCHAR(10);
    SET @NewMaDonHang = dbo.HamGetNextmaDonHang();
    DECLARE @ngayThanhToan DATETIME = NULL; 
    DECLARE @trangThai NVARCHAR(100) = N'Chưa thanh toán';

    INSERT INTO DonHang (maDonHang, idKhachHang, sdtGiaoHang, diaChiGiaoHang, phThucThanhToan, ngayThanhToan, trangThai, createddate, modifieddate, createdby, modifiedby)
    VALUES (@NewMaDonHang, @idKhachHang, @sdtGiaoHang, @diaChiGiaoHang, @phThucThanhToan, @ngayThanhToan, @trangThai, @createddate, NULL, @createdby, NULL);

    INSERT INTO ChiTietDonHang (maDonHang, idDichVu, soLuong, createddate, modifieddate, createdby, modifiedby)
    VALUES (@NewMaDonHang, @idDichVu, @soLuong, @createddate, NULL, @createdby, NULL); 
END;



select * from dbo.DonHang

-- proc findOneDatDichVu
CREATE PROCEDURE GetDonHangAndChiTietDonHang
    @IdKhachHang VARCHAR(10)
AS
BEGIN
    SELECT 
        ctdh.idDichVu,
        dh.idKhachHang,
        dh.sdtGiaoHang,
        dh.diaChiGiaoHang,
        dh.phThucThanhToan,
        ctdh.soLuong,
        dh.modifieddate,
        dh.createddate,
        dh.modifiedby,
        dh.createdby
    FROM 
        DonHang dh
    INNER JOIN 
        ChiTietDonHang ctdh ON dh.maDonHang = ctdh.maDonHang
    WHERE 
        dh.idKhachHang = @IdKhachHang;
END

-- Hàm get next maThuCung
CREATE FUNCTION HamGetNextIdThuCung()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxIdThuCung varchar(10);
    DECLARE @NextId int;
    DECLARE @NewIdThuCung varchar(10);

    SELECT @MaxIdThuCung =MAX(idThuCung)
    FROM ThuCung
    IF @MaxIdThuCung IS NULL
        SET @MaxIdThuCung = 'TC00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxIdThuCung, 3, LEN(@MaxIdThuCung)) + 1);

    SET @NewIdThuCung = 'TC' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewIdThuCung;
END;

-- inssert cho thucung
CREATE PROCEDURE InsertThuCung
    @tenThuCung nvarchar(100),
    @gioiTinh nvarchar(10),
    @loaiThuCung nvarchar(100),
    @tuoi int,
    @createddate datetime,
    @createdby nvarchar(50)
AS
BEGIN
    DECLARE @NewIdThuCung varchar(10);
    SET @NewIdThuCung = dbo.HamGetNextIdThuCung();

    INSERT INTO ThuCung (idThuCung, tenThuCung, gioiTinh, loaiThuCung, tuoi, createddate, createdby)
    VALUES (@NewIdThuCung, @tenThuCung, @gioiTinh, @loaiThuCung, @tuoi, @createddate, @createdby);
END;



-- update thucung 
CREATE PROCEDURE UpdateThucung
    @idThuCung varchar(10),
    @tenThuCung NVARCHAR(100),
    @gioiTinh NVARCHAR(10),
    @loaiThuCung NVARCHAR(100),
    @tuoi INT,
	@modifieddate DATETIME,
    @modifiedby nVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Thucung
    SET tenThuCung = @tenThuCung,
        gioiTinh = @gioiTinh,
        loaiThuCung = @loaiThuCung,
        tuoi = @tuoi,
        modifieddate = @modifieddate,
        modifiedby = @modifiedby
    WHERE idThuCung = @idThuCung;
END

-- proc xóa thuCung
CREATE PROCEDURE DeleteThuCung
    @idThuCung VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM The WHERE idThuCung = @idThuCung)
    BEGIN
        DELETE FROM The WHERE idThuCung = @idThuCung;
    END
    DELETE FROM ThuCung WHERE idThuCung = @idThuCung;
END

-- proc lấy thú cưng theo idKhachhang
CREATE or AlTER PROCEDURE GetThuCungByUserId
    @userId varchar(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TC.idThuCung, TC.tenThuCung, TC.gioiTinh, TC.loaiThuCung, TC.tuoi,
           TC.createddate , TC.modifieddate ,
           TC.createdby, TC.modifiedby 
    FROM The T
    JOIN ThuCung TC ON T.idThuCung = TC.idThuCung
    WHERE T.idKhachHang = @userId;
END;

update Thucung
set createdby =N'Nguyễn Văn Linh'

-- proc thêm thú cưng từ khách hàng
CREATE PROCEDURE ThemThuCungUser
    @idKhachHang varchar(10),
    @tenThuCung nvarchar(100),
    @tuoi int,
    @gioiTinh nvarchar(10),
    @loaiThuCung nvarchar(100),
	@createddate datetime,
    @createdby nvarchar(255)
AS
BEGIN
    DECLARE @NewIdThuCung varchar(10);
    SET @NewIdThuCung = dbo.HamGetNextIdThuCung();

    -- Insert into ThuCung table
    INSERT INTO ThuCung (idThuCung, tenThuCung, tuoi, gioiTinh, loaiThuCung, createddate, createdby)
    VALUES (@NewIdThuCung, @tenThuCung, @tuoi, @gioiTinh, @loaiThuCung, @createddate, @createdby)

    -- Insert into The table
    INSERT INTO The (idThuCung, idKhachHang, createddate, createdby)
    VALUES (@NewIdThuCung, @idKhachHang, @createddate, @createdby)
END

-- proc lấy thông tin thú từ idKhachHang
CREATE or alter PROCEDURE LayThongTinThuCungByIdKhachHang
    @idKhachHang varchar(10)
AS
BEGIN
    SELECT TC.idThuCung, T.idKhachHang, TC.tenThuCung, TC.tuoi, TC.gioiTinh, TC.loaiThuCung,TC.createdby,TC.createddate,TC.modifiedby,Tc.modifieddate
    FROM ThuCung TC
    INNER JOIN The T ON TC.idThuCung = T.idThuCung
    WHERE T.idKhachHang = @idKhachHang;
END


-- proc insert cho bảng ChiTietDonHang
CREATE PROCEDURE InsertChiTietDonHang
(
    @maDonHang varchar(10),
    @idDichVu varchar(10),
    @idBacSi varchar(10),
    @idNhanVien varchar(10),
    @soLuong int,
    @createdDate datetime,
    @createdBy nVARCHAR(255)
)
AS
BEGIN
    INSERT INTO ChiTietDonHang (maDonHang, idDichVu, idBacSi, idNhanVien, soLuong, createddate, createdby)
    VALUES (@maDonHang, @idDichVu, @idBacSi, @idNhanVien, @soLuong, @createdDate, @createdBy)
END

-- proc update chitietDonhang
CREATE PROCEDURE UpdateChiTietDonHang
(
    @maDonHang varchar(10),
    @idDichVu varchar(10),
    @idBacSi varchar(10),
    @idNhanVien varchar(10),
    @soLuong int,
    @modifiedDate datetime,
    @modifiedBy nVARCHAR(255)
)
AS
BEGIN
    UPDATE ChiTietDonHang
    SET 
        idBacSi = @idBacSi,
        idNhanVien = @idNhanVien,
        soLuong = @soLuong,
        modifieddate = @modifiedDate,
        modifiedby = @modifiedBy
    WHERE maDonHang = @maDonHang and idDichVu = @idDichVu
END


-- INSERT CHO THẺ 
CREATE PROCEDURE InsertIntoThe
    @idThuCung varchar(10),
    @idKhachHang varchar(10),
    @createddate datetime,
    @createdby nVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO The (idThuCung, idKhachHang, createddate, createdby)
    VALUES (@idThuCung, @idKhachHang, @createddate, @createdby);
END;


-- Update cho thẻ by idThucung
CREATE PROCEDURE UpdateTheByIdThuCung
    @idThuCung varchar(10),
    @idKhachHang varchar(10),
    @modifieddate datetime,
    @modifiedby nVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE The
    SET idKhachHang = @idKhachHang,
        modifieddate = @modifieddate,
        modifiedby = @modifiedby
    WHERE idThuCung = @idThuCung;
END;

-- proc xóa chiTietDonHang
CREATE PROCEDURE DeleteChiTietDonHang
    @MaDonHang NVARCHAR(50),
    @IdDichVu NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM ChiTietDonHang 
    WHERE maDonHang = @MaDonHang AND idDichVu = @IdDichVu;
END


























-- insert cho thú cung và thẻ của LInh chưa chạy

CREATE PROCEDURE Insert_ThuCung_To_The
(
    @tenThuCung nvarchar(100),
    @gioiTinh nvarchar(10),
    @loaiThuCung nvarchar(100),
    @tuoi int,
    @idKhachHang varchar(10),
    @createdby nvarchar(255),
    @modifiedby nvarchar(255)
)
AS
BEGIN
    DECLARE @idThuCung varchar(10)
    
    -- Tạo ID cho thú cưng từ hàm "hamGetIdThuCung"
    EXEC @idThuCung = hamGetIdThuCung
    
    -- Chèn dữ liệu vào bảng ThuCung
    INSERT INTO ThuCung (idThuCung, tenThuCung, gioiTinh, loaiThuCung, tuoi, createddate, modifieddate, createdby, modifiedby)
    VALUES (@idThuCung, @tenThuCung, @gioiTinh, @loaiThuCung, @tuoi, GETDATE(), GETDATE(), @createdby, @modifiedby)
    
    -- Chèn dữ liệu vào bảng The
    INSERT INTO The (idThuCung, idKhachHang, createddate, modifieddate, createdby, modifiedby)
    VALUES (@idThuCung, @idKhachHang, GETDATE(), GETDATE(), @createdby, @modifiedby)
END




















--- Câu lệnh của Ng chưa chạy 




create or alter view dbo.chitietDH as
select maDonHang, ChiTietDonHang.idDichVu as idDichVu, tenDichVu, BS.tenuser as tenBS, NV.tenuser as tenNV, soLuong,DichVu.donGia, ChiTietDonHang.createddate,ChiTietDonHang.createdby
from ChiTietDonHang 
left join Users BS on ChiTietDonHang.idBacSi = BS.idUser
left join Users NV on ChiTietDonHang.idNhanVien = NV.idUser
join DichVu on ChiTietDonHang.idDichVu = DichVu.idDichVu

select * from dbo.chitietDH

CREATE PROCEDURE InsertCTDT
    @maDH varchar(50),
	@tendv nvarchar(50),
@tenBS nvarchar(50),
@tenNV nvarchar(50),
@sl int,
@createddate date,
@createdby nvarchar(50)
AS
BEGIN
	declare @idDV varchar(50)
	select @idDV = idDichVu from DichVu where tenDichVu = @tendv

	declare @idBS varchar(50)
	select @idBS = idUser from Users where tenuser = @tenBS

	declare @idNV varchar(50)
	select @idNV = idUser from Users where tenuser = @tenNV

    INSERT INTO ChiTietDonHang (maDonHang, idDichVu, idBacSi, idNhanVien, soLuong, createddate, createdby)
    VALUES (@maDH, @idDV, @idBS, @idNV, @sl, @createddate, @createdby);
END;

CREATE PROCEDURE UpdateCTDT
    @maDH varchar(50),
	@tendv nvarchar(50),
@tenBS nvarchar(50),
@tenNV nvarchar(50),
@sl int,
@createddate date,
@createdby nvarchar(50)
AS
BEGIN
	declare @idDV varchar(50)
	select @idDV = idDichVu from DichVu where tenDichVu = @tendv

	declare @idBS varchar(50)
	select @idBS = idUser from Users where tenuser = @tenBS

	declare @idNV varchar(50)
	select @idNV = idUser from Users where tenuser = @tenNV
	update ChiTietDonHang set
	idDichVu = @idDV, idBacSi = @idBS, idNhanVien =@idNV, soLuong =@sl, createddate = @createddate, createdby = createdby
	where maDonHang = @maDH
END;

create or alter view dbo.chitietPN as
select maPN, ChiTietPhieuNhap.idDichVu as idDichVu, tenDichVu, giaNhap, soLuongNhap
from ChiTietPhieuNhap
join DichVu on ChiTietPhieuNhap.idDichVu = DichVu.idDichVu

select * from dbo.chitietPN

CREATE PROCEDURE InsertCTPN
    @maPN varchar(50),
	@tenDV nvarchar(50),
@gia money,
@sl int
AS
BEGIN
	declare @idDV varchar(50)
	select @idDV = idDichVu from DichVu where tenDichVu = @tendv

    INSERT INTO ChiTietPhieuNhap(maPN, idDichVu, giaNhap, soLuongNhap)
    VALUES (@maPN, @idDV, @gia, @sl);
END;

CREATE PROCEDURE UpdateCTPN
    @maPN varchar(50),
	@tenDV nvarchar(50),
@gia money,
@sl int
AS
BEGIN
	declare @idDV varchar(50)
	select @idDV = idDichVu from DichVu where tenDichVu = @tendv

    update ChiTietPhieuNhap set
	idDichVu = @idDV, giaNhap =@gia, soLuongNhap =@sl
	where maPN = @maPN
END;

create or alter view dbo.tableThe as
select The.idThuCung, tenThuCung, idKhachHang, tenuser, The.createddate
from The
join ThuCung on ThuCung.idThuCung = The.idThuCung
join Users on Users.idUser = The.idKhachHang

select * from dbo.The

create or alter view dbo.TC as
select ThuCung.idThuCung, tenThuCung, Users.tenuser, ThuCung.gioiTinh, loaiThuCung, tuoi, ThuCung.createddate, ThuCung.createdby 
from ThuCung
join The on The.idThuCung = ThuCung.idThuCung
join Users on Users.idUser = The.idKhachHang

select * from dbo.TC

CREATE FUNCTION HamGetNextIdThuCung()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxIdThuCung varchar(10);
    DECLARE @NextId int;
    DECLARE @NewIdThuCung varchar(10);

    SELECT @MaxIdThuCung =MAX(idThuCung)
    FROM ThuCung
    IF @MaxIdThuCung IS NULL
        SET @MaxIdThuCung = 'TC00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxIdThuCung, 3, LEN(@MaxIdThuCung)) + 1);

    SET @NewIdThuCung = 'TC' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewIdThuCung;
END;


CREATE or alter PROCEDURE InsertThuCungAndThe
    @tenThuCung nvarchar(100),
    @gioiTinh nvarchar(10),
    @loaiThuCung nvarchar(100),
    @tuoi int,
    @tenKH nvarchar(100),
	@createddate datetime,
    @createdby varchar(50)
AS
BEGIN
        -- Insert dữ liệu vào bảng ThuCung
         DECLARE @NewIdThuCung varchar(10);
    SET @NewIdThuCung = dbo.HamGetNextIdThuCung();

    INSERT INTO ThuCung (idThuCung, tenThuCung, gioiTinh, loaiThuCung, tuoi, createddate, createdby)
    VALUES (@NewIdThuCung, @tenThuCung, @gioiTinh, @loaiThuCung, @tuoi, @createddate, @createdby);

	declare @idKH varchar(50)
	select @idKH = idUser from Users where tenuser = @tenKH

        -- Insert dữ liệu vào bảng The
        INSERT INTO The (idThuCung,idKhachHang, createddate, createdby)
        VALUES (@NewIdThuCung, @idKH ,@createddate, @createdby);
END;
exec InsertThuCungAndThe N'như',N'Đực', N'ggdf',5,N'Trần Văn Bình',null,null
select * from ThuCung


select * from dbo.chitietPN
	-- Hàm get next userID của Admin
-- Hàm get next userID của Admin
CREATE FUNCTION HamGetNextAdminUserId()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxUserId varchar(10);
    DECLARE @NextId int;
    DECLARE @NewUserId varchar(10);

    SELECT @MaxUserId = MAX(idUser)
    FROM Users
    WHERE idUser LIKE 'AD%';
    IF @MaxUserId IS NULL
        SET @MaxUserId = 'AD00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxUserId, 3, LEN(@MaxUserId)) + 1);

    SET @NewUserId = 'AD' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewUserId;
END;

-- proc insert Admin
CREATE PROCEDURE InsertAdmin
    @userName varchar(50),
    @password varchar(50),
    @tenuser nvarchar(100),
    @loaiuser nvarchar(50),
    @gioiTinh nvarchar(10),
    @ngaySinh date,
    @soDienThoai varchar(20),
    @email varchar(100),
    @createddate datetime,
    @createdby varchar(50),
    @status varchar(20)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextAdminUserId();

    INSERT INTO dbo.Users (idUser, userName, [password], tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, createddate, createdby, [status])
    VALUES (@NewUserId, @userName, @password, @tenuser, @loaiuser, @gioiTinh, @ngaySinh, @soDienThoai, @email, @createddate, @createdby, @status);
END;


-- Hàm get next userID của Khách hàng
CREATE FUNCTION HamGetNextKhachHangUserId()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxUserId varchar(10);
    DECLARE @NextId int;
    DECLARE @NewUserId varchar(10);

    SELECT @MaxUserId = MAX(idUser)
    FROM Users
    WHERE idUser LIKE 'KH%';
    IF @MaxUserId IS NULL
        SET @MaxUserId = 'KH00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxUserId, 3, LEN(@MaxUserId)) + 1);

    SET @NewUserId = 'KH' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewUserId;
END;


-- proc insert cho KhachHang
CREATE or alter PROCEDURE InsertKhachHangNg
    @userName varchar(50),
    @password varchar(50),
    @tenuser nvarchar(100),
    @loaiuser nvarchar(50),
    @gioiTinh nvarchar(10),
    @ngaySinh date,
    @soDienThoai varchar(20),
    @email varchar(100),
    @createddate datetime,
    @createdby varchar(50),
    @status varchar(20)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextKhachHangUserId();

    INSERT INTO dbo.Users (idUser, userName, [password], tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, createddate, createdby, [status])
    VALUES (@NewUserId, @userName, @password, @tenuser, @loaiuser, @gioiTinh, @ngaySinh, @soDienThoai, @email, @createddate, @createdby, @status);
END;


-- Hàm get next userID của Nhân viên
CREATE FUNCTION HamGetNextNhanVienUserId()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxUserId varchar(10);
    DECLARE @NextId int;
    DECLARE @NewUserId varchar(10);

    SELECT @MaxUserId = MAX(idUser)
    FROM Users
    WHERE idUser LIKE 'NV%';
    IF @MaxUserId IS NULL
        SET @MaxUserId = 'NV00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxUserId, 3, LEN(@MaxUserId)) + 1);

    SET @NewUserId = 'NV' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewUserId;
END;


-- proc insert cho nhân viên
CREATE PROCEDURE InsertNhanVienNg
    @userName varchar(50),
    @password varchar(50),
    @tenuser nvarchar(100),
    @loaiuser nvarchar(50),
    @gioiTinh nvarchar(10),
    @ngaySinh date,
    @soDienThoai varchar(20),
    @email varchar(100),
    @thongTin nvarchar(255),
    @status varchar(20)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextNhanVienUserId();

    INSERT INTO dbo.Users (idUser, userName, [password], tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, thongTinUser, [status])
    VALUES (@NewUserId, @userName, @password, @tenuser, @loaiuser, @gioiTinh, @ngaySinh, @soDienThoai, @email, @thongTin, @status);
END;

-- Hàm get next userID của BacSi
CREATE FUNCTION HamGetNextBacSiUserId()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxUserId varchar(10);
    DECLARE @NextId int;
    DECLARE @NewUserId varchar(10);

    SELECT @MaxUserId = MAX(idUser)
    FROM Users
    WHERE idUser LIKE 'BS%';
    IF @MaxUserId IS NULL
        SET @MaxUserId = 'BS00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxUserId, 3, LEN(@MaxUserId)) + 1);

    SET @NewUserId = 'BS' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewUserId;
END;

-- proc insert bác sĩ 
CREATE or alter PROCEDURE InsertBacSiNg
    @userName varchar(50),
    @password varchar(50),
    @tenuser nvarchar(100),
    @loaiuser nvarchar(50),
    @gioiTinh nvarchar(10),
    @ngaySinh date,
    @soDienThoai varchar(20),
    @email varchar(100),
    @thongTin nvarchar(255),
    @status varchar(20)
AS
BEGIN
    DECLARE @NewUserId varchar(10);
    SET @NewUserId = dbo.HamGetNextBacSiUserId();

    INSERT INTO dbo.Users (idUser, userName, [password], tenuser, loaiuser, gioiTinh, ngaySinh, soDienThoai, email, thongTinUser, [status])
    VALUES (@NewUserId, @userName, @password, @tenuser, @loaiuser, @gioiTinh, @ngaySinh, @soDienThoai, @email, @thongTin, @status);
END;


select * from dbo.NhaCungCap
insert into dbo.NhaCungCap (tenNCC,diaChiNCC,SDT,nhanVienLienHe) 

-- Hàm get next maNhaCC
CREATE or alter FUNCTION HamGetNextMaNhaCC()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxMaNCC varchar(10);
    DECLARE @NextId int;
    DECLARE @NewMaNCC varchar(10);

    SELECT @MaxMaNCC =MAX(maNCC)
    FROM NhaCungCap
    IF @MaxMaNCC IS NULL
        SET @MaxMaNCC = 'NCC00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxMaNCC, 4, LEN(@MaxMaNCC)) + 1);

    SET @NewMaNCC = 'NCC' + RIGHT('00' + CONVERT(varchar(10), @NextId), 2);

    RETURN @NewMaNCC;
END;

-- proc insert nhà cung cấp 
CREATE PROCEDURE InsertNhaCungCap
    @tenNCC nvarchar(100),
    @diaChiNCC nvarchar(255),
    @SDT varchar(20),
    @nhanVienLienHe nvarchar(100),
	@createddate datetime,
    @createdby varchar(50)
AS
BEGIN
    DECLARE @NewMaNCC varchar(10);
    SET @NewMaNCC = dbo.HamGetNextMaNhaCC();

    INSERT INTO NhaCungCap (maNCC, tenNCC, diaChiNCC, SDT, nhanVienLienHe, createddate, createdby)
    VALUES (@NewMaNCC, @tenNCC, @diaChiNCC, @SDT, @nhanVienLienHe, @createddate, @createdby);
END;



-- Hàm get next maPhieuNhap
CREATE FUNCTION HamGetNextMaPhieuNhap()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxMaPhieuNhap varchar(10);
    DECLARE @NextId int;
    DECLARE @NewMaPhieuNhap varchar(10);

    SELECT @MaxMaPhieuNhap =MAX(maPN)
    FROM PhieuNhap
    IF @MaxMaPhieuNhap IS NULL
        SET @MaxMaPhieuNhap = 'PN00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxMaPhieuNhap, 3, LEN(@MaxMaPhieuNhap)) + 1);

    SET @NewMaPhieuNhap = 'PN' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewMaPhieuNhap;
END;

--proc insert phiếu nhập 
CREATE  or alter PROCEDURE InsertPhieuNhap
    @maNCC varchar(10),
   @createddate datetime,
    @createdby varchar(50)
AS
BEGIN
    DECLARE @NewPhieuNhapId varchar(10);
    SET @NewPhieuNhapId = dbo.HamGetNextMaPhieuNhap(); 

    INSERT INTO PhieuNhap (maPN, maNCC, createddate, createdby)
    VALUES (@NewPhieuNhapId, @maNCC, @createddate, @createdby);
END;



-- Hàm get next maDichVu
CREATE FUNCTION HamGetNextIdDichVu()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxIdDichVu varchar(10);
    DECLARE @NextId int;
    DECLARE @NewIdDichVu varchar(10);

    SELECT @MaxIdDichVu =MAX(idDichVu)
    FROM DichVu
    IF @MaxIdDichVu IS NULL
        SET @MaxIdDichVu = 'DV00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxIdDichVu, 3, LEN(@MaxIdDichVu)) + 1);

    SET @NewIdDichVu = 'DV' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewIdDichVu;
END;

--proc insert DichVu
CREATE or alter PROCEDURE InsertDichVuNg
    @tenDichVu nvarchar(100),
    @donGia float,
    @thuongHieu nvarchar(100),
    @loaiSanPham nvarchar(100),
	@slcon int,
	@slban int,
    @donViTinh nvarchar(50),
    @createddate datetime,
    @createdby varchar(50)
AS
BEGIN
    DECLARE @NewIdDich varchar(10);
    SET @NewIdDich = dbo.HamGetNextIdDichVu(); -- Giả sử có một hàm tương tự để tạo idDich mới

    INSERT INTO DichVu (idDichVu, tenDichVu, donGia, thuongHieu, loaiSanPham, soLuongHienCon, soLuongDaBan, donViTinh, createddate, createdby)
    VALUES (@NewIdDich, @tenDichVu, @donGia, @thuongHieu, @loaiSanPham,@slcon, @slban,@donViTinh, @createddate, @createdby);
END;

-- Hàm get next maDonHang
CREATE FUNCTION HamGetNextmaDonHang()
RETURNS varchar(10)
AS
BEGIN
    DECLARE @MaxMaDonHang varchar(10);
    DECLARE @NextId int;
    DECLARE @NewMaDonHang varchar(10);

    SELECT @MaxMaDonHang =MAX(maDonHang)
    FROM DonHang
    IF @MaxMaDonHang IS NULL
        SET @MaxMaDonHang = 'DH00'; 
    SET @NextId = CONVERT(int, SUBSTRING(@MaxMaDonHang, 3, LEN(@MaxMaDonHang)) + 1);

    SET @NewMaDonHang = 'DH' + RIGHT('00' + CONVERT(varchar(10), @NextId), 3);

    RETURN @NewMaDonHang;
END;

-- hàm insert donHang
CREATE or alter PROCEDURE InsertDonHangNg
    @idKhachHang varchar(10),
    @sdtGiaoHang varchar(20),
    @diaChiGiaoHang nvarchar(255),
    @ngayGiaoHang date,
	@pthucthanhtoan nvarchar(255),
	@ngaythanhtoan date,
    @trangThai nvarchar(50),
    @createddate datetime,
    @createdby varchar(50)
AS
BEGIN
    DECLARE @NewMaDonHang varchar(10);
    SET @NewMaDonHang = dbo.HamGetNextmaDonHang(); 

    INSERT INTO DonHang (maDonHang, idKhachHang, sdtGiaoHang, diaChiGiaoHang, ngayGiaoHang,phThucThanhToan, ngayThanhToan, trangThai, createddate, createdby)
    VALUES (@NewMaDonHang, @idKhachHang, @sdtGiaoHang, @diaChiGiaoHang, @ngayGiaoHang,@pthucthanhtoan,@ngaythanhtoan, @trangThai, @createddate, @createdby);
END;

select * from dbo.ThuCung
insert into dbo.ThuCung(idThuCung,tenThuCung,gioiTinh,loaiThuCung,tuoi,createddate,createdby)
-- Hàm get next maChiTietDichVu






-- Linh Nguyễn Đã Chạy rồi nhé

create or alter TRIGGER tr_ChiTietDonHang
ON ChiTietDonHang
AFTER INSERT,delete, update
AS
BEGIN
	set nocount on
	begin transaction
	IF not exists (SELECT * FROM deleted)
		BEGIN
		----HÀNH ĐỘNG INSERT
			--giảm số lượng ở bảng DichVu
			UPDATE DichVu
			SET soLuongHienCon = soLuongHienCon - i.tgsoLuongDat
			FROM (select idDichVu, sum(soLuong) as tgsoLuongDat
					from inserted
					group by idDichVu) i
			WHERE DichVu.idDichVu=i.idDichVu and DichVu.donViTinh <> N'Lần'

			UPDATE DichVu
			SET 
			soLuongDaBan = soLuongDaBan + i.tgsoLuongDat
			FROM (select idDichVu, sum(soLuong) as tgsoLuongDat
					from inserted
					group by idDichVu) i
			WHERE DichVu.idDichVu=i.idDichVu
			--kiểm tra điều kiện 
			if exists (select * from DichVu s
						where soLuongHienCon < 0)
				rollback tran
			else
				commit
		END
	ELSE 
		IF not exists (SELECT * FROM inserted)
			BEGIN
			----HÀNH ĐỘNG DELETE
				--tăng số lượng ở bản SanPham
				UPDATE DichVu
				SET soLuongHienCon = soLuongHienCon + soLuong
				FROM deleted d
				WHERE DichVu.idDichVu=d.idDichVu and DichVu.donViTinh <> N'Lần'
				UPDATE DichVu
				SEt
				soLuongDaBan = soLuongDaban - soLuong
				FROM deleted d
				WHERE DichVu.idDichVu=d.idDichVu
				commit
			END
		ELSE
			BEGIN
			----HÀNH ĐỘNG UPDATE
			if update (soLuong) 
				begin
				-- Tăng/giảm số lượng ở bảng SanPham
					UPDATE DichVu
					SET soLuongHienCon = soLuongHienCon + d.soLuong -i.soLuong
					FROM deleted d, inserted i
					WHERE DichVu.idDichVu=d.idDichVu and DichVu.idDichVu=i.idDichVu and DichVu.donViTinh <> N'Lần'

					UPDATE DichVu
					SET 
					soLuongDaBan = soLuongDaBan - d.soLuong + i.soLuong
					FROM deleted d, inserted i
					WHERE DichVu.idDichVu=d.idDichVu and DichVu.idDichVu=i.idDichVu

					if exists (select * from DichVu s
							where soLuongHienCon < 0)
						or exists (select * from ChiTietDonHang
								where soLuong <1)
						rollback transaction
					else
						commit
				end
			else
			rollback
	end
END


create or alter TRIGGER tr_ChiTietPhieuNhap
ON ChiTietPhieuNhap
AFTER INSERT,delete, update
AS
BEGIN
	set nocount on
	If not exists (select * from deleted)
		begin
			--Hành động insert
			--tăng số lượng ở bảng SanPham
			UPDATE DichVu
			SET soLuongHienCon = soLuongHienCon + i.tgsoLuongNhap
			FROM (select idDichVu, sum(soLuongNhap) as tgsoLuongNhap
					from inserted
					group by idDichVu) i
			WHERE DichVu.idDichVu=i.idDichVu and DichVu.donViTinh <> N'Lần'
		end
	else
		if not exists (select * from inserted)
			begin
				--hành động delete
				--giảm số lượng ở bảng SanPham
				Update DichVu
				set soLuongHienCon = soLuongHienCon -d.soLuongNhap
				from deleted d
				where DichVu.idDichVu=d.idDichVu and DichVu.donViTinh <> N'Lần'
			end
		else
			begin
			 if update (soLuongNhap)
			 begin
			 begin tran
				--hành động update
				--thay đổi số lượng ở bảng SanPham
				update DichVu
				set soLuongHienCon = soLuongHienCon - d.soLuongNhap + i.soLuongNhap
				from deleted d, inserted i
				WHERE DichVu.idDichVu=d.idDichVu and DichVu.idDichVu=i.idDichVu and DichVu.donViTinh <> N'Lần'
				
					if 
						exists (select * from ChiTietPhieuNhap
								where soLuongNhap <1)
						rollback transaction
					else
						commit
				
				end
	end
END

CREATE TRIGGER InsertUserRole
ON Users
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON; 

    INSERT INTO role_User (roleId, idUser)
    SELECT 
        CASE 
            WHEN SUBSTRING(i.idUser, 1, 2) = 'AD' THEN 1
            WHEN SUBSTRING(i.idUser, 1, 2) = 'NV' THEN 2
            WHEN SUBSTRING(i.idUser, 1, 2) = 'BS' THEN 2
            ELSE 3
        END,
        i.idUser
    FROM inserted i
    WHERE i.idUser LIKE 'AD%' OR i.idUser LIKE 'NV%' OR i.idUser LIKE 'BS%' OR i.idUser LIKE 'KH%';

END;

select * from DonHang

select Top 5 tenDichVu, soLuongDaBan
from DichVu
order by soLuongDaBan desc

select Top 5 tenDichVu, sum(soLuong) as soLuong
from ChiTietDonHang c, DichVu d
where c.idDichVu = d.idDichVu
group by c.idDichVu, tenDichVu
order by soLuong desc

select Top 5 tenDichVu, sum(soLuongNhap) as soLuong
from ChiTietPhieuNhap c, DichVu d
where c.idDichVu = d.idDichVu
group by c.idDichVu, tenDichVu
order by soLuong desc


select sum(soLuong * donGia) as thanhtien , day(c.createddate) as ngay
from ChiTietDonHang c, DichVu d, DonHang dh
where c.idDichVu = d.idDichVu  and c.maDonHang = dh.maDonHang
group by c.createddate


select count(maDonHang) as soLuong
from DonHang where trangThai = N'Đã thanh toán'


