package com.test.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.test.entity.FilePath;
import com.test.service.FileService;

@Controller
public class FileCtrl {
	@Autowired
	private FileService service;
	
	@RequestMapping("list")
	public String findFile(HttpServletRequest req){
		List<FilePath> list = service.findFile();
		req.setAttribute("files", list);
		return "file";
	}
	
	
	@RequestMapping("save")
	@ResponseBody
	public boolean saveFile(FilePath fp){
		service.saveFile(fp);
		return true;
	}
	
	@RequestMapping("upload")
	public String upload(@RequestParam("file") MultipartFile file) {
		
		 service.Upload(file);
		return "redirect:list";
	}

}
