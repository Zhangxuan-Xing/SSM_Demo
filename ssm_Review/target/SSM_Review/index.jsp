<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>YiLing_Review</title>
</head>

<script type="text/javascript"
        src="./source/js/jquery-1.12.4.min.js">

</script>

<link href="./source/bootStrap/css/bootstrap.min.css"
      rel="stylesheet">

<script src="./source/bootStrap/js/bootstrap.min.js">

</script>

<body>

<!-- 修改信息 -->
<div class="modal fade" id="update_employee" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">花名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="employeeName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">虚号</label>
                        <div class="col-sm-10">
                            <input type="text" name="number" class="form-control"
                                   id="number_update_input" placeholder="请输入6位数字虚号"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline"> <input type="radio"
                                                                name="gender" id="gender1_update_input" value="1"
                                                                checked="checked"> 男
                            </label> <label class="radio-inline"> <input type="radio"
                                                                         name="gender" id="gender2_update_input" value="2"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-default"
                        id="employee_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>



<!-- 添加新的实习生 -->
<div class="modal fade" id="add_employee" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">实习生</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">花名</label>
                        <div class="col-sm-10">
                            <input type="text" name="eName" class="form-control"
                                   id="employeeName_add_input" placeholder="同学好，请输入花名"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">虚号</label>
                        <div class="col-sm-10">
                            <input type="text" name="number" class="form-control"
                                   id="number_add_input" placeholder="同学好，请输入6号数字虚号">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline"> <input type="radio"
                                                                name="gender" id="gender1_add_input" value="1"
                                                                checked="checked"> 男
                            </label> <label class="radio-inline"> <input type="radio"
                                                                         name="gender" id="gender2_add_input" value="2"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="employee_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row"  class="bg-success">
        <div class="col-md-12">
            <h3>
                <ul class="breadcrumb">
                    <li class="active">近期知识点整合 Demo_壹零</li>
                </ul>
            </h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12  pull-right">
            <button class="btn btn-default" id="employee_add_modal_btn">新增实习生
            </button>
            <button class="btn btn-default" id="employee_delete_all_btn">批量删除
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped" id="employee_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all" /></th>
                    <th>序号</th>
                    <th>花名</th>
                    <th>虚号(测试用)</th>
                    <th>性别</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <!-- 分页信息  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area"></div>

    </div>

</div>

