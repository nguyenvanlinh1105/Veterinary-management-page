package com.petshop.dao;

import java.util.List;

import com.petshop.model.DichVuModel;
import com.petshop.model.DonHangModel;
import com.petshop.paging.Pageble;

public interface IDonHangDAO {
	DonHangModel findOneDonHang(String maDonHang);
	List<DonHangModel> findAllDonHang(Pageble pageble);
	Integer getTotalItemDonHang();
	Long saveDonHang(DonHangModel donHangModel);
	DonHangModel findOneDonHangId(Long newId);
	void updateDichVu(DonHangModel updateDonHang);
	void deleteDichVu(String id);
	List<DonHangModel> findAllDonHang();
	Long saveDonHangTV(DonHangModel donHangTVModel);
}
