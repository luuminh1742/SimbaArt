package com.simbaart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.NewArtDTO;
import com.simbaart.service.INewArtService;

@Controller(value = "newArtControllerOfWeb")
public class NewArtController {

	@Autowired
	private DisplayGeneral displayGeneral;
	@Autowired
	private INewArtService newArtService;

	@RequestMapping(value = "/newart/list", method = RequestMethod.GET)
	public ModelAndView showListNewArtPage(@RequestParam("page") int page) {

		ModelAndView mav = new ModelAndView("web/newart/list");
		
		NewArtDTO newArtDTO = new NewArtDTO();
		newArtDTO.setPage(page);
		newArtDTO.setLimit(10);
		Pageable pageable = new PageRequest(page - 1, newArtDTO.getLimit());
		newArtDTO.setListResult(newArtService.findAll(pageable));
		newArtDTO.setTotalItem(newArtService.getTotalItem());
		newArtDTO.setTotalPage((int) Math.ceil((double) newArtDTO.getTotalItem() / newArtDTO.getLimit()));
		mav.addObject("newArtDTO", newArtDTO);

		
		displayGeneral.show(mav);
		// check menu selected
		
		mav.addObject("checkMenu",4);
		
		return mav;
	}
	
	@RequestMapping(value = "/newart/posts", method = RequestMethod.GET)
	public ModelAndView showNewArtPosts(@RequestParam(value = "code", required = false) Long code) {

		ModelAndView mav = new ModelAndView("web/newart/posts");
		NewArtDTO newArtDTO = newArtService.findById(code);
		mav.addObject("newArtDTO",newArtDTO);
		displayGeneral.show(mav);
		// check menu selected
		
		mav.addObject("checkMenu",4);
		
		return mav;
	}
	
	


}
