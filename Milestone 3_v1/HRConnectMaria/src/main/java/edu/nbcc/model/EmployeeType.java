package edu.nbcc.model;

public class EmployeeType {
	private int id;
	private String empType;
	
	/**
	 * @param id
	 * @param empType
	 */
	public EmployeeType(int id, String empType) {
		super();
		this.id = id;
		this.empType = empType;
	}
	
	public EmployeeType(){
		
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
	 * @return the empType
	 */
	public String getEmpType() {
		return empType;
	}

	/**
	 * @param empType the empType to set
	 */
	public void setEmpType(String empType) {
		this.empType = empType;
	}
	
	
}
