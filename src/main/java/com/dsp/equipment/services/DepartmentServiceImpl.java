package com.dsp.equipment.services;

import com.dsp.equipment.dao.DepartmentDAO;
import com.dsp.equipment.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import com.dsp.equipment.dao.EquipmentDAO;
import com.dsp.equipment.entity.Equipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("DepartmentServiceImpl")
public class DepartmentServiceImpl {


    @Autowired
    private DepartmentDAO departmentDAO;

    public List<Department> list(Department fun) {
        return departmentDAO.list(fun);
    }
    public Integer insert(Department fun) {
        return departmentDAO.insert(fun);
    }

    public Integer update(Department fun) {
        return departmentDAO.update(fun);
    }

    public Integer delete(String id) {
        return departmentDAO.delete(id);
    }
}
