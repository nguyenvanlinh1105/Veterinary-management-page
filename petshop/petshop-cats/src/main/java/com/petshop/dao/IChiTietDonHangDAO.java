package com.petshop.dao;

import java.util.List;

import com.petshop.model.ChiTietDonHangModel;
import com.petshop.paging.Pageble;

public interface IChiTietDonHangDAO extends GenericDAO<ChiTietDonHangModel>{

	ChiTietDonHangModel findOneChiTietDonHang(String maDonHang, String idDichVu);
	List<ChiTietDonHangModel> findAllChiTietDonHang(Pageble pageble);
	int getTotalItemChiTietDonHang();
	Long saveDonHang(ChiTietDonHangModel cTDHModel);
	ChiTietDonHangModel findOneDonHangByID(Long newId);
	void updateChiTietDonHang(ChiTietDonHangModel updateCTDH);
	void deleteChiTietDonHang(String maDonHang, String idDichVu);
}
