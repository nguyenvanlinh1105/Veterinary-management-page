package com.petshop.controller.admin.api;



import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.UserModel;
import com.petshop.service.IUserService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-admin-nhanVien"})
public class NhanVienAPI extends HttpServlet{
	@Inject 
	private IUserService  userService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel newModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		newModel = userService.saveNhanVien(newModel);
		mapper.writeValue(resp.getOutputStream(), newModel);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel updateNew = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		updateNew.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		updateNew = userService.updateNhanVien(updateNew);
		mapper.writeValue(resp.getOutputStream(), updateNew);
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel newModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		userService.deleteUser(newModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
