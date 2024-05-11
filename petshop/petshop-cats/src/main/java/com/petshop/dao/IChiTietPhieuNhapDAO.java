package com.petshop.dao;

import java.util.List;

import com.petshop.model.ChiTietPhieuNhapModel;
import com.petshop.paging.Pageble;

public interface IChiTietPhieuNhapDAO {
	List<ChiTietPhieuNhapModel> findAllChiTietPhieuNhap(Pageble pageble);
	int getToltalItemChiTietPhieuNhap();
	ChiTietPhieuNhapModel findOneChiTietPhieuNhap(String maPN, String idDichVu);
	Long saveChiTietPhieuNhap(ChiTietPhieuNhapModel newModel);
	ChiTietPhieuNhapModel findOneChiTietPhieuNhapByID(Long newId);
	void updateChiTietPhieuNhap(ChiTietPhieuNhapModel updatePN);
}
