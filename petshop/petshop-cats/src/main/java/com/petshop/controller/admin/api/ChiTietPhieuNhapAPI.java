package com.petshop.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.ChiTietPhieuNhapModel;
import com.petshop.model.DonHangModel;
import com.petshop.model.UserModel;
import com.petshop.service.IChiTietPhieuNhapService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-admin-chiTietPhieuNhap"})
public class ChiTietPhieuNhapAPI extends HttpServlet{
	@Inject 
	private IChiTietPhieuNhapService chiTietPhieuNhapService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ChiTietPhieuNhapModel newModel = HttpUtil.of(req.getReader()).toModel(ChiTietPhieuNhapModel.class);
		newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		newModel = chiTietPhieuNhapService.saveChiTietPhieuNhap(newModel);
		mapper.writeValue(resp.getOutputStream(), newModel);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ChiTietPhieuNhapModel updateDH = HttpUtil.of(req.getReader()).toModel(ChiTietPhieuNhapModel.class);
		updateDH.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		updateDH = chiTietPhieuNhapService.updateChiTietPhieuNhap(updateDH);
		mapper.writeValue(resp.getOutputStream(), updateDH);
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ChiTietPhieuNhapModel newModel = HttpUtil.of(req.getReader()).toModel(ChiTietPhieuNhapModel.class);
		chiTietPhieuNhapService.deleteChiTietPhieuNhap(newModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
