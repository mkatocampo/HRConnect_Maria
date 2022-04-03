package edu.nbcc.controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import edu.nbcc.dao.DAO;
import edu.nbcc.dao.DAOImpl;
import edu.nbcc.model.*;
import edu.nbcc.util.ValidationUtil;

/**
 * Servlet implementation class test
 */
public class EmployeeController extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String LIST = "/recordList.jsp";
	private static final String RECORD = "/record.jsp";
	private static final String SUMMARY = "/recordSummary.jsp";
	private RequestDispatcher view;
	
	public RequestDispatcher getView() {
		return view;
	}
	
	public void setView(HttpServletRequest request, String viewPath) {
		view = request.getRequestDispatcher(viewPath);
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test");
		
		Employee emp = new Employee();
		String path = request.getPathInfo();
		DAO dao = new DAOImpl();
		
		if (path==null) {			
			List<Employee> list = dao.findAll();
			request.setAttribute("vm", list);
			setView(request, LIST);
		}else {
			String[] parts = path.split("/");
			
			List<Job> jobList = dao.findJobs();
			request.setAttribute("jobList", jobList);
			
			List<EmployeeType> employeeTypeList = dao.findEmployeeTypes();
			request.setAttribute("employeeTypeList", employeeTypeList);

			if (parts[1].equalsIgnoreCase("create") || ValidationUtil.isNumeric(parts[1])) {
				int id = ValidationUtil.getInteger(parts[1]);
				if (id != 0) {
					Employee e = dao.findById(id);
					if (e != null) {
						EmployeeModel vm = new EmployeeModel();
						vm.setEmployee(e);
						request.setAttribute("vm", vm);
					}else {
						request.setAttribute("error", new ErrorModel("Record not found"));
					}
				}else {
					//create record
					request.setAttribute("vm", new EmployeeModel());
				}
			}else {
				//edit record
				request.setAttribute("vm", new EmployeeModel());
			}
			setView(request,RECORD);
		}
		getView().forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List <String> errors = new ArrayList<String>();
		DAO dao = new DAOImpl();
		Employee emp = new Employee();
		setView(request, SUMMARY);
		
		try {

			int id = ValidationUtil.getInteger(request,"id",errors);
			
			String firstName = request.getParameter("firstName");
			
			String lastName = request.getParameter("lastName");
			
			String gender = request.getParameter("gender");
			if(gender == "") {
				gender = null;
			}
			
			String streetAddress = request.getParameter("streetAddress");
			
			String postalCode = request.getParameter("postalCode");
			if(postalCode == "") {
				postalCode = null;
			}
			
			String province = request.getParameter("province");
			
			String city = request.getParameter("city");
			if(city == "") {
				city = null;
			}
			
			String country = request.getParameter("country");
			
			String email = request.getParameter("email");
			
			String phoneNumber = request.getParameter("phoneNumber");
			if(phoneNumber == "") {
				phoneNumber = null;
			}
			
			String dobString = request.getParameter("dob");
			
			String hiredDateString = request.getParameter("hiredDate");
			
			String terminatedDateString = request.getParameter("terminatedDate");
			
			Date dob = Date.valueOf(dobString);
			
			Date hiredDate = Date.valueOf(hiredDateString);
			
			Date terminatedDate = null;
			if(terminatedDateString != "") {
				terminatedDate = Date.valueOf(terminatedDateString);
			}
			
			String isActiveString = request.getParameter("isActive");
			boolean isActive = Boolean.parseBoolean(isActiveString);  
			
			int sin = ValidationUtil.getInteger(request,"sin",errors);
			double salary = ValidationUtil.getDouble(request,"salary",errors);
			
			
			int userId = 0;
			int jobId = ValidationUtil.getInteger(request,"jobId",errors);
			if(jobId == 0) {
				jobId = 1;
			}
			
			int employeeTypeId = ValidationUtil.getInteger(request,"employeeTypeId",errors);
			if(employeeTypeId == 0) {
				employeeTypeId = 1;
			}
			
			if (errors.size() == 0) {
				emp.setId(id);
				emp.setFirstName(firstName);
				emp.setLastName(lastName);
				emp.setDob(dob);
				emp.setSin(sin);
				emp.setGender(gender);
				emp.setStreetAddress(streetAddress);
				emp.setPostalCode(postalCode);
				emp.setProvince(province);
				emp.setCity(city);
				emp.setCountry(country);
				emp.setEmail(email);
				emp.setPhoneNumber(phoneNumber);
				emp.setHiredDate(hiredDate);
				emp.setTerminatedDate(terminatedDate);
				emp.setActive(isActive);
				emp.setSalary(salary);
				emp.setUserId(userId);
				emp.setJobId(jobId);
				emp.setEmployeeTypeId(employeeTypeId);
				
				String action = request.getParameter("action").toLowerCase();
				
				switch(action) {
				case "create":
					//book = book.create();
					dao.insert(emp);
					request.setAttribute("createdRecord", emp);
					break;
				
				case "save":
					int saveId = dao.update(emp);
					if (saveId > 0) {
						request.setAttribute("savedRecord", emp);
					}else {
						EmployeeModel vm = new EmployeeModel();
						vm.setEmployee(emp);
						request.setAttribute("vm",vm);
						request.setAttribute("error",new ErrorModel("Record does not exist to save"));
						setView(request,RECORD);
					}
					break;
					
				case "delete":
					int deleteId = dao.delete(id);
					if (deleteId > 0) {
						request.setAttribute("deletedRecord", emp);
					}else {
						EmployeeModel vm = new EmployeeModel();
						vm.setEmployee(emp);
						request.setAttribute("vm",vm);
						request.setAttribute("error",new ErrorModel("Record does not exist to delete"));
						setView(request,RECORD);
					}
					break;
				}
			}else {
				setView(request,RECORD);
				ErrorModel errorModel = new ErrorModel();
				errorModel.setErrors(errors);
				request.setAttribute("error", errorModel);
				request.setAttribute("vm", new EmployeeModel());
			}
		}catch(Exception ex) {
			setView(request,RECORD);
			request.setAttribute("error", new ErrorModel("An error occurred, please try again"));
		}
		getView().forward(request, response);
	}
}
