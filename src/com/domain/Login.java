package com.domain;

//�ڷ��� Ŭ����
public class Login {
	
	//���̵�, �����н�����, �ű��н�����
	private String id_, pw_, newPw_;
	
	public Login(String id_, String pw_) {
		this.id_ = id_;
		this.pw_ = pw_;
	}
	
	public Login(String id_, String pw_, String newPw_) {
		this.id_ = id_;
		this.pw_ = pw_;
		this.newPw_ = newPw_;
	}

	public String getNewPw_() {
		return newPw_;
	}

	public void setNewPw_(String newPw_) {
		this.newPw_ = newPw_;
	}

	public String getId_() {
		return id_;
	}

	public void setId_(String id_) {
		this.id_ = id_;
	}

	public String getPw_() {
		return pw_;
	}

	public void setPw_(String pw_) {
		this.pw_ = pw_;
	}

}
