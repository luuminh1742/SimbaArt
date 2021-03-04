package com.simbaart.api.admin;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.LinkDTO;
import com.simbaart.service.ILinkService;
import com.simbaart.utils.UploadFileUtil;

import javax.servlet.http.HttpServletRequest;

@RestController(value="linkAPIOfAdmin")
public class LinkAPI {

	@Autowired
	private ILinkService linkService;
	
	@PostMapping("/api/link")
	public LinkDTO createLink(HttpServletRequest req, @RequestBody LinkDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getBannerBelow());
		}
		return linkService.save(dto);
	}
	
	@PutMapping("/api/link")
	public LinkDTO updateLink(HttpServletRequest req,@RequestBody LinkDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getBannerBelow());
		}
		return linkService.save(dto);
	}
	
	@PostMapping("/api/link/logo")
	public LinkDTO createLogo(HttpServletRequest req,@RequestBody LinkDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getLogo());
		}
		return linkService.saveLogo(dto);
	}
	
	@PutMapping("/api/link/logo")
	public LinkDTO updateLogo(HttpServletRequest req,@RequestBody LinkDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getLogo());
		}
		return linkService.saveLogo(dto);
	}
}
