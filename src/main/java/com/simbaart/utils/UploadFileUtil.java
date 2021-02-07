package com.simbaart.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

@Component
public class UploadFileUtil {
	private final String root = "/usr/var";
	public void writeOrUpdateFile(byte[] bytes,String path) {
		// Kiểm tra folder tồn tại hay chưa
		File file = new File(StringUtils.substringBeforeLast(root+path, "/"));
		if(!file.exists()) {
			// nếu file không tồn tại thì ta tạo folder 
			file.mkdir();// đây là hàm tạo folder
		}
		
		// giao quyền đóng output stream cho thằng try trong java 8
		// không phải dùng khối finally để đóng output stream nữa
		try(FileOutputStream fileOutputStream = new FileOutputStream(new File(root+path))){
			fileOutputStream.write(bytes);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
