package com.petshop.dao;

import java.util.List;

import com.petshop.model.DonHangCartModel;

public interface IDonHangCartDAO {
	List<DonHangCartModel> findAllDonHangCartForId(String idKhachHang);
	Double tinhTongTien();
	List<DonHangCartModel> findAllDichVuCartByIdUserChuaThanhToan(String idUser);
	void updateTrangThaiDonHang(String maDonHang, String idUser, String phThucThanhToan);
}
