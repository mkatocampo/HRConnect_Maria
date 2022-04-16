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
	 * delete a book
	 * @param d
	 * @return
	 */
	public int delete(int d);
	
	/**
	 * insert a book
	 * @param book
	 * @return
	 */
	public int insert (Employee book);
	
	/**
	 * update a book
	 * @param book
	 * @return
	 */
	public int update (Employee book);
	
	/**
	 * find all books
	 * @return
	 */
	public List<Employee> findAll();
	
	/**
	 * get book by name
	 * @param name
	 * @return
	 */
	public Employee findByName(String name);
	
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
	 * find user
	 * @return
	 */
	public User validateUser(String name, String password);
}
