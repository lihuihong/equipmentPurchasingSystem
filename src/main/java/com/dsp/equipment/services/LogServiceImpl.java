package com.dsp.equipment.services;
import com.dsp.equipment.dao.HandleLogDao;
import com.dsp.equipment.dao.LoginLogDao;
import com.dsp.equipment.entity.HandleLog;
import com.dsp.equipment.entity.LoginLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 用户Service层
 */
@Service("LogServiceImpl")
public class LogServiceImpl {

    @Autowired
    private HandleLogDao handleLogDao;

    @Autowired
    private LoginLogDao loginLogDao;

    public List<HandleLog> list(HandleLog log) {
        return handleLogDao.list(log);
    }

    /**
     * 添加操作日志
     * @param log
     * @return
     */
    public Integer add(HandleLog log){
        return handleLogDao.add(log);
    }


    public List<LoginLog> list(LoginLog log) {
        return loginLogDao.list(log);
    }

    /**
     * 添加操作日志
     * @param log
     * @return
     */
    public Integer add(LoginLog log){
        return loginLogDao.add(log);
    }

}
