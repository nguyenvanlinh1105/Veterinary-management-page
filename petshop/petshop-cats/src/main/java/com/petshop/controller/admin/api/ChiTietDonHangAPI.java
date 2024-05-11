package com.petshop.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.ChiTietDonHangModel;
import com.petshop.model.UserModel;
import com.petshop.service.IChiTietDonHangService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-admin-chiTietDonHang"})
public class ChiTietDonHangAPI extends HttpServlet{
	@Inject 
	private IChiTietDonHangService  ChiTietDonHangService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ChiTietDonHangModel newModel = HttpUtil.of(req.getReader()).toModel(ChiTietDonHangModel.class);
		newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		newModel = ChiTietDonHangService.saveChiTietDonHang(newModel);
		mapper.writeValue(resp.getOutputStream(), newModel);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ChiTietDonHangModel updateCTDH = HttpUtil.of(req.getReader()).toModel(ChiTietDonHangModel.class);
		updateCTDH.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		updateCTDH = ChiTietDonHangService.updateChiTietDonHang(updateCTDH);
		mapper.writeValue(resp.getOutputStream(), updateCTDH);
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ChiTietDonHangModel newModel = HttpUtil.of(req.getReader()).toModel(ChiTietDonHangModel.class);
		ChiTietDonHangService.deleteDonHang(newModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
