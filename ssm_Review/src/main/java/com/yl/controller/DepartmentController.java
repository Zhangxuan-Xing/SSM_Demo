package com.yl.controller;

import com.yl.entity.Department;
import com.yl.entity.Message;
import com.yl.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/getDepartments")
    @ResponseBody
    private Message getDepartments() {
        List<Department> departments = departmentService.getAll();
        return Message.success().add("departmentInfo", departments);
    }
}
