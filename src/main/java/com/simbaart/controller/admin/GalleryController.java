package com.simbaart.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.utils.ReadAllFileNameInFolderUtil;

import javax.servlet.http.HttpServletRequest;

@Controller(value = "galleryControllerOfAdmin")
public class GalleryController {

	@Autowired
	private ReadAllFileNameInFolderUtil readFileName;

	@RequestMapping(value = "/admin/gallery", method = RequestMethod.GET)
	public ModelAndView galleryPage(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("admin/gallery");
		String root = req.getServletContext().getRealPath("/")+"/upload/images";
		List<String> listFileName = readFileName.results(root);
		mav.addObject("listFileName", listFileName);
		// kiểm tra menu nằm ở đâu
		mav.addObject("checkSidebar", 8);
		return mav;
	}
}
