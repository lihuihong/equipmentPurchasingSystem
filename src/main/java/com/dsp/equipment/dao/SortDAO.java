package com.dsp.equipment.dao;



import com.dsp.equipment.entity.Sort;

import java.util.List;

public interface SortDAO  {

    public List<Sort> list(Sort fun);

    /**
     * 添加分类信息
     * @param fun
     * @return
     */
    public Integer insert(Sort fun);

    /**
     * 修改分类信息
     * @param fun
     * @return
     */
    public Integer update(Sort fun);

    /**
     * 删除分类信息
     * @param id
     * @return
     */
    public Integer delete(String id);
}