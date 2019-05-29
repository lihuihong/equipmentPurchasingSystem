package com.dsp.equipment.services;


import com.dsp.equipment.dao.EquipmentDAO;
import com.dsp.equipment.entity.Equipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("EquipmentServiceImpl")
public class EquipmentServiceImpl {
    @Autowired
    private EquipmentDAO equipmentDAO;

    public List<Equipment> list(Equipment fun) {
        return equipmentDAO.list(fun);
    }

    public List<Equipment> all(Equipment fun) {
        return equipmentDAO.all(fun);
    }

    public List<Equipment> listIsEnd(Equipment fun) {
        return equipmentDAO.listIsEnd(fun);
    }

    public List<Equipment> listIsOk(Equipment fun) {
        return equipmentDAO.listIsOk(fun);
    }

    public Integer insert(Equipment fun) {
        return equipmentDAO.insert(fun);
    }

    public Integer update(Equipment fun) {
        return equipmentDAO.update(fun);
    }

    public Integer delete(String id) {
        return equipmentDAO.delete(id);
    }

}