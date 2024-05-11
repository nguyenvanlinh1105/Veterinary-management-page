package com.petshop.service;

import java.util.List;

import com.petshop.model.ChiTietDonHangModel;
import com.petshop.model.UserModel;
import com.petshop.paging.Pageble;

public interface IChiTietDonHangService {

	List<ChiTietDonHangModel> findAllChiTietDonHang(Pageble pageble);

	int getTotalItemChiTietDonHang();

	ChiTietDonHangModel findOneChiTietDonHang(String maDonHang, String idDichVu);


	ChiTietDonHangModel saveChiTietDonHang(ChiTietDonHangModel newModel);

	ChiTietDonHangModel updateChiTietDonHang(ChiTietDonHangModel updateCTDH);

	void deleteDonHang(String[] ids);

}
