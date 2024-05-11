package com.petshop.dao;

import com.petshop.model.DatDichVuModel;

public interface IDatDichVuDAO {
	void saveDonHangDichVu(DatDichVuModel newModel);

	DatDichVuModel findOneDatDichVuByID();

}
