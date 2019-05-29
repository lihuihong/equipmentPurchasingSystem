package com.dsp.equipment.dao;


import com.dsp.equipment.entity.Supplier;

import java.util.List;

public interface SupplierDAO  {

    public List<Supplier> list(Supplier fun);

    /**
     * 添加分类信息
     * @param fun
     * @return
     */
    public Integer insert(Supplier fun);

    /**
     * 修改分类信息
     * @param fun
     * @return
     */
    public Integer update(Supplier fun);

    /**
     * 删除分类信息
     * @param id
     * @return
     */
    public Integer delete(String id);
}