package com.simbaart.api.admin;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.PhotoPostsDTO;
import com.simbaart.service.IPhotoPostsService;
import com.simbaart.utils.UploadFileUtil;

import javax.servlet.http.HttpServletRequest;

@RestController(value = "photoPostsAPIOfAdmin")
public class PhotoPostsAPI {
	@Autowired
	private IPhotoPostsService photoPostsService;
	
	@PostMapping("/api/photo/editposts")
	public PhotoPostsDTO createPhotoPosts(HttpServletRequest req, @RequestBody PhotoPostsDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getImage());
		}
		return photoPostsService.save(dto);
	}
	
	@PutMapping("/api/photo/editposts")
	public PhotoPostsDTO updatePhotoPosts(HttpServletRequest req,@RequestBody PhotoPostsDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getImage());
		}
		return photoPostsService.save(dto);
	}
	
	@DeleteMapping("/api/photo/editposts")
	public PhotoPostsDTO deletePhotoPosts(@RequestBody PhotoPostsDTO dto) {
		photoPostsService.delete(dto.getId());
		return dto;
	}
	
}
