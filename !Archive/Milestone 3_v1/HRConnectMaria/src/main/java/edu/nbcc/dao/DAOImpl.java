/**
 * 
 */
package edu.nbcc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.nbcc.model.*;

/**
 * @author Maria Ocampo
 * No comments in implementation class
 */
public class DAOImpl implements DAO {

	//help to connect mysql to java code
	private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/hrconnect";
	private static final String USER_ID = "dev";
	private static final String PASSWORD = "dev1234";
	
	private static final String DELETE = "DELETE FROM `employee` WHERE `id`=?";
	private static final String INSERT = "INSERT INTO `employee`(`firstName`, `lastName`, `dob`, `sin`, `gender`, `streetAddress`, `postalCode`, `province`, `city`, `country`, `email`, `phoneNumber`, `hiredDate`, `terminatedDate`, `isActive`, `salary`, `Userid`, `Jobid`, `EmployeeTypeid`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NULL,?,?)";
	private static final String UPDATE = "UPDATE `employee` SET `firstName`=?,`lastName`=?,`dob`=?,`sin`=?,`gender`=?,`streetAddress`=?,`postalCode`=?,`province`=?,`city`=?,`country`=?,`email`=?,`phoneNumber`=?,`hiredDate`=?,`terminatedDate`=?,`isActive`=?,`salary`=?,`Userid`=NULL,`Jobid`=?,`EmployeeTypeid`=? WHERE `id` =?";
	private static final String FIND_ALL = "SELECT * FROM `employee` ORDER BY `id`";
	private static final String FIND_BY_ID = "SELECT * FROM `employee` WHERE `id`=?";
	private static final String FIND_BY_NAME = "SELECT * FROM `employee` WHERE `lastName`=?";
	private static final String FIND_JOB = "SELECT * FROM `job` ORDER BY `id`";
	private static final String FIND_EMPLOYEETYPE = "SELECT * FROM `employeetype` ORDER BY `id`";
	private static final String VALIDATE_USER = "SELECT * FROM `user` WHERE `username` = ? AND `password`= ?";
	
