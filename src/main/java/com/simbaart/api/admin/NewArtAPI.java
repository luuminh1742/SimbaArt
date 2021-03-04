package com.simbaart.api.admin;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.NewArtDTO;
import com.simbaart.service.INewArtService;
import com.simbaart.utils.UploadFileUtil;

import javax.servlet.http.HttpServletRequest;

@RestController(value = "newArtAPIOfAdmin")
public class NewArtAPI {
	@Autowired
	private INewArtService newArtService;
	
	@PostMapping("/api/newart")
	public NewArtDTO createPhotoPosts(HttpServletRequest req, @RequestBody NewArtDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getBanner());
		}
		return newArtService.save(dto);
	}
	
	@PutMapping("/api/newart")
	public NewArtDTO updatePhotoPosts(HttpServletRequest req,@RequestBody NewArtDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getBanner());
		}
		return newArtService.save(dto);
	}
	
	@DeleteMapping("/api/newart")
	public NewArtDTO deletePhotoPosts(@RequestBody NewArtDTO dto) {
		newArtService.delete(dto.getId());
		return dto;
	}
	
}
