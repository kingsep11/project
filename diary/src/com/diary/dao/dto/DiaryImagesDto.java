package com.diary.dao.dto;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class DiaryImagesDto {

	private int diaryId;
	private String fileName;
	private String primaryImg;
	
	public int getDiaryId() {
		return diaryId;
	}
	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getPrimaryImg() {
		return primaryImg;
	}
	public void setPrimaryImg(String primaryImg) {
		this.primaryImg = primaryImg;
	}
	
	
}
