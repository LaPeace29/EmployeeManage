package com.domain;

//�ڷ��� Ŭ����
public class Job {

	private String jobId, job_title; // ������ȣ, ������
	private int min_basicPay, count_; // �ּұ޿�, �������ɿ���

	public Job(String job_title, int min_basicPay) {
		this.job_title = job_title;
		this.min_basicPay = min_basicPay;
	}
	
	public Job(String jobId, String job_title, int min_basicPay) {
		this.jobId = jobId;
		this.job_title = job_title;
		this.min_basicPay = min_basicPay;
	}

	public Job(String jobId, String job_title, int min_basicPay, int count_) {
		this.jobId = jobId;
		this.job_title = job_title;
		this.min_basicPay = min_basicPay;
		this.count_ = count_;
	}

	public Job(String jobId, String job_title) {
		super();
		this.jobId = jobId;
		this.job_title = job_title;
	}

	public Job(String job_title) {
		super();
		this.job_title = job_title;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public int getMin_basicPay() {
		return min_basicPay;
	}

	public void setMin_basicPay(int min_basicPay) {
		this.min_basicPay = min_basicPay;
	}

	public int getCount_() {
		return count_;
	}

	public void setCount_(int count_) {
		this.count_ = count_;
	}

	public String print1() {
		return String.format("%s / %s", this.getJobId(), this.getJob_title());
	}

	public String print2() {
		return String.format("%s / %s / %s", this.getJobId(), this.getJob_title(), (this.getCount_() == 0) ? "O" : "X");
	}
}