	/**
	 * get connection
	 * @return
	 */
	private Connection getConnection() {
		try {
			Class.forName(DRIVER_NAME);
			return DriverManager.getConnection(DB_URL,USER_ID,PASSWORD);
		}catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * close the connection
	 * @param conn
	 */
	private static void close(Connection conn) {
		if (conn!=null) {
			try {
				conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	/**
	 * close the statement
	 * @param conn
	 */
	private static void close(Statement stmt) {
		if (stmt!=null) {
			try {
				stmt.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	@Override
	public int delete(int id) {
		Connection conn = null;
		PreparedStatement statement = null;
		try{
			conn = getConnection();
			statement = conn.prepareStatement(DELETE);
			statement.setInt(1,id);
			return statement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}finally {
			close(statement);
			close(conn);
		}	
	}

	@Override
	public int insert(Employee emp) {
		Connection conn = null;
		PreparedStatement statement = null;
		try{
			conn = getConnection();
			statement = conn.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1,emp.getFirstName());
			statement.setString(2,emp.getLastName());
			statement.setDate(3,emp.getDob());
			statement.setInt(4,emp.getSin());
			statement.setString(5,emp.getGender());
			statement.setString(6,emp.getStreetAddress());
			statement.setString(7,emp.getPostalCode());
			statement.setString(8,emp.getProvince());
			statement.setString(9,emp.getCity());
			statement.setString(10,emp.getCountry());
			statement.setString(11,emp.getEmail());
			statement.setString(12,emp.getPhoneNumber());
			statement.setDate(13,emp.getHiredDate());
			statement.setDate(14,emp.getTerminatedDate());
			statement.setBoolean(15,emp.isActive());
			statement.setDouble(16,emp.getSalary());
			//statement.setInt(17,emp.getUserId());
			statement.setInt(17,emp.getJobId());
			statement.setInt(18,emp.getEmployeeTypeId());
			
			int result = statement.executeUpdate();
			ResultSet rs = statement.getGeneratedKeys();
			
			if(rs.next()) {
				emp.setId(rs.getInt(1));
			}
			return result;
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}finally {
			close(statement);
			close(conn);
		}	
	}

	@Override
	public int update(Employee emp) {
		Connection conn = null;
		PreparedStatement statement = null;
		try{
			conn = getConnection();
			statement = conn.prepareStatement(UPDATE);
			statement.setString(1,emp.getFirstName());
			statement.setString(2,emp.getLastName());
			statement.setDate(3,emp.getDob());
			statement.setInt(4,emp.getSin());
			statement.setString(5,emp.getGender());
			statement.setString(6,emp.getStreetAddress());
			statement.setString(7,emp.getPostalCode());
			statement.setString(8,emp.getProvince());
			statement.setString(9,emp.getCity());
			statement.setString(10,emp.getCountry());
			statement.setString(11,emp.getEmail());
			statement.setString(12,emp.getPhoneNumber());
			statement.setDate(13,emp.getHiredDate());
			statement.setDate(14,emp.getTerminatedDate());
			statement.setBoolean(15,emp.isActive());
			statement.setDouble(16,emp.getSalary());
			//statement.setInt(17,emp.getUserId());
			statement.setInt(17,emp.getJobId());
			statement.setInt(18,emp.getEmployeeTypeId());
			statement.setInt(19,emp.getId());
			
			return statement.executeUpdate();
			
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return -1;
		}finally {
			close(statement);
			close(conn);
		}	
	}

	@Override
	public List<Employee> findAll() {
		Connection conn = null;
		PreparedStatement statement = null;
		List<Employee> list = new ArrayList<Employee>();
		try{
			conn = getConnection();
			System.out.println(conn);
			statement = conn.prepareStatement(FIND_ALL);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setFirstName(rs.getString("firstName"));
				emp.setLastName(rs.getString("lastName"));
				emp.setDob(rs.getDate("dob"));
				emp.setSin(rs.getInt("sin"));
				emp.setGender(rs.getString("gender"));
				emp.setStreetAddress(rs.getString("streetAddress"));
				emp.setPostalCode(rs.getString("postalCode"));
				emp.setProvince(rs.getString("province"));
				emp.setCity(rs.getString("city"));
				emp.setCountry(rs.getString("country"));
				emp.setEmail(rs.getString("email"));
				emp.setPhoneNumber(rs.getString("phoneNumber"));
				emp.setHiredDate(rs.getDate("hiredDate"));
				emp.setTerminatedDate(rs.getDate("terminatedDate"));
				emp.setActive(rs.getBoolean("isActive"));
				emp.setSalary(rs.getDouble("salary"));
				emp.setUserId(rs.getInt("userId"));
				emp.setJobId(rs.getInt("jobId"));
				emp.setEmployeeTypeId(rs.getInt("employeeTypeId"));
				list.add(emp);
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}finally {
			close(statement);
			close(conn);
		}	
		return list;
	}

	@Override
	public Employee findByName(String name) {
		Connection conn = null;
		PreparedStatement statement = null;
		try{
			conn = getConnection();
			statement = conn.prepareStatement(FIND_BY_NAME);
			statement.setString(1, name);
			ResultSet rs = statement.executeQuery();
			Employee emp = new Employee();
			if (rs.next()) {
				emp.setId(rs.getInt("id"));
				emp.setFirstName(rs.getString("firstName"));
				emp.setLastName(rs.getString("lastName"));
				emp.setDob(rs.getDate("dob"));
				emp.setSin(rs.getInt("sin"));
				emp.setGender(rs.getString("gender"));
				emp.setStreetAddress(rs.getString("streetAddress"));
				emp.setPostalCode(rs.getString("postalCode"));
				emp.setProvince(rs.getString("province"));
				emp.setCity(rs.getString("city"));
				emp.setCountry(rs.getString("country"));
				emp.setEmail(rs.getString("email"));
				emp.setPhoneNumber(rs.getString("phoneNumber"));
				emp.setHiredDate(rs.getDate("hiredDate"));
				emp.setTerminatedDate(rs.getDate("terminatedDate"));
				emp.setActive(rs.getBoolean("isActive"));
				emp.setSalary(rs.getDouble("salary"));
				emp.setUserId(rs.getInt("userId"));
				emp.setJobId(rs.getInt("jobId"));
				emp.setEmployeeTypeId(rs.getInt("employeeTypeId"));
			}
			return emp;
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}finally {
			close(statement);
			close(conn);
		}
	}

	@Override
	public Employee findById(int id) {
		Connection conn = null;
		PreparedStatement statement = null;
		try{
			conn = getConnection();
			statement = conn.prepareStatement(FIND_BY_ID);
			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();
			Employee emp = new Employee();
			if (rs.next()) {
				emp.setId(rs.getInt("id"));
				emp.setFirstName(rs.getString("firstName"));
				emp.setLastName(rs.getString("lastName"));
				emp.setDob(rs.getDate("dob"));
				emp.setSin(rs.getInt("sin"));
				emp.setGender(rs.getString("gender"));
				emp.setStreetAddress(rs.getString("streetAddress"));
				emp.setPostalCode(rs.getString("postalCode"));
				emp.setProvince(rs.getString("province"));
				emp.setCity(rs.getString("city"));
				emp.setCountry(rs.getString("country"));
				emp.setEmail(rs.getString("email"));
				emp.setPhoneNumber(rs.getString("phoneNumber"));
				emp.setHiredDate(rs.getDate("hiredDate"));
				emp.setTerminatedDate(rs.getDate("terminatedDate"));
				emp.setActive(rs.getBoolean("isActive"));
				emp.setSalary(rs.getDouble("salary"));
				emp.setUserId(rs.getInt("userId"));
				emp.setJobId(rs.getInt("jobId"));
				emp.setEmployeeTypeId(rs.getInt("employeeTypeId"));
			}
			return emp;
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}finally {
			close(statement);
			close(conn);
		}
	}
	
	@Override
	public List<Job> findJobs() {
		Connection conn = null;
		PreparedStatement statement = null;
		List<Job> list = new ArrayList<Job>();
		try{
			conn = getConnection();
			System.out.println(conn);
			statement = conn.prepareStatement(FIND_JOB);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Job job = new Job();
				job.setId(rs.getInt("id"));
				job.setJobTitle(rs.getString("jobTitle"));
				job.setDepartmentId(rs.getString("Departmentid"));

				list.add(job);
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}finally {
			close(statement);
			close(conn);
		}	
		return list;
	}
	
	@Override
	public List<EmployeeType> findEmployeeTypes() {
		Connection conn = null;
		PreparedStatement statement = null;
		List<EmployeeType> list = new ArrayList<EmployeeType>();
		try{
			conn = getConnection();
			System.out.println(conn);
			statement = conn.prepareStatement(FIND_EMPLOYEETYPE);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				EmployeeType empType = new EmployeeType();
				empType.setId(rs.getInt("id"));
				empType.setEmpType(rs.getString("empType"));

				list.add(empType);
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}finally {
			close(statement);
			close(conn);
		}	
		return list;
	}

	@Override
	public User validateUser(String username, String password) {
		Connection conn = null;
		PreparedStatement statement = null;
		try{
			conn = getConnection();
			statement = conn.prepareStatement(VALIDATE_USER);
			statement.setString(1, username);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			User user = new User();
			if (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRoleid(rs.getString("Roleid"));
			}
			return user;
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}finally {
			close(statement);
			close(conn);
		}
	}
}
