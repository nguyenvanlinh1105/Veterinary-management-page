package com.petshop.dao;

import java.util.List;

import com.petshop.model.UserModel;
import com.petshop.paging.Pageble;

public interface IUserDAO { 
	UserModel findOne(Long idUser);
	UserModel findOneUser(String id) ;
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);

	
	List<UserModel> findAllNhanVien(Pageble pageble);
	List<UserModel> findAllBacSi(Pageble pageble);
	List<UserModel> findAllKhachHang(Pageble pageble);
	List<UserModel> findAllAdmin(Pageble pageble);
	int getToltalItemNhanVien();
	int getTotalItemBacSi();
	int getTotalItemKhachHang();
	int getTotalItemAdmin();

	void deleteUser( String id);
	void updateAdmin_KhachHang (UserModel updateAD);
	void updateNhanVien_BacSi (UserModel updateAD);
	
	Long saveAdmin (UserModel userModel);
	Long saveKhachHang (UserModel userModel);
	Long saveNhanVien(UserModel newModel);
	Long saveBacSi (UserModel userModel);
	List<UserModel> findAllKhachHang();
	List<UserModel> findAllBacSi();
	List<UserModel> findAllNhanVien();
	Long DangKiTaiKhoan(String tenuser, String userName, String password, String email);
	void updateUserKhachHang(UserModel updateModel);

}