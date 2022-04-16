/**
 * 
 */
package edu.nbcc.dao;

import java.util.List;

import edu.nbcc.model.*;

/**
 * @author Maria Ocampo
 *
 */
public interface DAO {
	
	/**
	 * delete a record
	 * @param id
	 * @return
	 */
	public int delete(int id);
	
	/**
	 * insert a record
	 * @param e
	 * @return
	 */
	public int insert (Employee e);
	
	/**
	 * update a record
	 * @param e
	 * @return
	 */
	public int update (Employee e);
	
	/**
	 * list employee records
	 * @return
	 */
	public List<Employee> findAll(String filter, String firstName,String  lastName,String hireDate,String terminatedDate,String gender, String isActive);
	
	/**
	 * find employee by id
	 * @param id
	 * @return
	 */
	public Employee findById(int id);
	
	/**
	 * find all jobs
	 * @return
	 */
	public List<Job> findJobs();
	
	/**
	 * find all employeeType
	 * @return
	 */
	public List<EmployeeType> findEmployeeTypes();
	
	/**
	 * validate user access credentials
	 * @return
	 */
	public User validateUser(String name, String password);
}
