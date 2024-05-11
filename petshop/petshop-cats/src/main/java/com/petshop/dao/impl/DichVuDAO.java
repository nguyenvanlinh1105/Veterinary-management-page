package com.petshop.dao.impl;

import java.util.List;

import com.petshop.dao.IDichVuDAO;
import com.petshop.mapper.DichVuMapper;
import com.petshop.model.DichVuModel;
import com.petshop.paging.Pageble;

public class DichVuDAO extends AbstractDAO<DichVuDAO> implements IDichVuDAO{




	@Override
	public List<DichVuModel> findAllDichVu(Pageble pageble) {
		 StringBuilder sql = new StringBuilder("SELECT * FROM DichVu");
		 
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

		    return query(sql.toString(), new DichVuMapper());
	}

	@Override
	public int getToltalItemDichVu() {
		String sql = "Select count(*) from dbo.DichVu";
		return count(sql);
	}

	@Override
	public DichVuModel findOneDichVu(String idDichVu) {
		String sql = "select * from DichVu WHERE idDichVu= ?";
		List<DichVuModel> userList = query(sql, new DichVuMapper(), idDichVu);
		    if (!userList.isEmpty()) {
		        return userList.get(0);
		    }
		    return null; 
	}

	@Override
	public Long saveDichVu(DichVuModel newModel) {
		  String sql = "{CALL InsertDichVu (?, ?, ?, ?, ?, ?, ?) }";
		    return insert(sql, newModel.getTenDichVu(),
		            newModel.getDonGia(), newModel.getThuongHieu(),
		            newModel.getLoaiSanPham(), newModel.getDonViTinh(), 
		            newModel.getCreateddate(), newModel.getCreatedby());
	}

	@Override
	public DichVuModel findOneDichVuOut(Long newId) {
		String sql = "select * from DichVu WHERE idDichVu='DV001'";
		List<DichVuModel> userList = query(sql, new DichVuMapper());
		    if (!userList.isEmpty()) {
		        return userList.get(0);
		    }
		    return null; 
	}

	@Override
	public void updateDichVu(DichVuModel updateDV) {
		 String sql = "{CALL UpdateDichVu (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
	    update(sql, 
	    		 updateDV.getIdDichVu(),
	            updateDV.getTenDichVu(), 
	            updateDV.getDonGia(), 
	            updateDV.getThuongHieu(), 
	            updateDV.getLoaiSanPham(), 
	            updateDV.getDonViTinh(), 
	            updateDV.getSoLuongHienCon(), 
	            updateDV.getSoLuongDaBan(), 
	            updateDV.getCreateddate(),
	            updateDV.getCreatedby(),
	            updateDV.getModifieddate(), 
	            updateDV.getModifiedby());
	}

	@Override
	public void deleteDichVu(String id) {
		String sql = "delete from dbo.DichVu where idDichVu=?";
		update(sql, id );
		
	}

	@Override
	public List<DichVuModel> findAllDichVu() {
		String sql = "select * from dbo.DichVu";
		return query(sql,new DichVuMapper());
	}




}
