package com.dsp.equipment.dao;

import com.dsp.equipment.entity.Department;

import java.util.List;

public interface DepartmentDAO {
    public List<Department> list(Department fun);


    public Integer insert(Department fun);


    public Integer update(Department fun);


    public Integer delete(String id);
}
