package com.spring.AtoZ.qr.controller;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.AtoZ.utils.ZxingHelper;

@Controller
@RequestMapping("WH/qr")
public class QRController {
	
	@RequestMapping("/qrCodeMake")
	public void getQRCodeImage(String text, HttpServletResponse response) throws Exception {
		response.setContentType("image/png");
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(ZxingHelper.getQRCodeImage(text, 400, 400));
		outputStream.flush();
		outputStream.close();
	}
}
