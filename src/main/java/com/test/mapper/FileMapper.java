package com.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.entity.FilePath;
@Mapper
public interface FileMapper{
	public List<FilePath> findFile();
	
	public void saveFile(FilePath fp);
	
	public String Upload(@RequestParam("file") MultipartFile file);
}
