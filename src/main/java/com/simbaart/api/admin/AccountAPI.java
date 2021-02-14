package com.simbaart.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.UserDTO;
import com.simbaart.service.IUserService;

@RestController(value="accountAPIOfAdmin")
public class AccountAPI {

	@Autowired
	private IUserService userService;
	
	@PutMapping("/api/account/updateinfor")
	public UserDTO updateInforUser(@RequestBody UserDTO dto) {
		return userService.updateInfor(dto);
	}
	
	@PutMapping("/api/account/updatepassword")
	public UserDTO updatePasswordUser(@RequestBody UserDTO dto) {
		return userService.updatePassword(dto);
	}
	
	
}
