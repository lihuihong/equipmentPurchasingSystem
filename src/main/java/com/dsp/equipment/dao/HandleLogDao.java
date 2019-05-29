package com.dsp.equipment.dao;

import com.dsp.equipment.entity.HandleLog;

import java.util.List;


public interface HandleLogDao {

    /**
     * 查询所有
     * @param log
     * @return
     */
    public List<HandleLog> list(HandleLog log);

    /**
     * 添加日志
     * @param log
     * @return
     */
    public Integer add(HandleLog log);


}
