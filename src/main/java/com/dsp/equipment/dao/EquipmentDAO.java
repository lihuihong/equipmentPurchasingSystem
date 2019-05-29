package com.dsp.equipment.dao;


import com.dsp.equipment.entity.Equipment;

import java.util.List;

public interface EquipmentDAO  {

    public List<Equipment> list(Equipment fun);
    public List<Equipment> listIsEnd(Equipment fun);
    public List<Equipment> listIsOk(Equipment fun);

    public List<Equipment> all(Equipment fun);

    /**
     * 添加设备信息
     * @param fun
     * @return
     */
    public Integer insert(Equipment fun);

    /**
     * 修改设备信息
     * @param fun
     * @return
     */
    public Integer update(Equipment fun);

    /**
     * 删除设备信息
     * @param id
     * @return
     */
    public Integer delete(String id);
}