package com.yl.service;

import com.yl.dao.DepartmentMapper;
import com.yl.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    DepartmentService departmentService;

    //拉取部门信息集
    public List<Department> getAll(){
        return departmentMapper.selectByExample(null);
    }
}
