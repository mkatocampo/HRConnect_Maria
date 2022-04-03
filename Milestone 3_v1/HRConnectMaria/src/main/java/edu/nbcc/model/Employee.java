package edu.nbcc.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Employee {
	private int id;
	private String firstName;
	private String lastName;
	private Date dob;
	private int sin;
	private String gender;
	private String streetAddress;
	private String postalCode;
	private String province;
	private String city;
	private String country;
	private String email;
	private String phoneNumber;
	private Date hiredDate;
	private Date terminatedDate;
	private boolean isActive;
	private double salary;
	private int userId;
	private int jobId;
	private int employeeTypeId;
	
	public Employee() {
		
	}

	/**
	 * @param id
	 * @param firstName
	 * @param lastName
	 * @param dob
	 * @param sin
	 * @param gender
	 * @param streetAddress
	 * @param postalCode
	 * @param province
	 * @param city
	 * @param country
	 * @param email
	 * @param phoneNumber
	 * @param hiredDate
	 * @param terminatedDate
	 * @param isActive
	 * @param salary
	 * @param userId
	 * @param jobId
	 * @param employeeTypeId
	 */
	public Employee(int id, String firstName, String lastName, Date dob, int sin, String gender, String streetAddress,
			String postalCode, String province, String city, String country, String email, String phoneNumber,
			Date hiredDate, Date terminatedDate, boolean isActive, double salary, int userId, int jobId,
			int employeeTypeId) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob = dob;
		this.sin = sin;
		this.gender = gender;
		this.streetAddress = streetAddress;
		this.postalCode = postalCode;
		this.province = province;
		this.city = city;
		this.country = country;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.hiredDate = hiredDate;
		this.terminatedDate = terminatedDate;
		this.isActive = isActive;
		this.salary = salary;
		this.userId = userId;
		this.jobId = jobId;
		this.employeeTypeId = employeeTypeId;
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
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the dob
	 */
	public Date getDob() {
		return dob;
	}

	/**
	 * @param dob the dob to set
	 */
	public void setDob(Date dob) {
		this.dob = dob;
	}

	/**
	 * @return the sin
	 */
	public int getSin() {
		return sin;
	}

	/**
	 * @param sin the sin to set
	 */
	public void setSin(int sin) {
		this.sin = sin;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the streetAddress
	 */
	public String getStreetAddress() {
		return streetAddress;
	}

	/**
	 * @param streetAddress the streetAddress to set
	 */
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	/**
	 * @return the postalCode
	 */
	public String getPostalCode() {
		return postalCode;
	}

	/**
	 * @param postalCode the postalCode to set
	 */
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	/**
	 * @return the province
	 */
	public String getProvince() {
		return province;
	}

	/**
	 * @param province the province to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/**
	 * @return the hiredDate
	 */
	public Date getHiredDate() {
		return hiredDate;
	}

	/**
	 * @param hiredDate the hiredDate to set
	 */
	public void setHiredDate(Date hiredDate) {
		this.hiredDate = hiredDate;
	}

	/**
	 * @return the terminatedDate
	 */
	public Date getTerminatedDate() {
		return terminatedDate;
	}

	/**
	 * @param terminatedDate the terminatedDate to set
	 */
	public void setTerminatedDate(Date terminatedDate) {
		this.terminatedDate = terminatedDate;
	}

	/**
	 * @return the isActive
	 */
	public boolean isActive() {
		return isActive;
	}

	/**
	 * @param isActive the isActive to set
	 */
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	/**
	 * @return the salary
	 */
	public double getSalary() {
		return salary;
	}

	/**
	 * @param salary the salary to set
	 */
	public void setSalary(double salary) {
		this.salary = salary;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the jobId
	 */
	public int getJobId() {
		return jobId;
	}

	/**
	 * @param jobId the jobId to set
	 */
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	/**
	 * @return the employeeTypeId
	 */
	public int getEmployeeTypeId() {
		return employeeTypeId;
	}

	/**
	 * @param employeeTypeId the employeeTypeId to set
	 */
	public void setEmployeeTypeId(int employeeTypeId) {
		this.employeeTypeId = employeeTypeId;
	}
	
	
}
