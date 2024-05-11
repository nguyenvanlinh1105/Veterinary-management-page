package com.petshop.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.petshop.dao.IDonHangCartDAO;
import com.petshop.model.DonHangCartModel;
import com.petshop.service.IDonHangCartService;

public class DonHangCartService implements IDonHangCartService{
	@Inject 
	private IDonHangCartDAO donHangCartDAO;

	@Override
	public List<DonHangCartModel> findAllDichVuCartByIdUser(String idUser) {
		return donHangCartDAO.findAllDonHangCartForId(idUser);
	}

	@Override
	public Double TinhTongTien() {
		return donHangCartDAO.tinhTongTien();
	}

	@Override
	public List<DonHangCartModel> findAllDichVuCartByIdUserChuaThanhToan(String idUser) {
		return donHangCartDAO.findAllDichVuCartByIdUserChuaThanhToan(idUser);
	}

	@Override
	public void updateTrangThaiDonHangDichVu(String[] ids, String idUser, String phThucThanhToan) {
		for(String maDonHang : ids) {
			donHangCartDAO.updateTrangThaiDonHang(maDonHang,idUser,phThucThanhToan);
		}
	}



}
