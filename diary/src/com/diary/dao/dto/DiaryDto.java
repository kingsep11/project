package com.diary.dao.dto;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class DiaryDto extends DiaryImagesDto{

	private int diaryId;
	private String diaryCode;
	private String diaryTitle;
	private String diaryDesc;
	private String diaryPrice;
	private int prdType;
	private int catagory;
	public int getDiaryId() {
		return diaryId;
	}
	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
	}
	public String getDiaryCode() {
		return diaryCode;
	}
	public void setDiaryCode(String diaryCode) {
		this.diaryCode = diaryCode;
	}
	public String getDiaryTitle() {
		return diaryTitle;
	}
	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}
	public String getDiaryDesc() {
		return diaryDesc;
	}
	public void setDiaryDesc(String diaryDesc) {
		this.diaryDesc = diaryDesc;
	}
	public String getDiaryPrice() {
		return diaryPrice;
	}
	public void setDiaryPrice(String diaryPrice) {
		this.diaryPrice = diaryPrice;
	}
	public int getPrdType() {
		return prdType;
	}
	public void setPrdType(int prdType) {
		this.prdType = prdType;
	}
	public int getCatagory() {
		return catagory;
	}
	public void setCatagory(int catagory) {
		this.catagory = catagory;
	}
	
	
}
