package com.simbaart.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.LinkDTO;
import com.simbaart.dto.UserDTO;
import com.simbaart.service.ILinkService;
import com.simbaart.service.IUserService;
import com.simbaart.utils.ReadAllFileNameInFolderUtil;
import com.simbaart.utils.SecurityUtils;

@Controller(value = "accountControllerOfAdmin")
public class AccountController {

	@Autowired
	private ReadAllFileNameInFolderUtil readFileName;
	@Autowired
	private ILinkService linkService;
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value = "/admin/account/profile", method = RequestMethod.GET)
	public ModelAndView profilePage() {
		ModelAndView mav = new ModelAndView("admin/account/profile/show");

		String username = SecurityUtils.getPrincipal().getUsername();
		
		UserDTO userDTO = userService.findOneByUserName(username);
		
		mav.addObject("userDTO", userDTO);
		
		
		// kiểm tra menu nằm ở đâu
		mav.addObject("checkSidebar", 9);
		return mav;
	}

	@RequestMapping(value = "/admin/account/link", method = RequestMethod.GET)
	public ModelAndView linkPage() {
		ModelAndView mav = new ModelAndView("admin/account/link/showlink");

		LinkDTO model = new LinkDTO();
		model = linkService.findOne(); 
		
		mav.addObject("model",model);
		
		
		
		List<String> listFileName = readFileName.results("images");
		mav.addObject("listFileName", listFileName);
		// kiểm tra menu nằm ở đâu
		mav.addObject("checkSidebar", 9);
		return mav;
	}
	@RequestMapping(value = "/admin/account/link/edit", method = RequestMethod.GET)
	public ModelAndView linkEditPage(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/account/link/edit");
		LinkDTO model = new LinkDTO();
		// model = linkService.findOne();
		if(id != null) {
			model = linkService.findById(id);
		}
		 
		mav.addObject("model",model);
		
		
		
		List<String> listFileName = readFileName.results("images");
		mav.addObject("listFileName", listFileName);
		// kiểm tra menu nằm ở đâu
		mav.addObject("checkSidebar", 9);
		return mav;
	}
	
	@RequestMapping(value = "/admin/account/logo", method = RequestMethod.GET)
	public ModelAndView logoPage() {
		ModelAndView mav = new ModelAndView("admin/account/logo");

		LinkDTO model = new LinkDTO();
		model = linkService.findOne(); 
		
		mav.addObject("model",model);
		
		
		
		List<String> listFileName = readFileName.results("images");
		mav.addObject("listFileName", listFileName);
		// kiểm tra menu nằm ở đâu
		mav.addObject("checkSidebar", 9);
		return mav;
	}
}
