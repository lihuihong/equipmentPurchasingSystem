package com.dsp.equipment.dao;


import com.dsp.equipment.entity.Purchase;

import java.util.List;

public interface PurchaseDAO {
    public List<Purchase> list(Purchase fun);

    /**
     * 添加分类信息
     * @param fun
     * @return
     */
    public Integer insert(Purchase fun);

    /**
     * 修改分类信息
     * @param fun
     * @return
     */
    public Integer update(Purchase fun);

    /**
     * 删除分类信息
     * @param id
     * @return
     */
    public Integer delete(String id);
}