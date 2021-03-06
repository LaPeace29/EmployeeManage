package com.domain;

public class Department {

	private String deptId, dept_name;
	private int count_;

	public Department(String deptId) {
		this.deptId = deptId;
	}
	
	public Department(String deptId, String dept_name) {
		this.deptId = deptId;
		this.dept_name = dept_name;
	}

	public Department(String deptId, String dept_name, int count_) {
		this.deptId = deptId;
		this.dept_name = dept_name;
		this.count_ = count_;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public int getCount_() {
		return count_;
	}

	public void setCount_(int count) {
		this.count_ = count;
	}

	public String print1() {
		return String.format("%s / %s", this.getDeptId(), this.getDept_name());
	}

	public String print2() {
		return String.format("%s / %s / %s", this.getDeptId(), this.getDept_name(),
				(this.getCount_() == 0) ? "O" : "X");
	}

}