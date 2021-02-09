package com.simbaart.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ReadAllFileNameInFolderUtil {
	public List<String> results(String folder) {

		List<String> result = new ArrayList<>();

		File[] files = new File("/usr/var/folder/" + folder).listFiles();
		// If this pathname does not denote a directory, then listFiles() returns null.

		if (files == null)
			return null;
		for (File file : files) {
			if (file.isFile()) {
				result.add(file.getName());
			}
		}
		return result;
	}
}
