package com.petshop.dao.impl;

import java.util.List;

import com.petshop.dao.IChiTietDonHangDAO;
import com.petshop.mapper.ChiTietDonHangMapper;
import com.petshop.mapper.DichVuMapper;
import com.petshop.mapper.DonHangMapper;
import com.petshop.mapper.UserMapper;
import com.petshop.model.ChiTietDonHangModel;
import com.petshop.model.DonHangModel;
import com.petshop.paging.Pageble;

public class ChiTietDonHangDAO extends AbstractDAO<ChiTietDonHangModel> implements IChiTietDonHangDAO{


	@Override
	public List<ChiTietDonHangModel> findAllChiTietDonHang(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM ChiTietDonHang");
		 
	    if (pageble.getSorter() != null) {
	        sql.append(" ORDER BY ")
	           .append(pageble.getSorter().getSortName())
	           .append(" ")
	           .append(pageble.getSorter().getSortBy());
	    }

	    if (pageble.getOffset() != null && pageble.getLimit() != null) {
	        sql.append(" OFFSET ")
	           .append(pageble.getOffset())
	           .append(" ROWS FETCH NEXT ")
	           .append(pageble.getLimit())
	           .append(" ROWS ONLY");
	    }

	    return query(sql.toString(), new ChiTietDonHangMapper());

	}

	@Override
	public int getTotalItemChiTietDonHang() {
		String sql ="select count(*) from ChiTietDonHang "; 
		return count(sql);
	}




	@Override
	public ChiTietDonHangModel findOneChiTietDonHang(String maDonHang, String idDichVu) {
		String sql = "select * from ChiTietDonHang WHERE maDonHang = ? and idDichVu = ?";
		List<ChiTietDonHangModel> userList = query(sql, new ChiTietDonHangMapper(), maDonHang, idDichVu);
		    if (!userList.isEmpty()) {
		        return userList.get(0);
		    }
		    return null; 
	}



	@Override
	public Long saveDonHang(ChiTietDonHangModel cTDHModel) {
		 String sql = "{CALL InsertChiTietDonHang(?, ?, ?, ?, ?, ?, ?)}";
		    return insert(sql, cTDHModel.getMaDonHang(),
		    		cTDHModel.getIdDichVu(), cTDHModel.getIdBacSi(),
		    		cTDHModel.getIdNhanVien(), cTDHModel.getSoLuong(), 
		    		cTDHModel.getCreateddate(), cTDHModel.getCreatedby());
	}



	@Override
	public ChiTietDonHangModel findOneDonHangByID(Long newId) {
		String sql = "select * from ChiTietDonHang WHERE maDonHang = 'DH001' and idDichVu ='DV001'";
		List<ChiTietDonHangModel> userList = query(sql, new ChiTietDonHangMapper());
		    if (!userList.isEmpty()) {
		        return userList.get(0);
		    }
		    return null;
	}



	@Override
	public void updateChiTietDonHang(ChiTietDonHangModel updateCTDH) {
		 String sql = "{CALL UpdateChiTietDonHang(?, ?, ?, ?, ?, ?, ?)}";
		    update (sql, updateCTDH.getMaDonHang(),
		    		updateCTDH.getIdDichVu(), updateCTDH.getIdBacSi(),
		    		updateCTDH.getIdNhanVien(), updateCTDH.getSoLuong(), 
		    		updateCTDH.getModifieddate(), updateCTDH.getModifiedby());
		
	}

	@Override
	public void deleteChiTietDonHang(String maDonHang, String idDichVu) {
		String sql = "{CALL DeleteChiTietDonHang (?,?)}";
		update(sql, maDonHang,idDichVu);
		
	}



}
