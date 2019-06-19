package com.yl.service;

import com.yl.dao.EmployeeMapper;
import com.yl.entity.Employee;
import com.yl.entity.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    EmployeeService employeeService;

    //保存
    public void saveEmployee(Employee employee) {
        employeeMapper.insert(employee);
    }

    //拉取实习生信息集
    public List<Employee> getEmployeesInfo() {
        return employeeMapper.selectByExampleAndDepartment(null);
    }

    //检测是否已存在实习生
    public boolean checkEmployee(String employeeName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andENameEqualTo(employeeName);
        long count = employeeMapper.countByExample(employeeExample);
        return count == 0;
    }

    //根据ID检索实习生
    public Employee getEmployee(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    public Employee getEmployeeAndDepartment(Integer id) {
        return employeeMapper.selectByPrimaryKeyAndDepartment(id);
    }

    public void updateEmployee(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmployee(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteEmployees(List<Integer> id_more) {
        EmployeeExample studentExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = studentExample.createCriteria();
        criteria.andEIdIn(id_more);
        employeeMapper.deleteByExample(studentExample);
    }
}
