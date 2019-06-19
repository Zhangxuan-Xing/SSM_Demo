package com.yl.entity;

/**
 * 部门
 */
public class Department {
    //部门ID
    private Integer dId;

    //部门名
    private String dName;

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName == null ? null : dName.trim();
    }
}