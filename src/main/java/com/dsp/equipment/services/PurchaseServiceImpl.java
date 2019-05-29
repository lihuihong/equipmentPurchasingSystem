package com.dsp.equipment.services;

import com.dsp.equipment.dao.PurchaseDAO;
import com.dsp.equipment.entity.Purchase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PurchaseServiceImp")
public class PurchaseServiceImpl  {
    @Autowired
    private PurchaseDAO purchaseDAO;

    public List<Purchase> list(Purchase fun) {
        return purchaseDAO.list(fun);
    }

    public Integer insert(Purchase fun) {
        return purchaseDAO.insert(fun);
    }


    public Integer update(Purchase fun) {
        return purchaseDAO.update(fun);
    }

    public Integer delete(String id) {
        return purchaseDAO.delete(id);
    }

}