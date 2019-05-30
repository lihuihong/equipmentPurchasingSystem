package com.dsp.equipment.entity;

import java.util.Date;

/**
 * 用户实体类
 */
public class User {
    //用户编号
    private Integer id;
    //用户名
    private String userName;
    //密码
    private String password;
    //真实姓名
    private String trueName;
    //邮箱
    private String email;
    //电话
    private String phone;

    private String addTime;

    private Integer roleId;
    private String departmentId;
    private String departmentId1;

    private Role role;

    public String getDepartmentId1() {
        return departmentId1;
    }

    public void setDepartmentId1(String departmentId1) {
        this.departmentId1 = departmentId1;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
