package com.petshop.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.DatDichVuModel;
import com.petshop.model.DonHangCartModel;
import com.petshop.model.DonHangModel;
import com.petshop.model.UserModel;
import com.petshop.service.IDonHangCartService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-admin-checkout"})
public class AdminCheckoutAPI extends HttpServlet{
	
	@Inject 
	private IDonHangCartService  donHangService ;
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		UserModel model = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		DonHangCartModel donHang = HttpUtil.of(req.getReader()).toModel(DonHangCartModel.class);
		if(model!=null) {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			donHang.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
			donHangService.updateTrangThaiDonHangDichVu(donHang.getIds(),donHang.getIdUser(),donHang.getPhThucThanhToan());
			mapper.writeValue(resp.getOutputStream(), "{}");
		 }else {
			 resp.sendRedirect(req.getContextPath()+"/dang-nhap?action=login");
		 }
	}	
}
