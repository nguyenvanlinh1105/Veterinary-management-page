package com.petshop.dao.impl;

import java.util.List;

import com.petshop.dao.IThuCungDAO;
import com.petshop.mapper.ThuCungMapper;
import com.petshop.mapper.UserMapper;
import com.petshop.model.ThuCungModel;
import com.petshop.model.UserModel;
import com.petshop.paging.Pageble;

public class ThuCungDAO extends AbstractDAO<ThuCungModel> implements IThuCungDAO{




	@Override
	public List<ThuCungModel> findAllThuCung(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM ThuCung");
		if(pageble.getSorter() !=null) {
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

		return query(sql.toString(), new ThuCungMapper());
	}

	
	   
	@Override
	public int getTotalItemThuCung() {
		String sql = "Select count(*) from dbo.ThuCung";
		return count(sql);
	}

	@Override
	public ThuCungModel findOneThuCung(String idThuCung) {
		String sql = "select * from ThuCung WHERE idThuCung = ?";
		List<ThuCungModel> userList = query(sql, new ThuCungMapper(), idThuCung);
		    if (!userList.isEmpty()) {
		        return userList.get(0);
		    }
		    return null;
	}





	@Override
	public Long saveThuCung(ThuCungModel newModel) {
		 String sql = "{CALL InsertThuCung(?, ?, ?, ?, ?, ?)}";
		    return insert(sql, newModel.getTenThuCung(),
		            newModel.getGioiTinh(), newModel.getLoaiThuCung(),
		            newModel.getTuoi(),  newModel.getCreateddate(), newModel.getCreatedby());
	}





	@Override
	public ThuCungModel findOneThuCung(Long newId) {
		String sql = "select * from  ThuCung  where idThuCung ='TC001'";
		List<ThuCungModel> TCList = query(sql, new ThuCungMapper());
		    if (!TCList.isEmpty()) {
		        return TCList.get(0);
		    }
		    return null; 
	}





	@Override
	public void updateThuCung(ThuCungModel updateModel) {
		 String sql = "{CALL UpdateThucung (?, ?, ?, ?, ?, ?, ?)}";
		    update(sql, 
		    		updateModel.getIdThuCung(),
		    		updateModel.getTenThuCung(), 
		    		updateModel.getGioiTinh(), 
		    		updateModel.getLoaiThuCung(), 
		    		updateModel.getTuoi(), 
		    		updateModel.getModifieddate(), 
		    		updateModel.getModifiedby());
		
	}





	@Override
	public void deleteThuCung(String id) {
		String sql = "{CALL DeleteThuCung (?)}";
		update(sql, id );
		
		
	}



	@Override
	public List<ThuCungModel> findAllThuCung() {
		String sql = "select * from  ThuCung ";
		return query(sql, new ThuCungMapper());
	}



	@Override
	public List<ThuCungModel> findAllThuCungByIdKH(String idUser) {
		String sql = "{CALL GetThuCungByUserId (?)}";
		return query(sql, new ThuCungMapper(),idUser);
	}

}
