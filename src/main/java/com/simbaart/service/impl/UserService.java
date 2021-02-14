package com.simbaart.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.simbaart.converter.UserConverter;
import com.simbaart.dto.UserDTO;
import com.simbaart.entity.UserEntity;
import com.simbaart.repository.UserRepository;
import com.simbaart.service.IUserService;

@Service
public class UserService implements IUserService{

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserConverter userConverter;
	@Override
	@Transactional
	public UserDTO updateInfor(UserDTO dto) {
		UserEntity userEntity = userRepository.findOne(dto.getId());
		userEntity = userConverter.toEntity(userEntity, dto);
		return userConverter.toDto(userRepository.save(userEntity));
	}

	@Override
	public UserDTO findOneByUserName(String username) {
		return userConverter.toDto(userRepository.findOneByUserNameAndStatus(username, true));
	}

	@Override
	@Transactional
	public UserDTO updatePassword(UserDTO dto) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		UserEntity userEntity = userRepository.findOne(dto.getId());
		boolean isPasswordMatch = passwordEncoder.matches(dto.getOldPassword(), userEntity.getPassword());
		if(!isPasswordMatch) return null;
		userEntity.setPassword(passwordEncoder.encode(dto.getPassword()));
		return userConverter.toDto(userRepository.save(userEntity));
	}

	

}
