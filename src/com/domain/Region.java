package com.domain;

//�ڷ��� Ŭ����
public class Region {
	
	//������ȣ, ������, �������ɿ���
	private String regId, reg_name;
	private int count_;
	
	public Region(String reg_name) {
		this.reg_name = reg_name;
	}
	
	public Region(String regId, String reg_name) {
		this.regId = regId;
		this.reg_name = reg_name;
	}

	public Region(String regId, String reg_name, int count_) {
		this.regId = regId;
		this.reg_name = reg_name;
		this.count_ = count_;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getReg_name() {
		return reg_name;
	}

	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}

	public int getCount_() {
		return count_;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}

	//��� ���� �޼ҵ�1
	//->������ȣ / ������
	public String print1() {
		return String.format("%s / %s"
					, this.getRegId(), this.getReg_name());
	}
	
	//��� ���� �޼ҵ�2
	//->������ȣ / ������ / �������ɿ���
	public String print2() {
		return String.format("%s / %s / %s"
				, this.getRegId(), this.getReg_name()
				, (this.getCount_() == 0)?"O":"X");	
	}

}
