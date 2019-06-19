package com.yl.service;

import com.yl.entity.Employee;
import java.util.List;

public interface EmployeeService {

    public void saveEmployee(Employee employee);

    public List<Employee> getEmployeesInfo();

    public boolean checkEmployee(String employeeName);

    public Employee getEmployee(Integer id);

    public Employee getEmployeeAndDepartment(Integer id);

    public void updateEmployee(Employee employee);

    public void deleteEmployee(Integer id);

    public void deleteEmployees(List<Integer> id_more);
}
