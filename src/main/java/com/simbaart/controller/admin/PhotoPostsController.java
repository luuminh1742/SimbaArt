package com.simbaart.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.dto.PhotoPostsDTO;
import com.simbaart.service.IPhotoCategoryService;
import com.simbaart.service.IPhotoPostsService;

@Controller(value = "photoPostsControllerOfAdmin")
public class PhotoPostsController {
	
	@Autowired
	private IPhotoCategoryService photoCategoryService;
	@Autowired
	private IPhotoPostsService photoPostsService;
	
	
	@RequestMapping(value = "/admin/photo/posts/list", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam("page") int page) {
		ModelAndView mav = new ModelAndView("admin/photo/posts/list");
		PhotoPostsDTO model = new PhotoPostsDTO();
		model.setPage(page);
		model.setLimit(10);
		Pageable pageable = new PageRequest(page-1, model.getLimit());
		model.setListResult(photoPostsService.findAll(pageable));
		model.setTotalItem(photoPostsService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);
		mav.addObject("checkSidebar",2);
		return mav;
	}

	@RequestMapping(value = "/admin/photo/posts/edit", method = RequestMethod.GET)
	public ModelAndView editPhotoPosts(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/photo/posts/edit");
		PhotoPostsDTO model = new PhotoPostsDTO();
		if (id != null) {
			model = photoPostsService.findById(id);
		}

		mav.addObject("model", model);
		List<PhotoCategoryDTO> photoCategories = photoCategoryService.findAll();

		mav.addObject("photoCategories", photoCategories);
		
		
		
		mav.addObject("checkSidebar",2);
		return mav;
	}
	
	
	
	
}
