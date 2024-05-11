package com.petshop.controller.web.api;

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
@WebServlet(urlPatterns= {"/api-web-khachHang"})
public class UserAPI extends HttpServlet{
	
	@Inject
	private IUserService UserService;
		@Override
		protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			UserModel updateModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
			updateModel.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
			updateModel = UserService.updateUserKhachHang(updateModel);
			mapper.writeValue(resp.getOutputStream(), updateModel);
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
				ObjectMapper mapper = new ObjectMapper();
				req.setCharacterEncoding("UTF-8");
				resp.setContentType("application/json");
				UserModel newModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
				Long id= UserService.DangKiTaiKhoan(newModel.getTenuser(), newModel.getUserName(), newModel.getPassword(), newModel.getEmail());
				if(id!=null) {
					newModel= UserService.findByUserNameAndPasswordAndStatus(newModel.getUserName(), newModel.getPassword(), 1);
					SessionUtil.getInstance().putValue(req, "USERMODEL", newModel);
					mapper.writeValue(resp.getOutputStream(), newModel);
				}
				
			}

	
}
