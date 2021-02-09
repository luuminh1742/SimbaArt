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

import com.simbaart.dto.NewArtDTO;
import com.simbaart.service.INewArtService;
import com.simbaart.utils.ReadAllFileNameInFolderUtil;

@Controller(value = "newArtControllerOfAdmin")
public class NewArtController {
	@Autowired
	private INewArtService newArtService;
	@Autowired
	private ReadAllFileNameInFolderUtil readFileName;

	@RequestMapping(value = "/admin/newart/list", method = RequestMethod.GET)
	public ModelAndView listNewArt(@RequestParam("page") int page) {
		ModelAndView mav = new ModelAndView("admin/newart/list");

		NewArtDTO model = new NewArtDTO();
		model.setPage(page);
		model.setLimit(10);
		Pageable pageable = new PageRequest(page - 1, model.getLimit());
		model.setListResult(newArtService.findAll(pageable));
		model.setTotalItem(newArtService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);
		// kiểm tra menu nằm ở đâu
		mav.addObject("checkSidebar", 6);
		return mav;
	}

	@RequestMapping(value = "/admin/newart/edit", method = RequestMethod.GET)
	public ModelAndView editNewArt(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/newart/edit");

		NewArtDTO model = new NewArtDTO();
		if (id != null) {
			model = newArtService.findById(id);
		}

		mav.addObject("model", model);
		
		List<String> listFileName = readFileName.results("images");
		mav.addObject("listFileName", listFileName);
		// kiểm tra menu nằm ở đâu
		mav.addObject("checkSidebar", 6);
		return mav;
	}
}
