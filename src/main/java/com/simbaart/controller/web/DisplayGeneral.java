package com.simbaart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.LinkDTO;
import com.simbaart.dto.NewArtDTO;
import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.service.ILinkService;
import com.simbaart.service.INewArtService;
import com.simbaart.service.IPhotoCategoryService;

@Component
public class DisplayGeneral {
	
	@Autowired
	private INewArtService newArtService;
	@Autowired
	private IPhotoCategoryService photoCategoryService;
	@Autowired
	private ILinkService linkService;
	
	public void show(ModelAndView mav) {
		
		LinkDTO linkDTO = linkService.findOne();
		mav.addObject("linkDTO", linkDTO);
		
		// load banner header
		NewArtDTO newArtDTO = new NewArtDTO();
		newArtDTO.setListResult(newArtService.findAllByStatus());
		mav.addObject("newArts", newArtDTO);
		mav.addObject("activeBanner", newArtDTO.getListResult().get(0).getId());
		// load list photo category
		PhotoCategoryDTO photoCategoryDTO = new PhotoCategoryDTO();
		photoCategoryDTO.setListResult(photoCategoryService.findAll());
		mav.addObject("photoCategory", photoCategoryDTO);
	}
}
