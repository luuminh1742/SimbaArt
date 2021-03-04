package com.simbaart.api.admin;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.BlogPostsDTO;
import com.simbaart.service.IBlogPostsService;
import com.simbaart.utils.UploadFileUtil;

import javax.servlet.http.HttpServletRequest;

@RestController(value = "blogPostsAPIOfAdmin")
public class BlogPostsAPI {
	@Autowired
	private IBlogPostsService blogPostsService;
	
	@PostMapping("/api/blog/posts")
	public BlogPostsDTO createBlogPosts(HttpServletRequest req, @RequestBody BlogPostsDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getThumbnail());
		}
		return blogPostsService.save(dto);
	}
	
	@PutMapping("/api/blog/posts")
	public BlogPostsDTO updateBlogPosts(HttpServletRequest req, @RequestBody BlogPostsDTO dto) {
		if(!dto.getBase64().equals("")) {
			byte[] decodeBase64 = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
			String root = req.getServletContext().getRealPath("/");
			UploadFileUtil uploadFileUtil = new UploadFileUtil(root);
			uploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+dto.getThumbnail());
		}
		return blogPostsService.save(dto);
	}
	@DeleteMapping("/api/blog/posts")
	public BlogPostsDTO deleteBlogPosts(@RequestBody BlogPostsDTO dto) {
		blogPostsService.delete(dto.getId());
		return dto;
	}
}
