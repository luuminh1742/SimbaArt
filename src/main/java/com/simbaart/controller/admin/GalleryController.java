package com.simbaart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "galleryControllerOfAdmin")
public class GalleryController {
	@RequestMapping(value = "/admin/gallery", method = RequestMethod.GET)
	   public ModelAndView galleryPage() {
	      ModelAndView mav = new ModelAndView("admin/gallery");
	      
	      
	      // kiểm tra menu nằm ở đâu
	      mav.addObject("checkSidebar",8);
	      return mav;
	   }
}
