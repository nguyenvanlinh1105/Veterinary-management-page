package com.petshop.service;

import java.util.List;

import com.petshop.model.DonHangModel;
import com.petshop.paging.Pageble;

public interface IDonHangService {

	List<DonHangModel>findAllDonHang(Pageble pageble);

	Integer getTotalItemDonHang();

	DonHangModel findOneDonHang(String maDonHang);

	DonHangModel saveDonHang(DonHangModel newModel);

	DonHangModel updateDonHang(DonHangModel updateDH);

	void deleteDonHang(String[] ids);

	List<DonHangModel> findAllDonHang();

	DonHangModel saveDonHangTuVan(DonHangModel newModel);


}