<script type="text/javascript">
    var totalRecord, currentPage;

    $(function() {
        //启动数据加载
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url : "./getEmployees",
            data : "pn=" + pn,
            type : "GET",
            success : function(result) {
                //解析并显示员工数据
                build_employees_table(result);
                //解析并显示分页信息
                build_page_info(result);
                //解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_employees_table(result) {
        //清空内容 - 以防重复添加
        $("#employee_table tbody").empty();
        var employees = result.map.pageInfo.list;

        $
            .each(
                employees,
                function(index, item) {
                    var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                    var eId = $("<td></td>").append(item.eId);
                    var eName = $("<td></td>").append(item.eName);
                    var number = $("<td></td>").append(item.number);
                    var gender = $("<td></td>").append(
                        item.gender == '1' ? "男" : "女");
                    var department = $("<td></td>").append(
                        item.department.dName);

                    var editBtn = $("<button></button>").addClass(
                        "btn btn-Info btn-sm edit_btn").append(
                        $("<span></span>").addClass(
                            "glyphicon glyphicon-pencil"))
                        .append("编辑");
                    // 添加自定义的属性  - 表示当前员工id - 方便后期增删操作
                    editBtn.attr("employee-id", item.eId);
                    var delBtn = $("<button></button>")
                        .addClass(
                            "btn btn-danger btn-sm delete_btn")
                        .append(
                            $("<span></span>")
                                .addClass(
                                    "glyphicon glyphicon-trash"))
                        .append("删除");
                    delBtn.attr("del-id", item.eId);
                    var btnTd = $("<td></td>").append(editBtn)
                        .append(" ").append(delBtn);
                    $("<tr></tr>").append(checkBoxTd).append(eId)
                        .append(eName).append(number).append(
                        gender).append(department).append(
                        btnTd).appendTo(
                        "#employee_table tbody");
                });
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append(
            "同学好，您正处于第" + result.map.pageInfo.pageNum + "页    -  共"
            + result.map.pageInfo.pages + "页   -  总计"
            + result.map.pageInfo.total + "条记录");
        totalRecord = result.map.pageInfo.total;
        currentPage = result.map.pageInfo.pageNum;
    }

    function build_page_nav(result) {

        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        var firstPage = $("<li></li>").append(
            $("<a></a>").append("首页").attr("href", "#"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.map.pageInfo.hasPreviousPage == false) {
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            firstPage.click(function() {
                to_page(1);
            });
            prePage.click(function() {
                to_page(result.map.pageInfo.pageNum - 1);
            });
        }

        var nextPage = $("<li></li>")
            .append($("<a></a>").append("&raquo;"));
        var lastPage = $("<li></li>").append(
            $("<a></a>").append("尾页").attr("href", "#"));
        if (result.map.pageInfo.hasNextPage == false) {
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        } else {
            nextPage.click(function() {
                to_page(result.map.pageInfo.pageNum + 1);
            });
            lastPage.click(function() {
                to_page(result.map.pageInfo.pages);
            });
        }

        //添加首页或上一页提示
        ul.append(firstPage).append(prePage);
        $.each(result.map.pageInfo.navigatepageNums, function(index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.map.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function() {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页或尾页 提示
        ul.append(nextPage).append(lastPage);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //清空表单内容
    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框。
    $("#employee_add_modal_btn").click(function() {
        reset_form("#add_employee form");
        getDepartments("#add_employee select");
        $("#add_employee").modal({
            backdrop : "static"
        });
    });

    function getDepartments(ele) {
        $(ele).empty();
        $.ajax({
            url : "./getDepartments",
            type : "GET",
            success : function(result) {
                console.log(result.map.departmentInfo);
                $.each(result.map.departmentInfo, function() {
                    var optionEle = $("<option></option>").append(
                        this.dName).attr("value", this.dId);
                    optionEle.appendTo(ele);
                });
            }
        });

    }

    function add_validate() {
        //检验花名
        var employeeName = $("#employeeName_add_input").val();
        var regName = /(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(employeeName)) {
            show_validate_msg("#employeeName_add_input", "error",
                "同学好，花名应为2-5位中文");
            return false;
        } else {
            show_validate_msg("#employeeName_add_input", "success", "");
        }
        ;

        //检验虚号
        var number = $("#number_add_input").val();
        var regnumber = /^[0-9]{6}$/;
        if (!regnumber.test(number)) {
            show_validate_msg("#number_add_input", "error",
                "同学好，请输入您的6位数字虚号！");
            return false;
        } else {
            show_validate_msg("#number_add_input", "success", "");
        }
        return true;
    }

    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //从数据库检索  检测是否重复可用
    $("#employeeName_add_input").change(
        function() {
            var employeeName = this.value;
            $
                .ajax({
                    url : "./checkEmployee",
                    data : "employeeName=" + employeeName,
                    type : "POST",
                    success : function(result) {
                        if (result.status == 1) {
                            show_validate_msg(
                                "#employeeName_add_input",
                                "success", "花名可用");
                            $("#employee_save_btn").attr("ajax-va",
                                "success");
                        } else {
                            show_validate_msg(
                                "#employeeName_add_input",
                                "error", result.map.va_msg);
                            $("#employee_save_btn").attr("ajax-va",
                                "error");
                        }
                    }
                });
        });

    $("#employee_save_btn")
        .click(
            function() {
                if (!add_validate()) {
                    return false;
                }
                ;
                if ($(this).attr("ajax-va") == "error") {
                    return false;
                }
                $
                    .ajax({
                        url : "./employee",
                        type : "POST",
                        data : $("#add_employee form")
                            .serialize(),
                        success : function(result) {
                            if (result.status == 1) {
                                $("#add_employee").modal('hide');
                                to_page(totalRecord);
                            } else {
                                if (undefined != result.map.errorFields.number) {
                                    show_validate_msg(
                                        "#number_add_input",
                                        "error",
                                        result.map.errorFields.number);
                                }
                                if (undefined != result.map.errorFields.eName) {
                                    show_validate_msg(
                                        "#employeeName_add_input",
                                        "error",
                                        result.map.errorFields.eName);
                                }
                            }
                        }
                    });
            });

    $(document).on(
        "click",
        ".edit_btn",
        function() {
            getDepartments("#update_employee select");
            getEmployee($(this).attr("employee-id"));

            $("#employee_update_btn").attr("employee-id",
                $(this).attr("employee-id"));
            $("#update_employee").modal({
                backdrop : "static"
            });
        });

    function getEmployee(id) {
        $.ajax({
            url : "./employee/" + id,
            type : "GET",
            success : function(result) {
                var employee_Info = result.map.employeeInfo;
                console.log(employee_Info);
                $("#employeeName_update_static").text(employee_Info.eName);
                $("#number_update_input").val(employee_Info.number);
                $("#update_employee input[name=gender]").val(
                    [ employee_Info.gender ]);
                $("#update_employee select").val([ employee_Info.department.dId ]);
            }
        });
    }

    $("#employee_update_btn").click(function() {
        var number = $("#number_update_input").val();
        var regnumber = /^[0-9]{6}$/;
        if (!regnumber.test(number)) {
            show_validate_msg("#number_update_input", "error", "虚号格式不正确");
            return false;
        } else {
            show_validate_msg("#number_update_input", "success", "");
        }
        $.ajax({
            url : "./employee/" + $(this).attr("employee-id"),
            type : "PUT",
            data : $("#update_employee form").serialize(),
            success : function(result) {
                $("#update_employee").modal("hide");
                to_page(currentPage);
            }
        });
    });

    $(document).on("click", ".delete_btn", function() {
        var employeeName = $(this).parents("tr").find("td:eq(2)").text();
        var employeeId = $(this).attr("del-id");
        if (confirm("同学好,确认删除 " + employeeName + " 吗？")) {
            $.ajax({
                url : "./employee/" + employeeId,
                type : "DELETE",
                success : function(result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    // 多选 - 批量处理框
    $("#check_all").click(function() {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    $(document)
        .on(
            "click",
            ".check_item",
            function() {
                var flag = $(".check_item:checked").length == $(".check_item").length;
                $("#check_all").prop("checked", flag);
            });

    $("#employee_delete_all_btn").click(
        function() {
            var employeeNames = "";
            var del_idstr = "";
            $.each($(".check_item:checked"), function() {
                employeeNames += $(this).parents("tr").find("td:eq(2)")
                        .text()
                    + ",";
                del_idstr += $(this).parents("tr").find("td:eq(1)")
                        .text()
                    + "-";
            });
            employeeNames = employeeNames.substring(0,
                employeeNames.length - 1);
            del_idstr = del_idstr.substring(0, del_idstr.length - 1);
            if (confirm("同学好,确认删除 " + employeeNames + " 吗？")) {
                $.ajax({
                    url : "./employee/" + del_idstr,
                    type : "DELETE",
                    success : function(result) {
                        alert(result.msg);
                        to_page(currentPage);
                    }
                });
            }
        });
</script>
</body>
</html>
