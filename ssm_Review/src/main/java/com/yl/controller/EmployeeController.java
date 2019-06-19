package com.yl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yl.entity.Employee;
import com.yl.entity.Message;
import com.yl.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value = "/employee", method = RequestMethod.POST)
    @ResponseBody
    public Message saveStudent(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Message.fail().add("errorFields", map);
        } else {
            System.out.println("添加新实习生ing");
            employeeService.saveEmployee(employee);
            return Message.success();
        }
    }

    @RequestMapping("/getEmployees")
    @ResponseBody
    private Message getEmployeesToJosn(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        List<Employee> list = employeeService.getEmployeesInfo();
        PageHelper.startPage(pn, 2);
        PageInfo pi = new PageInfo(list, 2);

        return Message.success().add("pageInfo", pi);
    }

    @ResponseBody
    @RequestMapping("/checkEmployee")
    public Message checkEmployee(@RequestParam("employeeName") String employeeName) {
        String regx = "(^[\u2E80-\u9FFF]{2,5})";
        if (!employeeName.matches(regx)) {
            return Message.fail().add("va_msg", "您好，请输入2-5位中文");
        }
        //数据库用户名重复校验
        boolean b = employeeService.checkEmployee(employeeName);
        if (b) {
            return Message.success();
        } else {
            return Message.fail().add("va_msg", "您好，您的姓名不可用");
        }
    }


    @RequestMapping(value = "/employee/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Message getEmployee(@PathVariable("id") Integer id) {
        return Message.success().add("employeeInfo", employeeService.getEmployeeAndDepartment(id));
    }

    @RequestMapping(value = "/employee/{eId}", method = RequestMethod.PUT)
    @ResponseBody
    public Message updateEmployee(Employee employee) {
        employeeService.updateEmployee(employee);
        return Message.success();
    }

    @RequestMapping(value = "/employee/{id_employees}", method = RequestMethod.DELETE)
    @ResponseBody
    public Message deleteEmployee(@PathVariable("id_employees") String del_idstr) {
        if (del_idstr.contains("-")) {
            List<Integer> id_more = new ArrayList<Integer>();
            String[] temp = del_idstr.split("-");
            for (String string : temp) {
                id_more.add(Integer.parseInt(string));
            }
            employeeService.deleteEmployees(id_more);
        } else {
            employeeService.deleteEmployee(Integer.parseInt(del_idstr));
        }
        return Message.success();
    }
}
