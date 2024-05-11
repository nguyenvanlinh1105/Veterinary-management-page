package com.petshop.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.petshop.dao.ITheDAO;
import com.petshop.mapper.TheMapper;
import com.petshop.mapper.ThuCungMapper;
import com.petshop.model.TheModel;
import com.petshop.model.ThuCungModel;
import com.petshop.paging.Pageble;

public class TheDAO extends AbstractDAO<TheModel> implements ITheDAO{



	@Override
	public List<TheModel> findAllThe(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM The");

		 if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) &&StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
		        sql.append(" ORDER BY ")
		           .append(pageble.getSorter().getSortName())
		           .append(" ")
		           .append(pageble.getSorter().getSortBy());
		    }else if(StringUtils.isBlank(pageble.getSorter().getSortName()) &&StringUtils.isBlank(pageble.getSorter().getSortBy())) {
		    	sql.append("ORDER BY (SELECT NULL) ");
		    }
		    
		    if (pageble.getOffset() != null && pageble.getLimit() != null) {
		        sql.append(" OFFSET ")
		           .append(pageble.getOffset())
		           .append(" ROWS FETCH NEXT ")
		           .append(pageble.getLimit())
		           .append(" ROWS ONLY");
		    }


	    return query(sql.toString(), new TheMapper());
	}

	@Override
	public int getToltalItemThe() {
		String sql ="select count(*) from dbo.The";
		return count(sql);
	}

	
	@Override
	public TheModel findOneThe(String idThuCung) {
		String sql = "select * from The WHERE idThuCung = ?";
		List<TheModel> userList = query(sql, new TheMapper(), idThuCung);
		    if (!userList.isEmpty()) {
		        return userList.get(0);
		    }
		    return null;
	}


	@Override
	public void updateThe(TheModel updateThe) {
		 String sql = "{CALL UpdateTheByIdThuCung (?, ?, ?, ?)}";
		    update(sql, 
		    		updateThe.getIdThuCung(),
		    		updateThe.getIdKhachHang(), 
		    		updateThe.getModifieddate(), 
		    		updateThe.getModifiedby());
		
	}




	@Override
	public Long saveThe(TheModel newModel) {
		String sql = "{CALL InsertIntoThe(?, ?, ?, ?)}";
	    return insert(sql, newModel.getIdThuCung(),
	            newModel.getIdKhachHang(), newModel.getCreateddate(), newModel.getCreatedby());
	}




	@Override
	public TheModel findOneThe(Long newId) {
		String sql = "select * from  The  where idThuCung ='TC001'";
		List<TheModel> TList = query(sql, new TheMapper());
		    if (!TList.isEmpty()) {
		        return TList.get(0);
		    }
		    return null; 
	}




	@Override
	public void deleteThe(String id) {
		String sql="delete from dbo.The where idThuCung = ?";
		update (sql,id);
		
	}



}