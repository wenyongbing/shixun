package com.test.entity;

import java.io.Serializable;

import com.mysql.jdbc.Blob;

public class FilePath implements Serializable{
	public Integer id=null;
	
	public String filepath=null;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}


	
	

}
