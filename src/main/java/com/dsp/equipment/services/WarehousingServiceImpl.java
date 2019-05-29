package com.dsp.equipment.services;

import com.dsp.equipment.dao.WarehousingDAO;
import com.dsp.equipment.entity.Warehousing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("WarehousingServiceImpl")
public class WarehousingServiceImpl {
    @Autowired
    private WarehousingDAO warehousingDAO;

    public List<Warehousing> list(Warehousing fun) {
        return warehousingDAO.list(fun);
    }

    public Integer insert(Warehousing fun) {
        return warehousingDAO.insert(fun);
    }

    public Integer update(Warehousing fun) {
        return warehousingDAO.update(fun);
    }

    public Integer delete(String id) {
        return warehousingDAO.delete(id);
    }

}