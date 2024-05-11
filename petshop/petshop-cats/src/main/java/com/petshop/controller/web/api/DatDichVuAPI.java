package com.petshop.controller.web.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.DatDichVuModel;
import com.petshop.model.UserModel;
import com.petshop.service.IDatDichVuService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-web-datDichVu"})
public class DatDichVuAPI extends HttpServlet{
	
	@Inject 
	private IDatDichVuService  datDichVuService ;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		UserModel model = (UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		if(model!=null) {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			DatDichVuModel newModel = HttpUtil.of(req.getReader()).toModel(DatDichVuModel.class);
			newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
			newModel.setIdKhachHang(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getIdUser());
			newModel = datDichVuService.saveDonHangDichVu(newModel);
			mapper.writeValue(resp.getOutputStream(), newModel);
		 }else {
			 resp.sendRedirect(req.getContextPath()+"/dang-nhap?action=login");
		 }
	}	
}
