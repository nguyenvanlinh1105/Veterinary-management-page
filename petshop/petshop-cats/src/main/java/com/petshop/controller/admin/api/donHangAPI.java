package com.petshop.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.DichVuModel;
import com.petshop.model.DonHangModel;
import com.petshop.model.UserModel;
import com.petshop.service.IDichVuService;
import com.petshop.service.IDonHangService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-admin-donHang"})
public class donHangAPI extends HttpServlet{
	@Inject 
	private IDonHangService donHangService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		DonHangModel newModel = HttpUtil.of(req.getReader()).toModel(DonHangModel.class);
		newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		newModel = donHangService.saveDonHang(newModel);
		mapper.writeValue(resp.getOutputStream(), newModel);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		DonHangModel updateDH = HttpUtil.of(req.getReader()).toModel(DonHangModel.class);
		updateDH.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		updateDH = donHangService.updateDonHang(updateDH);
		mapper.writeValue(resp.getOutputStream(), updateDH);
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel newModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		donHangService.deleteDonHang(newModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
