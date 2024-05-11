package com.petshop.service;

import java.util.List;

import com.petshop.model.UserModel;
import com.petshop.paging.Pageble;

public interface IUserService {
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);
	List<UserModel> findAllAdmin(Pageble pageble);
	List<UserModel> findAllNhanVien(Pageble pageble);
	List<UserModel> findAllBacSi(Pageble pageble);
	List<UserModel> findAllKhachHang(Pageble pageble);
	int getTotalItemAdmin();
	int getTotalItemNhanVien();
	int getTotalItemBacSi();
	int getTotalItemKhachHang();
	
	UserModel saveAdmin(UserModel newModel);
	UserModel updateAdmin (UserModel updateNew);
	void deleteUser (String [] ids);
	UserModel findOneAdmin(String id);
	
	UserModel saveNhanVien(UserModel newModel);
	UserModel updateNhanVien (UserModel updateNew);
	UserModel findOneNhanVien(String id);

	UserModel saveBacSi(UserModel newModel);
	UserModel updateBacSi (UserModel updateNew);
	UserModel findOneBacSi(String id);
	UserModel findOneKhachHang(String idUser);
	UserModel saveKhachHang(UserModel newModel);
	UserModel updateKhachHang(UserModel updateModel);
	
	
	List<UserModel> findAllKhachHang();
	List<UserModel>  findAllBacSi();
	List<UserModel>  findAllNhanVien();
	Long DangKiTaiKhoan(String tenuser, String userName, String password, String email);
	UserModel findOneUser(String idUser);
	UserModel updateUserKhachHang(UserModel updateModel);
	


}
