package com.test.serviceImp;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.entity.FilePath;
import com.test.mapper.FileMapper;
import com.test.service.FileService;
import com.test.util.FileUtil;

@Service
public class FileServiceImp implements FileService{

	@Autowired
	private FileMapper mapper;
	@Override
	public Boolean saveFile(FilePath fp) {
		// TODO Auto-generated method stub
		mapper.saveFile(fp);
		return true;
	}
	@Override
	public List<FilePath> findFile() {
		// TODO Auto-generated method stub
		return mapper.findFile();
	}
	@Override
	public String Upload(@RequestParam("file") MultipartFile file) {
		if(!file.isEmpty()) {		
			String fileName = file.getOriginalFilename();		
			
			String path = ClassUtils.getDefaultClassLoader().getResource("").getPath()+"static/";
			try {				
				FileUtil.fileupload(file.getBytes(), path, fileName);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
			FilePath biaopath = new FilePath();
			biaopath.setFilepath("http://localhost:6060/"+fileName);
			mapper.saveFile(biaopath);
			
		}
		return "success";
		
	}


}
