package com.test.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.entity.FilePath;

public interface FileService {
	public List<FilePath> findFile();
	
	public Boolean saveFile(FilePath fp);
	
	public String Upload(@RequestParam("file") MultipartFile file);
}
