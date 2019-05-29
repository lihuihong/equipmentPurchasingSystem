package com.dsp.equipment.dao;

import com.dsp.equipment.entity.LoginLog;

import java.util.List;


public interface LoginLogDao {

    /**
     * 查询所有
     * @param log
     * @return
     */
    public List<LoginLog> list(LoginLog log);

    /**
     * 添加日志
     * @param log
     * @return
     */
    public Integer add(LoginLog log);


}
