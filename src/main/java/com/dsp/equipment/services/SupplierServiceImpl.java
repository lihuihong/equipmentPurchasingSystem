package com.dsp.equipment.services;

import com.dsp.equipment.dao.SupplierDAO;
import com.dsp.equipment.entity.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("SupplierServiceImpl")
public class SupplierServiceImpl  {
    @Autowired
    private SupplierDAO supplierDAO;

    public List<Supplier> list(Supplier fun) {
        return supplierDAO.list(fun);
    }

    public Integer insert(Supplier fun) {
        return supplierDAO.insert(fun);
    }

    public Integer update(Supplier fun) {
        return supplierDAO.update(fun);
    }

    public Integer delete(String id) {
        return supplierDAO.delete(id);
    }

}