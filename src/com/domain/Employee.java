package com.domain;

import java.sql.Date;

//�ڷ��� Ŭ����
public class Employee {
	
	//�ʵ� ����
	private String empId, name_, ssn, phone
    , reg_name, dept_name, job_title
    , regId, deptId, jobId;
	private int basicpay, extrapay, pay;
	private Date hiredate;
	private int pictureCount;
	private String filename;

	//�Ű����� �ִ� ������
	public Employee(String empId, String name_, String ssn, Date hiredate, String phone
				, String regId, String deptId, String jobId
				, int basicpay, int extrapay, int pay) {
		this.empId = empId;
		this.name_ = name_;
		this.ssn = ssn;
		this.hiredate = hiredate;
		this.phone = phone;
		this.regId = regId;
		this.deptId = deptId;
		this.jobId = jobId;
		this.basicpay = basicpay;
		this.extrapay = extrapay;
		this.pay = pay;
	}
	
	public Employee(String empId, String name_, String ssn, Date hiredate, String phone
				, String reg_name, String dept_name, String job_title
				, String regId, String deptId, String jobId
				, int basicpay, int extrapay, int pay, int pictureCount, String filename) {
		this.empId = empId;
		this.name_ = name_;
		this.ssn = ssn;
		this.hiredate = hiredate;
		this.phone = phone;
		this.reg_name = reg_name;
		this.dept_name = dept_name;
		this.job_title = job_title;
		this.regId = regId;
		this.deptId = deptId;
		this.jobId = jobId;
		this.basicpay = basicpay;
		this.extrapay = extrapay;
		this.pay = pay;
		this.pictureCount = pictureCount;
		this.filename = filename;
	}


	//getter, setter
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getName_() {
		return name_;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReg_name() {
		return reg_name;
	}

	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public int getBasicpay() {
		return basicpay;
	}

	public void setBasicpay(int basicpay) {
		this.basicpay = basicpay;
	}

	public int getExtrapay() {
		return extrapay;
	}

	public void setExtrapay(int extrapay) {
		this.extrapay = extrapay;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public int getPictureCount() {
		return pictureCount;
	}

	public void setPictureCount(int pictureCount) {
		this.pictureCount = pictureCount;
	}

	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}

	//��� ���� �޼ҵ�
	//��� / �̸� / �ֹι�ȣ / �Ի��� / ��ȭ��ȣ / 
	//������ / �μ��� / ������ / �⺻�� / ���� / �޿�
	@Override
	public String toString() {
		return String.format("%s / %s / %s / %tF / %s / %s / %s / %s / %,d / %,d / %,d"
				, this.getEmpId(), this.getName_()
				, this.getSsn(), this.getHiredate()
				, this.getPhone(), this.getReg_name()
				, this.getDept_name(), this.getJob_title()
				, this.getBasicpay(), this.getExtrapay()
				, this.getPay());
	}

}
