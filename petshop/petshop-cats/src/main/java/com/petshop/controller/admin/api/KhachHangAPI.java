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
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
import com.petshop.service.IUserService;
@WebServlet(urlPatterns= {"/api-admin-khachHang"})
public class KhachHangAPI extends HttpServlet{
	
	@Inject
	private IUserService UserService;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			UserModel newModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
			newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
			newModel = UserService.saveKhachHang(newModel);
			mapper.writeValue(resp.getOutputStream(), newModel);
		}
		@Override
		protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			UserModel updateModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
			updateModel.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
			updateModel = UserService.updateKhachHang(updateModel);
			mapper.writeValue(resp.getOutputStream(), updateModel);
		}
		@Override
		protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			UserModel newModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
			UserService.deleteUser(newModel.getIds());
			mapper.writeValue(resp.getOutputStream(), "{}");
		}
	
}
