package com.dsp.equipment.services;

import com.dsp.equipment.dao.SortDAO;
import com.dsp.equipment.entity.Sort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("SortServiceImpl")
public class SortServiceImpl {
    @Autowired
    private SortDAO sortDAO;


    public List<Sort> list(Sort fun) {
        return sortDAO.list(fun);
    }

    public Integer insert(Sort fun) {
        return sortDAO.insert(fun);
    }

    public Integer update(Sort fun) {
        return sortDAO.update(fun);
    }

    public Integer delete(String id) {
        return sortDAO.delete(id);
    }


}