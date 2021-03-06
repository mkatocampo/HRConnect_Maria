package edu.nbcc.model;

public class User {
	private int id;
	private String username;
	private String password;
	private String Roleid;
	
	/**
	 * @param id
	 * @param username
	 * @param password
	 * @param roleid
	 */
	public User(int id, String username, String password, String roleid) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		Roleid = roleid;
	}
	
	public User() {
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
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the roleid
	 */
	public String getRoleid() {
		return Roleid;
	}

	/**
	 * @param roleid the roleid to set
	 */
	public void setRoleid(String roleid) {
		Roleid = roleid;
	}
	
	
}
