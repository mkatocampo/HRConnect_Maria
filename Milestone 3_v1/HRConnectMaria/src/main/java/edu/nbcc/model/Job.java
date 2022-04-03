package edu.nbcc.model;

public class Job {
	private int id;
	private String jobTitle;
	private String departmentId;
	
	/**
	 * @param id
	 * @param jobTitle
	 * @param departmentId
	 */
	public Job(int id, String jobTitle, String departmentId) {
		super();
		this.id = id;
		this.jobTitle = jobTitle;
		this.departmentId = departmentId;
	}
	
	public Job() {
		
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the jobTitle
	 */
	public String getJobTitle() {
		return jobTitle;
	}

	/**
	 * @param jobTitle the jobTitle to set
	 */
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	/**
	 * @return the departmentId
	 */
	public String getDepartmentId() {
		return departmentId;
	}

	/**
	 * @param departmentId the departmentId to set
	 */
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	
	
}
