package com.dsp.equipment.dao;



import com.dsp.equipment.entity.Warehousing;

import java.util.List;

public interface WarehousingDAO  {

    public List<Warehousing> list(Warehousing fun);

    /**
     * 添加分类信息
     * @param fun
     * @return
     */
    public Integer insert(Warehousing fun);

    /**
     * 修改分类信息
     * @param fun
     * @return
     */
    public Integer update(Warehousing fun);

    /**
     * 删除分类信息
     * @param id
     * @return
     */
    public Integer delete(String id);
}