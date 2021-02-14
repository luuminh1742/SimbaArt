package com.simbaart.service;

import com.simbaart.dto.UserDTO;

public interface IUserService {
	UserDTO updateInfor(UserDTO dto);
	UserDTO findOneByUserName(String username);
	UserDTO updatePassword(UserDTO dto);
}
